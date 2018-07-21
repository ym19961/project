package com.spring.mapper;

import java.util.Map;

public interface UserMapper {
	
	int check_User(Map<String, Object> map);
	
	Map<String, Object> getUserById(Map<String, Object> map);

	int addUser(Map<String, Object> map);

	void updatePassword(Map<String, Object> map);

	void updateName(Map<String, Object> map);

	void updatePicture(Map<String, Object> map);

	void updatePhone(Map<String, Object> map);

	void updateAddress(Map<String, Object> map);

}
