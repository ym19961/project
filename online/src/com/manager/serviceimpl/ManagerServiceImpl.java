package com.manager.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.mapper.ManagerMapper;
import com.manager.service.ManagerService;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService{
	@Autowired(required=true)
	ManagerMapper managerDao;
	
	@Override
	public Map<String, Object> checkManager(Map<String, Object> map) {
		return managerDao.checkManager(map);
	}

	@Override
	public Map<String, Object> showAdminInfo(Map<String, Object> map) {
		return managerDao.showAdminInfo(map);
	}

	@Override
	public List<Map<String, Object>> showAdminAll(Map<String, Object> map) {
		return managerDao.showAdminAll(map);
	}

	@Override
	public Map<String, Object> exsitManager(Map<String, Object> map) {
		return managerDao.exsitManager(map);
	}

	@Override
	public String addManager(Map<String, Object> map) {
		managerDao.addManager(map);
		return "1";
	}

	@Override
	public String updateUserName(Map<String, Object> map) {
		managerDao.updateUserName(map);
		return "1";
	}

	@Override
	public String updatepassword(Map<String, Object> map) {
		// TODO Auto-generated method stub
		managerDao.updatepassword(map);
		return "1";
	}

	@Override
	public void deleteManager(Map<String, Object> map) {
		managerDao.deleteManager(map);
		
	}

	@Override
	public List<Map<String, Object>> showdishAll() {
		
		return managerDao.showdishAll();
	}

	@Override
	public List<Map<String, Object>> showusersAll() {
		
		return managerDao.showusersAll();
	}

	@Override
	public void deletedishById(Map<String, Object> map) {
		managerDao.deletedishById(map);	
	}

	@Override
	public void addDish(Map<String, Object> map) {
		managerDao.addDish(map);	
	}

	@Override
	public Map<String, Object> showdishInfo(Map<String, Object> map) {
		return managerDao.showdishInfo(map);
	}

	@Override
	public void updateDname(Map<String, Object> map) {
		managerDao.updateDname(map);
	}

	@Override
	public void updateDinfo(Map<String, Object> map) {
		managerDao.updateDinfo(map);
		
	}

	@Override
	public void updateDvalue(Map<String, Object> map) {
		managerDao.updateDvalue(map);
		
	}

	@Override
	public List<Map<String, Object>> showcommentAll() {
		return managerDao.showcommentAll();
	}

	@Override
	public List<Map<String, Object>> showorderAll() {
		return managerDao.showorderAll();
	}

	@Override
	public List<Map<String, Object>> showorderInfo(Map<String, Object> map) {
		return managerDao.showorderInfo(map);
	}

	@Override
	public void accept(Map<String, Object> map) {
		managerDao.accept(map);
		
	}

	@Override
	public void refuse(Map<String, Object> map) {
		managerDao.refuse(map);
		
	}

	@Override
	public void deleteComment(Map<String, Object> map) {
		managerDao.deleteComment(map);
		
	}

}
