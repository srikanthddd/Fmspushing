package com.fms.dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.model.Feedback;
import com.fms.model.User;

@Repository
@Transactional
public class FmsDaoImpl implements FmsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<User> loginCheck(User user) {
		System.out.println("loginCheck method");
		String username = user.getUsername();
		String password = user.getPassword();
		List<User> use = (List<User>) sessionFactory.getCurrentSession()
				.createQuery("from User where username='"+username+"' and password='"+password+"'").list();
		// return user;
		System.out.println(use);
		return use;
	}

	public int saveUser(User user) {

		System.out.println("Save user method in FmsDaoImpl" + user.getUsername() + " " + user.getPassword());
		int id = (int) sessionFactory.getCurrentSession().save(user);
		return id;

	}

	public int saveFeedback(Feedback feedback) {

		System.out.println("SaveFeedback method in FmsDaoImpl  " + feedback.getFeedbackGiven());
		/*sessionFactory.getCurrentSession().save(feedback.getUser().getId());*/
		/*int id = (int) sessionFactory.getCurrentSession().save(feedback);*/
		//sessionFactory.getCurrentSession().save(user.getId());
		//feedback.setUser(user);
		//user.getFb().add(feedback);
		int id = (int) sessionFactory.getCurrentSession().save(feedback);
		return id;

	}

	public String updateUserProfile(User user,User userFromSession) {
		/*System.out.println("update User profile in FmsDaoImpl"+user);
		Query query=(Query) sessionFactory.getCurrentSession().createQuery("update User set email='"+user.getEmail()+"'and phone='"+user.getPhone()+"'and location='"+user.getLocation()+"' + where username='"+userFromSession.getEmail()+"' and password='"+userFromSession.getEmail()+"'");
		System.out.println(query);
        int result =  query.executeUpdate();*/
		User userFromdb = (User) sessionFactory.getCurrentSession().get(User.class, userFromSession.getId());
		userFromdb.setEmail(user.getEmail());
		userFromdb.setPhone(user.getPhone());
		userFromdb.setLocation(user.getLocation());
		sessionFactory.getCurrentSession().update(userFromdb);
		System.out.println("Successful");
        return "Successful";
	}

	public String updatePassword(String cpassword, User userFromSession) {
		
		User userFromdb = (User) sessionFactory.getCurrentSession().get(User.class, userFromSession.getId());
		userFromdb.setPassword(cpassword);
		sessionFactory.getCurrentSession().update(userFromdb);
		System.out.println("Password Succesfully updated");
		
		return "Succesful";
	}

	public List<Feedback> getAllFb(int userid) {
		
		List<Feedback> feedbackList=sessionFactory.getCurrentSession().createQuery("from Feedback where user.id='"+userid+"'").list();
		System.out.println(feedbackList);
		return feedbackList;
	}

	public void updateFeedback(Feedback feedback) {
		
		Feedback fbFromdb = (Feedback) sessionFactory.getCurrentSession().get(Feedback.class, feedback.getFeedbackId());
		fbFromdb.setFeedbackGiven(feedback.getFeedbackGiven());
		sessionFactory.getCurrentSession().update(fbFromdb);
		System.out.println("Update is done in Fms DaoImpl");
	}

	public void deleteFb(int feedbackId) {
		Feedback fb = (Feedback) sessionFactory.getCurrentSession().load(Feedback.class, feedbackId);
		sessionFactory.getCurrentSession().delete(fb);
		System.out.println("Feedback Succesfully deleted");
	}
	

}
