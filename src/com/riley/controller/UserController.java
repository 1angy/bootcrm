package com.riley.controller;

import com.riley.entity.SysUser;
import com.riley.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;

	@RequestMapping("/login")
	public String login(String usercode,String password,HttpSession session){
		System.out.println(usercode + "\t" + password);
		SysUser u = new SysUser();
		u.setUserCode(usercode);
		u.setUserPassword(password);
		SysUser user = service.findUserToLogin(u);
		if(user!=null) {
			session.setAttribute("USER_SESSION", user);
			return "redirect:customer";
		}
		session.setAttribute("msg", "账号或密码错误，请重新输入！");
		return "login.jsp";
	}
	
	@RequestMapping("/toCustomer")
	public String toCustomer() {
		return "show.jsp";
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
}
