package com.spring.serivceimpl;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.service.LoginService;
import com.spring.mapper.UserMapper;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private UserMapper userDao;
	
	@Override
	public int checkUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.check_User(map);
		
		
	}

}
