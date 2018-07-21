package com.spring.service;

import java.util.List;
import java.util.Map;

public interface OrderService {
	int addOrder(Map<String, Object> map);

	List<Map<String, Object>> getAllOrders();

	String deleteOrderById(Map<String, Object> map);

	List<String> getDishIdById(Map<String, Object> map);

	List<String> getNumById(Map<String, Object> map); 
}
