package com.spring.serivceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.DishMapper;
import com.spring.service.MenuService;

@Service("MenuService")
public class MenuServiceImpl implements MenuService{

	@Autowired
	DishMapper dishDao;
	@Override
	public List<Map<String, Object>> getDishesAll() {
		// TODO Auto-generated method stub
		
		return dishDao.getDishesAll();
	}
	@Override
	public List<Map<String, Object>> searchDishByText(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dishDao.searchDishByText(map);
	}
	@Override
	public List<Map<String, Object>> valueAscOrder() {
		// TODO Auto-generated method stub
		return dishDao.valueAscOrder();
		
	}
	@Override
	public List<Map<String, Object>> xiaoliangDescOrder() {
		// TODO Auto-generated method stub
		return dishDao.xiaoliangDescOrder();
	}
	@Override
	public Map<String, Object> getDishById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dishDao.getDishById(map);
	}
	@Override
	public List<Map<String, Object>> getDishTop3() {
		// TODO Auto-generated method stub
		return dishDao.getDishTop3();
	}

}
