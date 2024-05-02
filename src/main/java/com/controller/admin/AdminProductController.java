package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDAO;
import com.dao.ProductDAO;
import com.entity.Category;
import com.entity.Product;
import com.utils.AppConstants;

@WebServlet("/admin-product")
@MultipartConfig
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDAO productDAO;
	private CategoryDAO cateDAO;
       
    public AdminProductController() {
        super();
    }
   
	@Override
	public void init() throws ServletException {
		productDAO = new ProductDAO();
		cateDAO = new CategoryDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		String view = "";
		
		if(action != null) {
			if (action.equals("add")) {
				view = "/views/admin/add_product.jsp";
			} else if (action.equals("edit")) {
				String idP = request.getParameter("idP");
				Product p = productDAO.findById(Integer.parseInt(idP));
				request.setAttribute("product", p);
				view = "/views/admin/edit_product.jsp";
			} 
			else if(action.equals("view")) {
				String idP = request.getParameter("idP");
				Product p = productDAO.findById(Integer.parseInt(idP));
				request.setAttribute("product", p);
				
				view = "/views/admin/details_product.jsp";
			}
			else if(action.equals("delete")) {
				doDelete(request, response);
				return;
			}
			
			if(action.equals("add") || action.equals("edit")) {
				List<Category> categories = cateDAO.getAllCategories();
				request.setAttribute("categories", categories);				
			}
		}
		else {
			int totalItems = productDAO.getTotalItem();
			List<Product> products = productDAO.getAllProducts(page, AppConstants.defaultRecordsPerPage);
			
			session.setAttribute("currentPage", page);
			request.setAttribute("totalPages", Math.ceil((totalItems / (double) AppConstants.defaultRecordsPerPage)));
			request.setAttribute("itemsPerPage", AppConstants.defaultRecordsPerPage);
			request.setAttribute("products", products);
			
			view = "/views/admin/list_product.jsp";
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(view);
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			String type = req.getParameter("type");
			
			if(type.equals("add")) {
				String name = req.getParameter("name");
				String brand = req.getParameter("brand");
				String price = req.getParameter("price");
				String description = req.getParameter("description");
				String stock = req.getParameter("stock");
				String isNew = req.getParameter("isNew");
				String categoryId = req.getParameter("categoryId");
				
				Part part = req.getPart("image");
				String fileName = part.getSubmittedFileName();
				
				Category c = new Category(Integer.parseInt(categoryId));
				
				Product p = new Product();
				p.setName(name);
				p.setBrand(brand);
				p.setImage(fileName);
				p.setPrice(Integer.parseInt(price));
				p.setDescription(description);
				p.setStock(Boolean.valueOf(stock));
				p.setNew(Boolean.valueOf(isNew));
				p.setCategory(c);
				
				boolean f = productDAO.addProduct(p);
				
				HttpSession sesssion = req.getSession();
				RequestDispatcher rd = req.getRequestDispatcher("/views/admin/add_product.jsp");
				
				if(f) {
					sesssion.setAttribute("succMsg", "Thêm thành công!");
					rd.forward(req, resp);
				}
				else {
					sesssion.setAttribute("failedMsg", "Thêm thất bại có lỗi xảy ra!");
					rd.forward(req, resp);
				}
			}
			else if(type.equals("edit")) {
				doPut(req, resp);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String id = req.getParameter("pId");
			String name = req.getParameter("name");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String description = req.getParameter("description");
			String stock = req.getParameter("stock");
			String isNew = req.getParameter("isNew");
			String categoryId = req.getParameter("categoryId");
			
			Part part = req.getPart("image");
			String fileName = part.getSubmittedFileName();
			
			Category c = new Category(Integer.parseInt(categoryId));
			
			Product p = new Product();
			p.setId(Integer.parseInt(id));
			p.setName(name);
			p.setBrand(brand);
			if(fileName.equals("")) {
				p.setImage(req.getParameter("oldImage"));
			}
			else {
				p.setImage(fileName);
			}
			p.setPrice(Integer.parseInt(price));
			p.setDescription(description);
			p.setStock(Boolean.valueOf(stock));
			p.setNew(Boolean.valueOf(isNew));
			p.setCategory(c);
			
			boolean f = productDAO.updateProduct(p);
			
			HttpSession session = req.getSession();
			
			
			if(f) {
				session.setAttribute("succMsg", "Cập nhập thành công sản phẩm có id " + id + "!");
			} else {
				session.setAttribute("failedMsg", "Lỗi cập nhập sản phẩm thất bại!");
			}
			
			int page = (Integer) session.getAttribute("currentPage");
			
			resp.sendRedirect(req.getContextPath() + "/admin-product?page=" + page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String pId = req.getParameter("pId");
			
			boolean f = productDAO.deleteProductById(Integer.parseInt(pId));
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Đã xóa sản phẩm có id là: " + pId + "!");
			}
			else {
				session.setAttribute("failedMsg", "Xóa không thành công có lỗi xảy ra!");
			}
			
			resp.sendRedirect(req.getContextPath() + "/admin-product");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}

