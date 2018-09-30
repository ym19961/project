package com.manager.mapper;

import java.util.List;
import java.util.Map;

public interface ManagerMapper {

	Map<String, Object> checkManager(Map<String, Object> map);

	Map<String, Object> showAdminInfo(Map<String, Object> map);

	List<Map<String, Object>> showAdminAll(Map<String, Object> map);

	Map<String, Object> exsitManager(Map<String, Object> map);

	void addManager(Map<String, Object> map);

	void updateUserName(Map<String, Object> map);

	void updatepassword(Map<String, Object> map);

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
