package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.ProductDAO;
import com.entity.Product;

@WebServlet("/tim-kiem")
public class WebSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProductDAO pDAO;
	
    public WebSearchController() {
        super();
    }
    
	@Override
	public void init() throws ServletException {
		pDAO = new ProductDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
				
			String searchKeyword = req.getParameter("search");
			
			List<Product> products = pDAO.search(searchKeyword);
			
			req.setAttribute("productList", products);
			req.setAttribute("searchKeyword", searchKeyword);
			
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/web/results_search.jsp");
			requestDispatcher.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
