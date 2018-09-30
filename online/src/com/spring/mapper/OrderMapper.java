package com.spring.mapper;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
	int addOrder(Map<String, Object> map);

	List<Map<String, Object>> getAllOrders();

	void deleteOrderById(Map<String, Object> map);

	List<String> getDishIdById(Map<String, Object> map);

	List<String> getNumById(Map<String, Object> map);
}
