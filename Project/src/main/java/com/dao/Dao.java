package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Restrictions;

import com.util.*;
import com.model.UserDetails;


public class Dao {

	StandardServiceRegistry stdReg = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	Metadata dat = new MetadataSources(stdReg).getMetadataBuilder().build();
	SessionFactory sessionFactory = dat.getSessionFactoryBuilder().build();
	//private SessionFactory sessionFactory = Util.getSessionFactory();
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
			List<UserDetails> list = session.createCriteria(UserDetails.class).add(Restrictions.eq("userName", userName)).list();
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
				return "success," + userinFo.getUserId() + "," + userinFo.getUserName()+","+userinFo.getUserEmail();
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

	

}
