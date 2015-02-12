package net.my.user.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import net.my.user.User;
import net.my.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "users/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(User user) throws Exception {
		userService.insert(user);
		return "users/welcome";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "users/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String email, String passwd, HttpSession session) throws Exception {
		User loginUser = userService.login(email, passwd);
		if (loginUser != null) {
			session.setAttribute("check", loginUser);
			return "users/changePasswd";
		} else {
			return "users/login";
		}
	}
			

	
	
}
