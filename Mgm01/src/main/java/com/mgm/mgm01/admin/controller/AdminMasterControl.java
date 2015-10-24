package com.mgm.mgm01.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.admin.model.AdminDto;
import com.mgm.mgm01.admin.model.AdminService;

@Controller
public class AdminMasterControl {
	
	@Autowired AdminService adminService;
	
	@RequestMapping(value="/admin/adminInfo", method=RequestMethod.GET)
	public ModelAndView adminInfoControl(ModelAndView mav, Authentication auth,
			@RequestParam(defaultValue="1")int start){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){
			Map<String, Object> info = adminService.readAdminAllService(start);
			AdminDto dto = adminService.readTotalService();
			
			mav.addAllObjects(info);
			mav.addObject("total", dto);
			mav.setViewName("t:admin/adminInfo");
		}else
			mav.setViewName("redirect:/admin/main");
		return mav;
	}
	
	@RequestMapping(value="/admin/modAdmin", method=RequestMethod.GET)
	public ModelAndView createAdmiControl(ModelAndView mav, Authentication auth,
			@RequestParam(defaultValue="1")int start){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){
			Map<String, Object> info = adminService.readAdminAllService(start);
			mav.addAllObjects(info);
			mav.setViewName("t:admin/modAdmin");
		}
		else
			mav.setViewName("redirect:/admin/main");
		return mav;
	}

	@RequestMapping(value="/admin/createAdmin", method=RequestMethod.POST)
	public ModelAndView createAdminControl(ModelAndView mav, Authentication auth,
			@RequestParam(name="id")String id){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){
			adminService.createAdminService(id);
			mav.setViewName("redirect:/admin/adminInfo");;
		}
		else
			mav.setViewName("redirect:/admin/main");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/deleteAdmin")
	public ModelAndView deleteAdminControl(ModelAndView mav, Authentication auth,
			@RequestParam(name="admin_num")int admin_num){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){
			adminService.deleteAdminService(admin_num);
			mav.setViewName("redirect:/admin/adminInfo");
		}
		else
			mav.setViewName("redirect:/admin/main");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/updateAdmin")
	public ModelAndView deleteAdminControl(ModelAndView mav, Authentication auth,
			String type, float dividend, String id){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){
			if(type.equals("salary"))
				adminService.updateAdminSalaryService(id);
			else if(type.equals("dividend"))
				adminService.updateDividendService(id, dividend);
			mav.setViewName("redirect:/admin/adminInfo");
		}
		else
			mav.setViewName("redirect:/admin/main");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/ruleInfo", method=RequestMethod.GET)
	public ModelAndView ruleInfoControl(ModelAndView mav, Authentication auth){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){

			mav.setViewName("t:admin/ruleInfo");
		}
		else
			mav.setViewName("redirect:/admin/main");
		return mav;
	}
	
	@RequestMapping(value="/admin/ruleInfo", method=RequestMethod.POST)
	public ModelAndView ruleInfControl(ModelAndView mav, Authentication auth){
		if(auth.getAuthorities().toString().equals("[ROLE_MASTER]")){

			mav.setViewName("redirect:/admin/ruleInfo");
		}
		else
			mav.setViewName("redirect:/admin/main");
		return mav;
	}
}
