package com.manager.service;

import java.util.List;
import java.util.Map;

public interface ManagerService {

//	检查管理员登录信息是否正确	
	Map<String, Object> checkManager(Map<String, Object> map);
	
//	显示当前登录管理员的信息
	Map<String, Object> showAdminInfo(Map<String, Object> map);

	
//	显示所有管理员的信息
	List<Map<String, Object>> showAdminAll(Map<String, Object> map);

	Map<String, Object> exsitManager(Map<String, Object> map);

	String addManager(Map<String, Object> map);

	String updateUserName(Map<String, Object> map);

	String updatepassword(Map<String, Object> map);

	void deleteManager(Map<String, Object> map);

	List<Map<String, Object>> showdishAll();

	List<Map<String, Object>> showusersAll();

	void deletedishById(Map<String, Object> map);

	void addDish(Map<String, Object> map);

	Map<String, Object> showdishInfo(Map<String, Object> map);

	void updateDname(Map<String, Object> map);

	void updateDinfo(Map<String, Object> map);

	void updateDvalue(Map<String, Object> map);

	List<Map<String, Object>> showcommentAll();

	List<Map<String, Object>> showorderAll();

	List<Map<String, Object>> showorderInfo(Map<String, Object> map);

	void accept(Map<String, Object> map);

	void refuse(Map<String, Object> map);

	void deleteComment(Map<String, Object> map);

}
