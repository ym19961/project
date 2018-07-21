package com.spring.controller;

import java.io.IOException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.common.email.*;
import com.common.util.FormDataCollectUtil;
import com.spring.service.UserService;

@Controller
@RequestMapping(value="ResetPwd")
public class ResetPwdController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/sendmail")
	/**返回发送邮件页*/
	public String showresendmail(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ResetPwdController.showsendmail() is running......");
		return "ResetPwd/sendmail";
	}
	@RequestMapping(value="/resetpwd")
	/**返回重置密码页*/
	public String showresetpwd(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ResetPwdController.showreset() is running......");
		return "ResetPwd/resetpwd";
	}
	@RequestMapping(value="/tosendmail")
	/**发送邮件方法*/
	public String sendmail(HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		Map<String, Object> user = userService.getUserById(map);
		String userid=user.get("userid").toString();
		String email = user.get("email").toString();
		SimpleMailSenderFactory.getInstance().sendMail(email, "重置密码","点击链接重置密码：192.168.100.120:8080/online/ResetPwd/resetpwd?userid="+userid);
		return "ResetPwd/wait";
	}
	@RequestMapping(value="toresetpwd")
	/**重置密码方法*/
	public void updatepwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		
		System.out.println(map.toString());
		String result = userService.updatePassword(map);
		response.getWriter().print(result);
	}
	
	

}
