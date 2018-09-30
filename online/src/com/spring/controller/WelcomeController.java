package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.MenuService;

@Controller
public class WelcomeController {
	
	@Autowired(required=true)
	private MenuService menuService;
	
	@RequestMapping("/top3")
	public String top3(HttpServletRequest request){
		List<Map<String,Object>> top3List = menuService.getDishTop3();
		System.out.println(top3List.toString());
		HttpSession session = request.getSession();
		session.setAttribute("top3List", top3List);
		return "../../index";
	}
}
