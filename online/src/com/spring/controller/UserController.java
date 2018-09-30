package com.spring.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.spring.service.UserService;

@Controller
@RequestMapping(value="/User")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/usermain")
	/**显示用户主页*/
	public String showusermain(HttpServletRequest request, HttpServletResponse response,Model model) {
		System.out.println("UserController.showusermain() is running.....");
		HttpSession session = request.getSession();
        Map<String,Object> idmap = new HashMap<String,Object>();
        
        idmap.put("userid", session.getAttribute("userid"));
       
        Map<String, Object> user = userService.getUserById(idmap);
        System.out.println(user);
            
        model.addAttribute("user", user);
		return "User/usermain";
	}
	
	@RequestMapping(value="/userinfo")
	/**显示账户设置*/
	public String showuserinfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		System.out.println("UserController.showuserinfo() is running.....");
		HttpSession session = request.getSession();
        Map<String,Object> idmap = new HashMap<String,Object>();
        
        idmap.put("userid", session.getAttribute("userid"));
       
        Map<String, Object> user = userService.getUserById(idmap);
        System.out.println(user);
            // 转型,把照片blob型转byte
        byte[] b = (byte[]) user.get("picture");
        if (b != null) {
            String picture = new String(b);
            user.put("picture", picture);
        }
//        model.addAttribute("user", user);
        request.getSession().setAttribute("user", user);
		return "User/userinfo";
	}
	
	@RequestMapping(value="/updatename")
	public void updatename(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		System.out.println("UserController.updatename() is running.....");
		String result = userService.updatename(map);
		@SuppressWarnings("unchecked")
		Map<String,Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
		if(result=="1") {
			user.put("name", map.get("newusername").toString());
			request.getSession().setAttribute("user",user);
		}
	}
	@RequestMapping(value="/updatepassword")
	public void updatepassword(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		System.out.println("UserController.updatepassword() is running.....");
		String result = userService.updatePassword(map);
		@SuppressWarnings("unchecked")
		Map<String,Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
		if(result=="1") {
			user.put("password", map.get("newpassword").toString());
			request.getSession().setAttribute("user",user);
		}
	}
	@RequestMapping(value="/updatepicture")
	public void updatepicture(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
				.getFormData(request);
		System.out.println(map.toString());
		String result = userService.updatPicture(map);
		@SuppressWarnings("unchecked")
		Map<String,Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
		if(result == "1") {
			user.put("picture", map.get("newpicture").toString());
			request.getSession().setAttribute("user", user);
		}
	}
	
	
	@RequestMapping(value="/updatephone")
	public void updatephone(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
				.getFormData(request);
		String result=userService.updatePhone(map);
		@SuppressWarnings("unchecked")
		Map<String,Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
		if(result=="1") {
			user.put("phone", map.get("newphone").toString());
			request.getSession().setAttribute("user",user);
		}
	}
	@RequestMapping(value="/updateAddress")
	public void updateaddress(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormData(request);
		System.out.println(param.toString());
		String address = param.get("province").toString()+param.get("city").toString()+param.get("district").toString()+param.get("detail").toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", param.get("userid").toString());
		map.put("address", address);
		userService.updateAddress(map);
	}
	
	

}
