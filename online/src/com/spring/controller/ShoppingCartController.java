package com.spring.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.spring.service.MenuService;
import com.spring.service.UserService;
import com.spring.service.OrderService;

import ch.qos.logback.core.net.SyslogOutputStream;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="ShoppingCart")
public class ShoppingCartController {
	@Autowired
	MenuService menuService;
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="shoppingcart")
	public String showShoppingCart() {
//		购物车页面
		System.out.println("ShoppingCartController.showShoppingCart() is running.......");
		return "ShoppingCart/shoppingcart";
	}
	@RequestMapping(value="confirmation")
	public String showConfirmation() {
//		购物车页面
		System.out.println("ShoppingCartController.confirmation() is running.......");
		return "ShoppingCart/confirmation";
	}
	
	@RequestMapping(value="/deleteItem")
	public void deleteItem(HttpServletRequest request) {
		System.out.println("ShoppingCartController.deleteItem() is running.......");
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cart = (List<Map<String, Object>>) request.getSession().getAttribute("cart");
		System.out.println(map.toString());
		for(Map<String, Object> item:cart) {
			if(item.get("dishid").equals(map.get("dishid"))) {
				cart.remove(item);
				
			}
		}
		request.getSession().setAttribute("cart", cart);
	}
	@RequestMapping(value="putCart")
	public void putCart(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ShoppingCartController.putCart() is running.......");
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		String num = map.get("num").toString();
		Map<String, Object> onedish = menuService.getDishById(map);
		onedish.put("num", num);
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cart = (List<Map<String, Object>>) request.getSession().getAttribute("cart");
		if(cart==null) {
			cart = new ArrayList<Map<String, Object>>();
		}
		int i = 0;
		for(Map<String, Object> everydish : cart)
		{//循环判断购物车中是否已存在新加的菜品，若存在则只更新数量
			if(everydish.get("dishid").equals(onedish.get("dishid"))) {
				int oldnum=Integer.parseInt(everydish.get("num").toString());
				int addnum = Integer.parseInt(onedish.get("num").toString());
				everydish.put("num", Integer.toString(addnum+oldnum));
				break;
			}
			i++;
		}
		//i==cart.size()表示循环到了最后也没找到新加的菜品，则将新加的菜品加入购物车
		if(i==cart.size()) {
			cart.add(onedish);
		}
		System.out.println(cart);
		request.getSession().setAttribute("cart", cart);
	}
	@RequestMapping(value="processOrderInfo")
	public void processOrderInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
//		生成订单信息并将其存入session中
		System.out.println("ShoppingCartController.showConfirmation() is running.......");
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		System.out.println(map);
		
//		infoarray包括dishid和num
		JSONArray infoarray = JSONArray.fromObject(map.get("infoarray"));
		List<Map<String, Object>> dishesInOrder = new ArrayList<Map<String, Object>>();
		for(int i=0; i<infoarray.size(); i++) {//每次循环将infoarray中的一个元素加到dishesInOrder列表中
			JSONObject job = infoarray.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
			System.out.println(job);
			job.get("num");
			Map<String, Object> dishidmap = new HashMap<String,Object>();
			dishidmap.put("dishid", job.get("dishid"));
			Map<String, Object> dishmap = menuService.getDishById(dishidmap);
			Map<String, Object> dishInOrder = new HashMap<String, Object>();
			dishInOrder.put("dishid", job.get("dishid"));
			dishInOrder.put("dname", dishmap.get("dname"));
			dishInOrder.put("dvalue", dishmap.get("dvalue"));
			dishInOrder.put("num", job.get("num"));
			int num = Integer.parseInt(job.get("num").toString());
			float dvalue = Float.parseFloat(dishmap.get("dvalue").toString());
			dishInOrder.put("onekindprice", num*dvalue);
			dishesInOrder.add(dishInOrder);
		}
		
		Map<String, Object> useridmap = new HashMap<String, Object>();
		useridmap.put("userid", map.get("userid").toString());
		Map<String, Object> user = userService.getUserById(useridmap);
		Map<String, Object> orderinfo = new HashMap<String, Object>();
		//订单号的生成方法是userid和时间戳拼接
		orderinfo.put("orderid", user.get("userid").toString()+map.get("timestamp").toString());
		orderinfo.put("userid", user.get("userid"));
		orderinfo.put("address", user.get("address"));
		orderinfo.put("phone", user.get("phone"));
		orderinfo.put("username", user.get("username"));
		orderinfo.put("totalprice", map.get("totalprice"));
		orderinfo.put("dishidsInOrder", dishesInOrder);
		orderinfo.put("state", "0");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String orderdate = df.format(new Date());// new Date()为获取当前系统时间
        orderinfo.put("orderdate", orderdate);
		
		request.getSession().setAttribute("orderinfo", orderinfo);
		response.getWriter().print("1");
	}
	
	@RequestMapping(value="addOrder")
	public void addOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("ShoppingCartController.addOrder() is running.......");
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		System.out.println(map.toString());
		String dishidsstr = map.get("dishids").toString();
		String numsstr = map.get("nums").toString();
		String[] dishids = dishidsstr.split(",");
		String[] nums = numsstr.split(",");
		map.remove("dishids");
		map.remove("nums");
		map.put("state", "1");
		int i;
		for(i=0; i<dishids.length; i++) {
			System.out.println(dishids[i]);
			map.put("dishid", dishids[i]);
			map.put("num", nums[i]);
			orderService.addOrder(map);
		}
		if(i==dishids.length) {
			request.getSession().removeAttribute("orderinfo");
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
		/*int result = orderService.addOrder();
		response.getWriter().print(result);*/
	}
}
