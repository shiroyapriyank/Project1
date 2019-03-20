package com.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Restrictions;

import com.model.ProductDetails;
import com.model.UserDetails;

public class Dao {

	StandardServiceRegistry stdReg = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	Metadata dat = new MetadataSources(stdReg).getMetadataBuilder().build();
	SessionFactory sessionFactory = dat.getSessionFactoryBuilder().build();
	// private SessionFactory sessionFactory = Util.getSessionFactory();
	Session session = null;
	Transaction tx = null;

	public Integer addUser(UserDetails user) {
		try {
			Integer id = Integer.valueOf(0);
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			id = (Integer) session.save(user);
			tx.commit();
			return id;
		} catch (Exception e) {
			tx.rollback();
			System.out.println(e);
			return 0;
		} finally {
			session.close();
		}
	}

	public String checkUserName(String userName) {
		try {
			session = sessionFactory.openSession();
			List<UserDetails> list = session.createCriteria(UserDetails.class)
					.add(Restrictions.eq("userName", userName)).list();
			String error = "";
			if (list != null && list.size() > 0) {
				error = "<div class='alert alert-dismissable alert-warning'>"
						+ "<i class='fa fa-times'></i>&nbsp; UserName Already Exist."
						+ "<button type=button class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
						+ "</div>";
				return error;
			}
			return error;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public String doLogin(UserDetails userDetail) {
		try {
			session = sessionFactory.openSession();
			UserDetails userinFo = new UserDetails();
			List<UserDetails> userList = session.createCriteria(UserDetails.class)
					.add(Restrictions.eq("userName", userDetail.getUserName()))
					.add(Restrictions.eq("userPassword", userDetail.getUserPassword())).list();
			if (userList != null && userList.size() > 0) {
				userinFo = userList.get(0);
				return "success," + userinFo.getUserId() + "," + userinFo.getUserName() + "," + userinFo.getUserEmail();
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		} finally {
			session.close();
		}
	}

	public String checkEmail(String email) {
		try {
			session = sessionFactory.openSession();
			List<UserDetails> list = session.createCriteria(UserDetails.class).add(Restrictions.eq("userEmail", email))
					.list();
			String error = "";
			if (list != null && list.size() > 0) {
				error = "<div class='alert alert-dismissable alert-warning'>"
						+ "<i class='fa fa-times'></i>&nbsp; Email Address Already Exist."
						+ "<button type=button class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
						+ "</div>";
				return error;
			}
			return error;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public List<ProductDetails> getAllItems() {

		try {
			session = sessionFactory.openSession();
			List<ProductDetails> product = session.createCriteria(ProductDetails.class).list();
			return product;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public String getCartItems(String[] name) {
		try {
			session = sessionFactory.openSession();
			List<ProductDetails> productList = null;
			ProductDetails product = new ProductDetails();
			Iterator<ProductDetails> it = null;
			String productDetailDesigns = "<table class=\'table table-bordered\' id='productTable'><thead>" + "<tr>"
					+ "<th>Product_Name</th>" + "<th>Description</th>" + "<th>Price</th>" + "<th>Quantity</th>"
					+ "</tr>" + "</thead>" + "<tbody>";
			int[] number = new int[name.length];
			Integer total = Integer.valueOf(0);
			for (int i = 0; i < name.length; i++) {
				number[i] = Integer.parseInt(name[i]);
				System.out.println(name[i]);
				productList = session.createCriteria(ProductDetails.class).add(Restrictions.eq("productId", number[i]))
						.list();
				it = productList.iterator();
				while (it.hasNext()) {
					product = it.next();
					total = total + product.getProductPrice();
					productDetailDesigns = productDetailDesigns.concat("<tr>" + "<td>" + product.getProductName()
							+ "</td>" + "<td>" + product.getProductDescription() + "</td>"
							+ "<td><input type='checkbox' class='hidden' name='total[]' checked value='"
							+ product.getProductPrice() + "'>" + product.getProductPrice() + "</td>" + "<td>1</td>"
							+ "<td><input type='button' value='Delete Item' /></td>" + "</tr>");
				}
			}
			productDetailDesigns = productDetailDesigns.concat(
					"<tr><td colspan='3'>Total</td><td colspan='2'><div id='total'></div></td></tbody></table>");
			return productDetailDesigns;
		} catch (Exception e) {
			e.printStackTrace();
			return "faill";
		} finally {
			session.close();
		}
	}

	public List<ProductDetails> viewProductById(Integer id) {
		try {
			session = sessionFactory.openSession();
			List<ProductDetails> list = session.createCriteria(ProductDetails.class).add(Restrictions.eq("productId", id))
					.list();
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public String updateProduct(ProductDetails product) {
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.update(product);
			tx.commit();
			return "success";
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return "fail";
		} finally {
			session.close();
		}
	}

	public String deleteProduct(ProductDetails product) {
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.delete(product);
			tx.commit();
			return "success";
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	public Integer addProduct(ProductDetails product) {
		try {
			Integer id = Integer.valueOf(0);
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			id = (Integer) session.save(product);
			tx.commit();
			return id;
		} catch (Exception e) {
			tx.rollback();
			System.out.println(e);
			return 0;
		} finally {
			session.close();
		}
	}

	public List<UserDetails> getAllUser() {
		try {
			session = sessionFactory.openSession();
			List<UserDetails> user = session.createCriteria(UserDetails.class).list();
			return user;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

}
