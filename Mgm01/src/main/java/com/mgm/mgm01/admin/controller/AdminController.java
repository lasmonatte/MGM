package com.mgm.mgm01.admin.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/main",method=RequestMethod.GET)
	public ModelAndView mainControl(ModelAndView mav, Authentication auth){
		System.out.println("admin");
		mav.setViewName("t:admin/main");
		return mav;
	}
}
