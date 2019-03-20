package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.model.ProductDetails;
import com.model.UserDetails;

//this is
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			System.out.println(name + " " + password);
			if (name.equals("admin") && password.equals("admin")) {
				request.getSession(false).setAttribute("userName", "Admin");
				request.getRequestDispatcher("/Index.jsp").forward(request, response);
			} else {
				UserDetails user = new UserDetails();
				user.setUserName(name);
				user.setUserPassword(password);
				status = dao.doLogin(user);
				System.out.println(status);
				if (status.contains("success")) {
					userSession = request.getSession();
					userInfo = status.split(",");
					userSession.setAttribute("userID", userInfo[1]);
					userSession.setAttribute("userName", userInfo[2]);
					userSession.setAttribute("userEmail", userInfo[3]);
					List<ProductDetails> list = dao.getAllItems();
					request.getSession(false).setAttribute("productDetails", list);
					System.out.println(userInfo[2]);
					System.out.println(userInfo[1]);
					request.getRequestDispatcher("/Home.jsp").forward(request, response);
				} else if (status.contains("fail")) {
					request.getRequestDispatcher("/Login.jsp?failed=1").forward(request, response);
				}
			}
		}

		if (actionCode.equals("checkUserName")) {
			String name = request.getParameter("userName");
			out.print(dao.checkUserName(name));
		}
		if (actionCode.equals("checkEmail")) {
			String email = request.getParameter("userEmail");
			out.print(dao.checkEmail(email));
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
			if (id > 0) {
				request.getRequestDispatcher("/Login.jsp?success=1").forward(request, response);
			}
		}
		if (actionCode.equals("logOut")) {
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma", "no-cache");
			request.getSession(false).invalidate();
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}

		if (actionCode.equals("addToCart")) {
			String[] name = request.getParameterValues("userId[]");
			if (name != null) {
				out.print(dao.getCartItems(name));
			} else {
				System.out.println("Arrray is null");
			}
		}


		if (actionCode.equals("getProduct")) {
			List<ProductDetails> list = dao.getAllItems();
			if (list != null) {
				request.getSession(false).setAttribute("productList", list);
				request.getRequestDispatcher("/viewProduct.jsp").forward(request, response);
			}
		}

		if (actionCode.equals("showProduct")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			List<ProductDetails> list = dao.viewProductById(id);
			if (list != null) {
				request.getSession(false).setAttribute("productListById", list);
				request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
			}
		}

		if (actionCode.equals("updateProduct")) {
			String status = null;
			Integer id = Integer.parseInt(request.getParameter("id"));
			String productName = request.getParameter("productName");
			String productDescription = request.getParameter("productDescription");
			Integer productPrice = Integer.parseInt(request.getParameter("productPrice"));
			ProductDetails product = new ProductDetails();
			product.setProductId(id);
			product.setProductDescription(productDescription);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			status = dao.updateProduct(product);
			if (status.equals("success")) {
				List<ProductDetails> list = dao.getAllItems();
				if (list != null) {
					request.getSession(false).setAttribute("productList", list);
					request.getRequestDispatcher("/viewProduct.jsp").forward(request, response);
				}
			}
		}

		if (actionCode.equals("deleteProduct")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			ProductDetails product = new ProductDetails();
			String status = null;
			product.setProductId(id);
			status = dao.deleteProduct(product);
			if (status.equals("success")) {
				List<ProductDetails> list = dao.getAllItems();
				if (list != null) {
					request.getSession(false).setAttribute("productList", list);
					request.getRequestDispatcher("/viewProduct.jsp").forward(request, response);
				}
			}
		}
		if (actionCode.equals("addProduct")) {
			Integer id = Integer.valueOf(0);
			Integer statusId = Integer.valueOf(0);
			String productName = request.getParameter("productName");
			String productDescription = request.getParameter("productDescription");
			Integer productPrice = Integer.parseInt(request.getParameter("productPrice"));
			ProductDetails product = new ProductDetails();
			product.setProductId(id);
			product.setProductDescription(productDescription);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			statusId = dao.addProduct(product);
			if (statusId > 0) {
				List<ProductDetails> list = dao.getAllItems();
				if (list != null) {
					request.getSession(false).setAttribute("productList", list);
					request.getRequestDispatcher("/viewProduct.jsp").forward(request, response);
				}
			}
		}
		
		if(actionCode.equals("viewUser")) {
			List<UserDetails> list = dao.getAllUser();
			if(list != null) {
				request.getSession(false).setAttribute("listOfUser", list);
				request.getRequestDispatcher("/viewUser.jsp").forward(request, response);
			}
		}
		
	}

}
