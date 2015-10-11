package com.mgm.mgm01.ladder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LadderController {

	@RequestMapping(value="/user/main")
	public ModelAndView control(ModelAndView mav) {
		System.out.println("here");
		mav.setViewName("t:game/main");
		return mav;
	}
	
	@RequestMapping(value="/game/ladder")
	public ModelAndView gameControl(ModelAndView mav) {
		System.out.println("here");
		mav.setViewName("t:game/ladder");
		return mav;
	}
}
