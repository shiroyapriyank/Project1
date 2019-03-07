package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.model.UserDetails;
//this is
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao dao = new Dao();
		String actionCode = request.getParameter("actionCode");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		System.out.println(actionCode);
		String[] userInfo = (String[]) null;
		
		
		if (actionCode.equals("login")) {
			String status = null;
			HttpSession userSession = null;
			String name = request.getParameter("userName");
			String password = request.getParameter("userPassword");
			System.out.println(name +" " +password);
			UserDetails user = new UserDetails();
			user.setUserName(name);
			user.setUserPassword(password);
			status=dao.doLogin(user);
			System.out.println(status);
			if(status.contains("success")) {
				userSession = request.getSession();
				userInfo = status.split(",");
				userSession.setAttribute("userID", userInfo[1]);
				userSession.setAttribute("userName", userInfo[2]);
				userSession.setAttribute("userEmail", userInfo[3]);
				System.out.println(request.getAttribute("userName"));
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
			}
		}
		
		if(actionCode.equals("checkUserName")) {
			String name = request.getParameter("userName");
			out.print(dao.checkUserName(name));
		}
		
		if (actionCode.equals("register")) {
			System.out.println("Success");
			Integer id = Integer.valueOf(0);
			String name = request.getParameter("userName");
			String password = request.getParameter("userPassword");
			String email = request.getParameter("userEmail");
			UserDetails user = new UserDetails();
			user.setUserId(id);
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPassword(password);
			id = dao.addUser(user);
			if(id>0) {
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}
	}

}
