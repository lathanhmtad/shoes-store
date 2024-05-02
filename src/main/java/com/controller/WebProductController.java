package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDAO;
import com.entity.Product;
import com.utils.AppConstants;

@WebServlet(urlPatterns = {"/san-pham", "/san-pham-moi"})
public class WebProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProductDAO pDAO;
	
    public WebProductController() {
        super();
    }
    
	@Override
	public void init() throws ServletException {
		pDAO = new ProductDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getServletPath();
			
			if(path.equals("/san-pham")) {
				HttpSession session = request.getSession();
				
				int cateId = Integer.parseInt(request.getParameter("cateId"));
				int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
				int totalItems = -1;
				if(cateId == 0) {
					totalItems = pDAO.getTotalItem();
				}
				else {
					totalItems = pDAO.getTotalItem(cateId);
				}
				List<Product> products = pDAO.findByCategoryId(cateId, page);
				
				session.setAttribute("currentPage", page);
				request.setAttribute("currentCateId", cateId);
				request.setAttribute("totalPages", Math.ceil((totalItems / (double) AppConstants.defautRecordsWebPerPage)));
				request.setAttribute("itemsPerPage", AppConstants.defautRecordsWebPerPage);
				request.setAttribute("productList", products);
				
				RequestDispatcher rd = request.getRequestDispatcher("/views/web/list_product.jsp");
				rd.forward(request, response);
			}
			else if(path.equals("/san-pham-moi")) {
				List<Product> newProductList = pDAO.getAllProductsIsNew(true);
				request.setAttribute("newProductList", newProductList);
				RequestDispatcher rd = request.getRequestDispatcher("/views/web/new_product_list.jsp");
				rd.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
