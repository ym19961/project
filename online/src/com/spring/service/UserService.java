package com.spring.service;

import java.util.Map;

public interface UserService {
	
	public Map<String, Object> getUserById(Map<String, Object> map);

	public int addUser(Map<String, Object> map);

	public String updatePassword(Map<String, Object> map);

	public String updatename(Map<String, Object> map);

	public String updatPicture(Map<String, Object> map);

	public String updatePhone(Map<String, Object> map);

	public String updateAddress(Map<String, Object> map);

	

}
