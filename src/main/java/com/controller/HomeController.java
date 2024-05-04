package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDAO;
import com.dao.ProductDAO;
import com.entity.Category;
import com.entity.Product;

@WebServlet("/trang-chu")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProductDAO pDAO;
	private CategoryDAO cateDAO;
	
    public HomeController() {
        super();
    }
    
	@Override
	public void init() throws ServletException {
		pDAO = new ProductDAO();
		cateDAO = new CategoryDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			List<Product> productNewList = pDAO.getAllProductsIsNew(false);
			List<Product> productList = pDAO.getAllProducts(1, 4);
			List<Category> cateList = cateDAO.getAllCategories();
			
			session.setAttribute("cateList", cateList);
			
			request.setAttribute("productNewList", productNewList);
			request.setAttribute("productList", productList);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/web/home.jsp");
			requestDispatcher.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
