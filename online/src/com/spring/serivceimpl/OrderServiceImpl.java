package com.spring.serivceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.OrderMapper;
import com.spring.service.OrderService;

@Service("OrderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderDao;

	@Override
	public int addOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return orderDao.addOrder(map);
	}

	@Override
	public List<Map<String, Object>> getAllOrders() {
		// TODO Auto-generated method stub
		return orderDao.getAllOrders();
	}

	@Override
	public String deleteOrderById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		orderDao.deleteOrderById(map);
		return "1";
	}

	@Override
	public List<String> getDishIdById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return orderDao.getDishIdById(map);
	}

	@Override
	public List<String> getNumById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return orderDao.getNumById(map);
	}

}
