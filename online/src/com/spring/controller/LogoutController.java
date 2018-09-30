package com.spring.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.LoginService;

import common.Logger;

@Controller
@RequestMapping(value="/Logout")
public class LogoutController {

    private Logger log = Logger.getLogger(LoginService.class);

    //用户注销登录方法
    @RequestMapping(value="/logout")
    public void logout(HttpServletRequest request,
        HttpServletResponse response) {
    	HttpSession session = request.getSession();
	    Enumeration attrNames = session.getAttributeNames();
        while(attrNames.hasMoreElements()) {
    	   String nextElement = (String)attrNames.nextElement();
    	   session.removeAttribute(nextElement);
        }
        session.invalidate();
        try {
			response.sendRedirect(request.getContextPath()+"/top3");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
