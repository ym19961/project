package com.spring.serivceimpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.UserMapper;
import com.spring.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userDao;
	
	@Override
	public Map<String, Object> getUserById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return userDao.getUserById(map);
	}

	@Override
	public int addUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.addUser(map);
	}

	@Override
	public String updatePassword(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 userDao.updatePassword(map);
		 return "1";
	}

	@Override
	public String updatename(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 userDao.updateName(map);
		 return "1";
	}

	@Override
	public String updatPicture(Map<String, Object> map) {
		// TODO Auto-generated method stub
		userDao.updatePicture(map);
		return "1";
	}

	@Override
	public String updatePhone(Map<String, Object> map) {
		// TODO Auto-generated method stub
		userDao.updatePhone(map);
		return "1";
	}

	@Override
	public String updateAddress(Map<String, Object> map) {
		// TODO Auto-generated method stub
		userDao.updateAddress(map);
		return "1";
	}

	

}
