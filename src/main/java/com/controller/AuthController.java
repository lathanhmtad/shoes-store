package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.entity.User;

@WebServlet(urlPatterns = {"/dang-nhap", "/dang-ky", "/dang-xuat"})
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO;
	
	public AuthController() {
		super();
	}
	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO();
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String path = request.getServletPath();
		String view = "";
		
		if(path.equals("/dang-nhap")) {
			view = "/views/web/login.jsp";
		}
		else if(path.equals("/dang-ky")) {
			view = "/views/web/register.jsp";
		}
		else if(path.equals("/dang-xuat")) {
			session.removeAttribute("userObj");
			session.setAttribute("succMsg", "Đăng xuất thành công");
			response.sendRedirect(request.getContextPath() + "/trang-chu");
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			HttpSession session = req.getSession();

			String path = req.getServletPath();
			
			if(path.equals("/dang-nhap")) {

				String email = req.getParameter("email");
				String password = req.getParameter("password");
				
				User u = userDAO.login(email, password);
				
				if(u != null) {
					session.setAttribute("userObj", u);
					session.setAttribute("succMsg", "Đăng nhập thành công");
					resp.sendRedirect(req.getContextPath() + "/trang-chu");
				}
				else {
					session.setAttribute("failedMsg", "Email hoặc mật khẩu không chính xác!");
					resp.sendRedirect(req.getContextPath() + "/dang-nhap");
				}
			}
			else if(path.equals("/dang-ky")) {
				String fullName = req.getParameter("fullName");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				// String repeartPassword =req.getParameter("repeatPassword");
				
				boolean f = userDAO.register(fullName, email, password);
				if(f) {
					session.setAttribute("succMsg", "Đăng ký thành công");
					resp.sendRedirect(req.getContextPath() + "/dang-ky");
				} else {
					session.setAttribute("failedMsg", "Đăng ký thất bại vui lòng thử lại!");
					resp.sendRedirect(req.getContextPath() + "/dang-ky");
				}
			}
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
