package com.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.spring.service.MenuService;
import com.spring.service.OrderService;
import com.sun.mail.iap.Response;

@Controller
@RequestMapping(value="/Orders")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MenuService menuService;
	@RequestMapping(value="orders")
	public String showOrder(HttpServletRequest request) {
		System.out.println("OrderController.showOrder() is running..........");
		List<Map<String, Object>> orderlist = orderService.getAllOrders();
		request.getSession().setAttribute("orderlist", orderlist);
		
		return "Orders/orders";
	}
	
	@RequestMapping(value="deleteorder")
	public void deleteorder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("OrderController.deleteorder() is running..........");
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		String result = orderService.deleteOrderById(map);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="orderdetail")
	public String orderdetail(HttpServletRequest request) {
		System.out.println("OrderController.orderdetail() is running..........");
		System.out.println(request.getSession().getAttribute("dishlist"));
		return "Orders/orderdetail";
	}
	@RequestMapping(value="getdetailinfo")
	public void getdishesinfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("OrderController.getdishesinfo() is running..........");
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		List<String> dishidlist = orderService.getDishIdById(map);
		List<String> numlist = orderService.getNumById(map);
		List<Map<String, Object>> dishlist = new ArrayList<Map<String, Object>>();
		float totalprice=0;
		for(int i=0; i<dishidlist.size(); i++) {
			Map<String, Object> dishidmap = new HashMap<String, Object>();
			dishidmap.put("dishid", dishidlist.get(i));
			Map<String, Object> dishesinorder = menuService.getDishById(dishidmap);
			dishesinorder.put("num", numlist.get(i));
			int num = Integer.parseInt(numlist.get(i));
			float dvalue = Float.parseFloat(dishesinorder.get("dvalue").toString());
			dishesinorder.put("onekindprice", num*dvalue);
			
			totalprice = num*dvalue + totalprice;
			dishlist.add(dishesinorder);
		}
		Map<String, Object> detailinfo = new HashMap<String, Object>();
		detailinfo.put("totalprice", totalprice);
		detailinfo.put("dishlist", dishlist);
		detailinfo.put("state", map.get("state").toString());
		detailinfo.put("orderid", map.get("orderid").toString());
		detailinfo.put("orderdate", map.get("orderdate").toString());
		request.getSession().setAttribute("detailinfo",detailinfo);
		
		response.getWriter().print("1");	
	}
}
