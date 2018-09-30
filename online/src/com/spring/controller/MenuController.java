package com.spring.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.spring.service.CommentsService;
import com.spring.service.MenuService;
import com.spring.service.UserService;

@Controller
@RequestMapping(value="Menu")
public class MenuController {
	@Autowired
	MenuService menuService;
	@Autowired
	CommentsService commentsService;
	@Autowired
	UserService userService;
	@RequestMapping(value="/menu")
	/**显示菜单页并分页*/
	public String showmenu(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MenuController.showmenu() id running......");
		
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> ascDishes = (List<Map<String, Object>>) request.getSession().getAttribute("ascDishes");
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> descDishes = (List<Map<String, Object>>) request.getSession().getAttribute("descDishes");
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> result = (List<Map<String, Object>>) request.getSession().getAttribute("result");
		List<Map<String,Object>> dishesAll = menuService.getDishesAll();
		List<Map<String, Object>> dishes = new ArrayList<Map<String,Object>>();
		
        if(result != null &&result.size()!=dishesAll.size()) {
        	dishes = result;
        	request.getSession().removeAttribute("dishes");
        	request.setAttribute("dishes", dishes);
        	request.getSession().removeAttribute("result");
        	perpage(request);
        	return "Menu/menu";
        }
        if(ascDishes!=null) {
			dishes = ascDishes;
        	request.getSession().removeAttribute("dishes");
        	request.setAttribute("dishes", dishes);
        	request.getSession().removeAttribute("ascDishes");
        	perpage(request);
        	return "Menu/menu";
        }
        if(descDishes!=null) {
        	dishes = descDishes;
        	request.getSession().removeAttribute("dishes");
        	request.setAttribute("dishes", dishes);
        	request.getSession().removeAttribute("descDishes");
        	perpage(request);
        	return "Menu/menu";
        }
        else{
			dishes = dishesAll;
        	request.setAttribute("dishes", dishes);
        	perpage(request);
        	return "Menu/menu";
        }
        
	}
	@RequestMapping(value="/menusearch")
	public void menusearch(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		request.removeAttribute("dishes");
		List<Map<String, Object>> result = menuService.searchDishByText(map);
		request.getSession().setAttribute("result", result);
		request.getSession().setAttribute("dishtext", map.get("dishtext").toString());
	}
	@RequestMapping(value="/valueAscOrder")
	public void valueAscOrder(HttpServletRequest request, HttpServletResponse response) {
		request.removeAttribute("dishes");
		List<Map<String, Object>> ascDishes = menuService.valueAscOrder();
		request.getSession().setAttribute("ascDishes", ascDishes);
	}
	@RequestMapping(value="/xiaoliangDescOrder")
	public void xiaoliangDescOrder(HttpServletRequest request, HttpServletResponse response) {
		request.removeAttribute("dishes");
		List<Map<String, Object>> descDishes = menuService.xiaoliangDescOrder();
		request.getSession().setAttribute("descDishes", descDishes);
	}
	@RequestMapping(value="/perpage")
	private void perpage(HttpServletRequest request) {
		String p = request.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        @SuppressWarnings("unchecked")
		List<Map<String,Object>> dishes = (List<Map<String, Object>>) request.getAttribute("dishes");
        //菜品总数
        int totalDishes = dishes.size();
        //每页菜品数
        int dishesPerPage = 16;
        //总页数
        int totalPages = totalDishes % dishesPerPage == 0 ? totalDishes / dishesPerPage : totalDishes / dishesPerPage + 1;
        //本页起始菜品序号
        int beginIndex = (page - 1) * dishesPerPage;
        //本页末尾菜品序号的下一个
        int endIndex = beginIndex + dishesPerPage;
        if (endIndex > totalDishes)
            endIndex = totalDishes;
        request.setAttribute("totalDishes", totalDishes);
        request.setAttribute("dishesPerPage", dishesPerPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("beginIndex", beginIndex);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("page", page);
	}
	@RequestMapping(value="/SinglePage")
	/**显示菜品页*/
	public String showsingle(HttpServletRequest request) {
		System.out.println("MenuController.showsingle() is running......");
		String dishid = request.getParameter("dishid");
		Map<String, Object> dishidmap = new HashMap<>();
		dishidmap.put("dishid", dishid);
		List<Map<String,Object>> comments = commentsService.getCommentsByDishId(dishidmap);
		
		Map<String,Object> commenterid = new HashMap<String,Object>();
		for(int i=0;i<comments.size(); i++) {
			commenterid.put("userid", comments.get(i).get("userid").toString());
			String commentername = userService.getUserById(commenterid).get("username").toString();
			comments.get(i).put("commentername", commentername);
		}
		request.getSession().setAttribute("comments", comments);
		return "Menu/single";
	}
	@RequestMapping(value="/addComment")
	public void addComment(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String cdate = df.format(new Date());// new Date()为获取当前系统时间
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		map.put("cdate", cdate);
		commentsService.addComment(map);
		System.out.println(map.toString());
	}
	@RequestMapping(value="/deleteMyComment")
	public void deleteMyComment(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
		commentsService.deleteCommentById(map);
	}
}
