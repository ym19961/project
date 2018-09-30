package com.manager.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.common.util.FormDataCollectUtil;
import com.manager.service.ManagerService;

@Controller
public class ManagerController {
	@Autowired(required=true)
	ManagerService managerService;	
	
		@RequestMapping(value="/AdminManager")
		public String AdminManger(HttpServletRequest request,HttpServletResponse response,Model model) {
			HttpSession session = request.getSession();
	    	Map<String,Object> map = new HashMap<String,Object>();
	        map.put("userid",session.getAttribute("userid1"));
	        System.out.println(session.getAttribute("userid"));
	        model.addAttribute("admin", managerService.showAdminInfo(map));
	        List<Map<String, Object>> list = managerService.showAdminAll(map);
	        model.addAttribute("adminAll", list);
			return "Manager/AdminManager";
		}
	
	@RequestMapping(value="/addManager")
	public String addManager(HttpServletRequest request,HttpServletResponse response) {
		
		return "Manager/addManager";
	}
	@RequestMapping(value="/orderManager")
	public String orderManager(HttpServletRequest request,HttpServletResponse response,Model model) {
        List<Map<String, Object>> list = managerService.showorderAll();
        model.addAttribute("orderAll", list);
        
		return "Manager/orderManager";
	}
	@RequestMapping(value="/accept")
	public String accept(HttpServletRequest request,HttpServletResponse response,Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
		managerService.accept(map);
		System.out.println("====================================================");
		System.out.println(map);
		List<Map<String, Object>> list = managerService.showorderAll();
        model.addAttribute("orderAll", list);
		return "Manager/orderManager";
	}
	@RequestMapping(value="/refuse")
	public String refuse(HttpServletRequest request,HttpServletResponse response,Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
		managerService.refuse(map);
		List<Map<String, Object>> list = managerService.showorderAll();
        model.addAttribute("orderAll", list);
		return "Manager/orderManager";
	}
	@RequestMapping(value="/dishManager")
	public String dishManager(HttpServletRequest request,HttpServletResponse response,Model model) {
        List<Map<String, Object>> list = managerService.showdishAll();
        model.addAttribute("dishAll", list);
		return "Manager/dishManager";
	}
	@RequestMapping(value="/commentManager")
	public String commentManager(HttpServletRequest request,HttpServletResponse response,Model model) {
        List<Map<String, Object>> list = managerService.showcommentAll();
        model.addAttribute("commentAll", list);
		return "Manager/commentManager";
	}
	@RequestMapping(value="/updateDish")
	public String updateDish(HttpServletRequest request,HttpServletResponse response,Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        System.out.println(map.get("dishid"));
        model.addAttribute("dishs", managerService.showdishInfo(map));
		return "Manager/updateDish";
	}
	@RequestMapping(value="/queryDishinfo")
	public String queryDishinfo(HttpServletRequest request,HttpServletResponse response,Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
		 List<Map<String, Object>> list = managerService.showorderInfo(map);
        model.addAttribute("dishids", list);
		return "Manager/queryDishinfo";
	}
	@RequestMapping(value="/queryPicture")
	public String queryPicture(HttpServletRequest request,HttpServletResponse response,Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        System.out.println(map.get("dishid"));
        model.addAttribute("dishss", managerService.showdishInfo(map));
		return "Manager/queryPicture";
	}
	@RequestMapping(value="/VIPManager")
	public String VIPManager(HttpServletRequest request,HttpServletResponse response,Model model) {
        List<Map<String, Object>> list = managerService.showusersAll();
        model.addAttribute("usersAll", list);
		return "Manager/VIPManager";
	}
	@RequestMapping(value="/add_Manager")
	public void add_Manager(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        Map<String, Object> result = managerService.exsitManager(map);
        System.out.println(result);
        if(result == null) {
             try {
                 String str = managerService.addManager(map);
                 response.setContentType("text/html;charset=utf-8");
                 response.getWriter().print(str);
                 System.out.println(1);
             } catch (Exception e) {
            	 e.getStackTrace();
             }
        }else {
        	response.setContentType("text/html;charset=utf-8");
            try {
				response.getWriter().print("-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }	
	}
	@RequestMapping(value="/deleteManagerById")
	public void deleteManagerById(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        managerService.deleteManager(map);
        response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	@RequestMapping(value="/deletedishById")
	public void deletedishById(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
		System.out.println(map.get("dishid"));
        managerService.deletedishById(map);
        response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	@RequestMapping(value="/deletecommentById")
	public void deletecommentById(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        managerService.deleteComment(map);
        response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	@RequestMapping(value="/updateManager")
	public String updateManager(HttpServletRequest request,HttpServletResponse response,Model model) {
	    Map<String, Object> map = FormDataCollectUtil.getInstance()
                .getFormData(request);
        model.addAttribute("admin", managerService.showAdminInfo(map));
		return "Manager/userinfo";
	}
	@RequestMapping(value="/updateUserName")
	public void updateUserName(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
	        try {
	            String str = managerService.updateUserName(map);
	            response.setContentType("text/html;charset=utf-8");
	            response.getWriter().print(str);
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}
	@RequestMapping(value="/updateDname")
	public void updateDname(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
	        try {
	            managerService.updateDname(map);
	            response.setContentType("text/html;charset=utf-8");
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}
	@RequestMapping(value="/updateDinfo")
	public void updateDinfo(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
	        try {
	            managerService.updateDinfo(map);
	            response.setContentType("text/html;charset=utf-8");
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}
	@RequestMapping(value="/updateDvalue")
	public void updateDvalue(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
	        try {
	            managerService.updateDvalue(map);
	            response.setContentType("text/html;charset=utf-8");
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}
	@RequestMapping(value="/updatepassword")
	public void updatepassword(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
	            .getFormData(request);
	        try {
	        	String result = managerService.updatepassword(map);
	        	if(result=="1")
	        		System.out.println("成功");
	            response.setContentType("text/html;charset=utf-8");
	            
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}
	@RequestMapping(value="/addDish")
	public String addDish(HttpServletRequest request,HttpServletResponse response) {
		return "Manager/addDish";
	}
	@RequestMapping(value="/add_Dish")
	public String add_Dish(@RequestParam("image") MultipartFile image,HttpServletRequest request,Model model) {
//		F:\eclipse-workspace\online\WebContent\images
		
		Map<String, Object> map = new HashMap<String,Object>();
		String dname=request.getParameter("dname");
		String dinfo=request.getParameter("dinfo");
		String dvalue=request.getParameter("dvalue");
		String ddate=request.getParameter("ddate");
		String dimg=image.getOriginalFilename();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("111111-----------1111");
		map.put("dname", dname);
		map.put("dinfo", dinfo);
		map.put("dvalue", dvalue);
		map.put("ddate",ddate);
		map.put("dimg", dimg);
		upload(image,request);
		managerService.addDish(map);
		List<Map<String, Object>> list = managerService.showdishAll();
        model.addAttribute("dishAll", list);
		return "Manager/dishManager";
		/*String p0=(String) map.get("dimg");
		String p2=p0.trim();
		String p3=p2.substring(p2.lastIndexOf("\\")+1);
		map.put("dimg",p3);
		System.out.println(map.get("dimg").toString());
		System.out.println(p1);
		System.out.println(p);
        managerService.addDish(map);
        response.setContentType("text/html;charset=utf-8");
        try {
			response.getWriter().print("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
        }	
	public void upload(MultipartFile image, HttpServletRequest request) {
            try {
                    String p=image.getOriginalFilename();
                    image.transferTo(new File("F:\\eclipse-workspace\\online\\WebContent\\images\\" +p));//以绝对路径保存重命名后的图片
                } catch (IOException e) {
                e.printStackTrace();
            }
	}

	/*@RequestMapping(value="/uploadPicture")
	public void uploadPicture(HttpServletRequest request,@RequestParam("file-1")MultipartFile picture,HttpServletResponse response) {
			String pname=picture.getOriginalFilename();
			String pFolder="F:\\eclipse-workspace\\online\\WebContent\\img\\";
			String p=pFolder+pname;
			System.out.println(p);
			File hif = new File(p);
			if(!hif.exists())
				try {
					hif.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			try {
				picture.transferTo(hif);
				System.out.println("picture success");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	        try {
	            response.setContentType("text/html;charset=utf-8");
	        } catch (Exception e) {
	            e.getStackTrace();
	        }
	}*/
}


