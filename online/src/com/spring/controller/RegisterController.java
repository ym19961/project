package com.spring.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.spring.service.UserService;

@Controller
@RequestMapping(value="/Register")
public class RegisterController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/register")
	/**显示注册页*/
	public String showregister(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LoginController.showregister() is running.......");
		return "Register/register";
	}
	
	@RequestMapping(value="/addUser")
	/**实现注册方法*/
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Map<String, Object> map = FormDataCollectUtil.getInstance()
		            .getFormData(request);
		int result = userService.addUser(map);
		System.out.println(result);
		if(result==1) {
			return "Login/login";
		}
		else {
			return "../";
		}
	}
}
