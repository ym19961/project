package com.spring.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.common.util.FormDataCollectUtil;
import com.spring.service.LoginService;
import com.spring.service.MenuService;
import com.spring.service.UserService;
import com.sun.mail.iap.Response;

@Controller
@RequestMapping(value="/Login")
public class LoginController {
	
	@Autowired(required=true)
	private LoginService loginService;
	
	@Autowired(required=true)
	private UserService userService;
	
	@Autowired(required=true)
	private MenuService menuServece;
	
	@RequestMapping(value="login")
	/**显示登录页*/
	public String showlogin(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("LoginController.showlogin() is running.......");
		return "Login/login";
	}
	
	
	@RequestMapping(value="/checkUser")
	public String checkUser(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
		//将jsp文件传来的数据(用户类型、用户名和密码)转换为Map类型(键-值对)，
    	//键分别为"userid"、"password"，每个键对应的值分别为在前端输入的值
        Map<String, Object> map = FormDataCollectUtil.getInstance()
            .getFormData(request);
        System.out.println(map.toString());
        int result = loginService.checkUser(map);
        Map<String, Object> user = userService.getUserById(map);
        if(result==1)
        {	
        	HttpSession session = request.getSession();
        	session.setAttribute("user", user);
        	session.setAttribute("userid", user.get("userid").toString());
        	
        	return "User/usermain";
        	
        }
       
        else {
        	request.setAttribute("errinfo", "用户名或密码错误");
        	return "Login/login";
        }
	}
}
