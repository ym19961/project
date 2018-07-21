package com.manager.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.manager.service.ManagerService;

@Controller
@RequestMapping(value="ManagerLogin")
public class ManagerLoginController {
	
	@Autowired(required=true)
	ManagerService managerService;

	@RequestMapping(value="/Login")
	public String Login(HttpServletRequest request,HttpServletResponse reponse) {
		return "ManagerLogin/managerLogin";
//		return "Manager/AdminManager";
	}
	
	@RequestMapping(value="/managerLogin")
	public String managerLogin(HttpServletRequest request,HttpServletResponse reponse) {
		Map<String,Object> map=FormDataCollectUtil.getInstance().getFormData(request);
		Map<String,Object> result=managerService.checkManager(map);
		if(result==null) {
			request.setAttribute("errorinfo", "用户名或密码错误");
			return "ManagerLogin/managerLogin";
		}
		else {
			Map <String,Object>  user=managerService.exsitManager(map);
        	request.getSession().setAttribute("login", "login");
        	request.getSession().setAttribute("user1", user);
        	request.getSession().setAttribute("userid1", map.get("userid"));
        	request.getSession().setAttribute("username", map.get("username"));
			System.out.println(result.toString());
			return "Manager/manager_index";
		}
	}
}
