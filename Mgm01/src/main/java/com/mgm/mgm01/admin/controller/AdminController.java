package com.mgm.mgm01.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.board.model.BoardService;
import com.mgm.mgm01.cashinfo.model.CashInfoService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class AdminController {

	@Autowired UserService userService;
	@Autowired CashInfoService cashInfoService;
	@Autowired BoardService boardService;

	@RequestMapping(value="/admin/main",method=RequestMethod.GET)
	public ModelAndView mainControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start, Authentication auth){
		Map<String, Object> map = userService.readAllUserService(start, "ROLE_USER");

		mav.addAllObjects(map);
		mav.setViewName("t:admin/main");
		return mav;
	}

	@RequestMapping("/admin/cashInfo")
	public ModelAndView betlistControl(ModelAndView mav,  Authentication auth,
			@RequestParam(defaultValue="all")String type, @RequestParam(defaultValue = "1") int start) {
		// List li = bls.readAllService();
		switch (type) {
		case "all":
		case "charge":
		case "exchange":
			break;
		case "ex_ch":
		default:
			break;
		}
		Map<String, Object> map = cashInfoService.readCashInfoAll(start, type);

		mav.addAllObjects(map);
		mav.addObject("type", type);
		mav.setViewName("t:admin/cashInfo");
		return mav;
	}


}
