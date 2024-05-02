package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;
import com.entity.Product;

@WebServlet("/chi-tiet-san-pham")
public class ProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProductDAO pDAO;
	
    public ProductDetailsController() {
        super();
    }
    
	@Override
	public void init() throws ServletException {
		pDAO = new ProductDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pId = request.getParameter("pId");
			Product p = pDAO.findById(Integer.parseInt(pId));
			
			request.setAttribute("productDetails", p);
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/details_product.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
