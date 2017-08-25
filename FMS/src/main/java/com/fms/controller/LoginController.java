package com.fms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fms.dao.FmsDaoImpl;
import com.fms.model.Feedback;
import com.fms.model.User; 

@Controller
@EnableAspectJAutoProxy(proxyTargetClass = true)
//@SessionAttributes("userSession")
public class LoginController {
	
	@Autowired
	@Qualifier("fmsDaoimpl")
	FmsDaoImpl fmsDaoimpl; /*=new FmsDaoImpl();*/

	@RequestMapping(value = "/login" ,method = RequestMethod.GET)
	public ModelAndView loginUser(ModelAndView model) throws IOException {
		System.out.println("loginUser");
		model.setViewName("loginNew");
		return model;
	}
	@RequestMapping(value = "/loginMethod" , method=RequestMethod.POST)
	public ModelAndView validateLogin(ModelAndView model, @RequestParam("name") String username,@RequestParam("password") String password,HttpSession session) throws IOException {
		System.out.println("Entered validateLogin method");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		List<User> userFromDb = fmsDaoimpl.loginCheck(user);
		System.out.println("UserFromDb***"+userFromDb);
		if(userFromDb.isEmpty()){
			//model.addObject("userSession", user);
			model.setViewName("loginNew");
			model.addObject("LoginError", "Wrong credentials ! Please try again !!");
			return model;
		}else {
		session.setAttribute("userSession", userFromDb.get(0));
		model.setViewName("userpersonalpage");
		return model;
		}
		
	}
	
	@RequestMapping(value="/userreg", method=RequestMethod.GET)
	public String userReg(){
		System.out.println("userReg Method");
		return "redirect:userRegPage"; 
	}
	
	
	@RequestMapping(value="/userRegPage", method=RequestMethod.GET)
	public String userRegMethod(){
		System.out.println("userRegMethod Method");
		return "signUp";
	}
	
	@RequestMapping(value="/saveUser", method=RequestMethod.POST)
	public ModelAndView saveUserDetails(@ModelAttribute("user") User user, ModelAndView model){
		
		System.out.println("saveUserDetails Method");
		System.out.println(user.getId() + " : " + user.getUsername() +  " : "  +user.getPassword());
		
		int returnId= fmsDaoimpl.saveUser(user);
		System.out.println(returnId);
		if(returnId!=0){
			model.setViewName("userlogin");
		}else model.setViewName("error");
		
		return model;
		
	}
	
	@RequestMapping(value="/saveFeedback", method=RequestMethod.POST)
	public ModelAndView saveFeedbackForm(@ModelAttribute("feedback") Feedback feedback,ModelAndView model,HttpSession session){
		System.out.println("saveFeedbackForm");
		System.out.println(feedback.getFeedbackGiven());
		User user =(User) session.getAttribute("userSession");
		feedback.setUser(user);
/*		System.out.println("******************"+feedback.getUser().getId());*/
		int returnId= fmsDaoimpl.saveFeedback(feedback);
		System.out.println("The user from session"+user.getUsername());
		System.out.println(returnId);
		if(returnId!=0){
			model.setViewName("feedback");
		}else model.setViewName("error");
		
		return model;
	}
	
	@RequestMapping(value="/update")
	public String updateProfile(){
		System.out.println("update profile method");
		return "update";
	}
	
	@RequestMapping(value="/updateProfile", method=RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute("userdetails") User user, ModelAndView model,HttpSession session){
		
		System.out.println("updateProfile Method");
		System.out.println(user.getEmail() + " : " + user.getPhone() +  " : "  +user.getLocation());
		User userFromSession =(User) session.getAttribute("userSession");
		String returnString = fmsDaoimpl.updateUserProfile(user,userFromSession);
		System.out.println(returnString);
		if(returnString!=null){
			model.setViewName("userpersonalpage");
		}else model.setViewName("error");
		
		return model;
		
	}
	
	
	@RequestMapping(value="/changepassword")
	public String changepasswordProfile(){
		System.out.println("changepassword profile method");
		return "changepassword";
	}
	
	
	@RequestMapping(value="/changePwd", method=RequestMethod.POST)
	public ModelAndView changePassword(@RequestParam("cpassword") String cpassword,ModelAndView model, HttpSession session){
		
		System.out.println("changePassword Method");
		User userFromSession =(User) session.getAttribute("userSession");
		System.out.println("New password"+ cpassword);
		if(cpassword!=userFromSession.getPassword()){
			model.setViewName("changepassword");
			model.addObject("exPwdWrng","Existing Password u entered was wrong");
			return model;
		}
		
		String returnString = fmsDaoimpl.updatePassword(cpassword,userFromSession);
		System.out.println(returnString);
		if(returnString!=null){
			model.setViewName("userpersonalpage");
		}else model.setViewName("error");
		
		return model;
	}
	
	
	
	@RequestMapping(value="/delete")
	public String deleteProfile(){
		System.out.println("Delete profile method");
		return "delete";
	}
	
	@RequestMapping(value="/viewFeedBack")
	public ModelAndView viewFeedBsack(HttpSession session, ModelAndView mv){
		System.out.println("viewFeedBack profile method");
		User userFromSession =(User) session.getAttribute("userSession");
		int userid = userFromSession.getId();
		List<Feedback>feedbackList = fmsDaoimpl.getAllFb(userid);
		mv.setViewName("viewFeedbackPage");
		mv.addObject("fbList", feedbackList );
		return mv;
	}
	
	
	@RequestMapping(value="/feedback")
	public String feedbackProfile(){
		System.out.println("feedback profile method");
		return "feedback";
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		System.out.println("feedback profile method");
		session.invalidate();
		return "loginNew";
	}
	
	
	@RequestMapping(value="/editFeedback")
	public ModelAndView editFeedback(@RequestParam("feedbackId") int feedbackId, @RequestParam("feedbackGiven") String feedbackGiven, ModelAndView mv){
		System.out.println("EditFeedback method");
		System.out.println("editFeedback method"+feedbackId);
		System.out.println("editFeedback method"+feedbackGiven);
		mv.addObject("feedbackId",feedbackId );
		mv.addObject("feedbackGiven", feedbackGiven);
		mv.setViewName("updateFb");
		return mv;
	}
	
	@RequestMapping(value="/updateFeedback")
	public String updateFeedback(@ModelAttribute("feedback") Feedback feedback,ModelAndView model){
		
		System.out.println("updateFeedback method");
		fmsDaoimpl.updateFeedback(feedback);
		return "redirect:viewFeedBack";
	}
	
	
	@RequestMapping(value="/deleteFeedback")
	public String deleteFeedback(@RequestParam("feedbackId") int feedbackId){
		System.out.println("deleteFeedback method");
		fmsDaoimpl.deleteFb(feedbackId);
		return "redirect:viewFeedBack";
	}
	
	@RequestMapping(value="/viewFeedback")
	public String viewFeedback(@RequestParam("feedbackId") int feedbackId){
		System.out.println("deleteFeedback method");
	//	fmsDaoimpl.viewFeedback(feedbackId);
		return "redirect:viewFeedBack";
	}
	
	
	
		
}
