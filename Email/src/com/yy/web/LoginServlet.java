package com.yy.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yy.entity.Email;
import com.yy.entity.User;
import com.yy.service.EmailService;
import com.yy.service.UserService;
import com.yy.service.impl.EmailServiceImpl;
import com.yy.service.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
	EmailService emailService = new EmailServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		User user = userService.queryUser(userName, password);
		if (user == null) {
			req.setAttribute("message", "’ÀªßªÚ√‹¬Î¥ÌŒÛ");
			req.getRequestDispatcher("login.jsp");
		}else {
			req.getSession().setAttribute("user", user);
			List<Email> list = emailService.queryMailList(user.getEmail());
			req.getSession().setAttribute("emailList", list);
			resp.sendRedirect("mail.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	

}
