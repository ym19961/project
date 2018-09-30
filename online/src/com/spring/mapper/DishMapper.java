package com.spring.mapper;

import java.util.List;
import java.util.Map;

public interface DishMapper {

	List<Map<String, Object>> getDishesAll();

	List<Map<String, Object>> searchDishByText(Map<String, Object> map);

	List<Map<String, Object>> valueAscOrder();

	List<Map<String, Object>> xiaoliangDescOrder();

	Map<String, Object> getDishById(Map<String, Object> map);

	List<Map<String, Object>> getDishTop3();

}
