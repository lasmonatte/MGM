package com.mgm.mgm01.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.game.model.GameDto;
import com.mgm.mgm01.game.model.GameService;

@Controller
public class GameController {

	@Autowired GameService gameService;
	
	@RequestMapping(value="/user/main")
	public ModelAndView control(ModelAndView mav) {
		mav.setViewName("t:game/main");
		return mav;
	}
	
	@RequestMapping(value="/game/ladder", method=RequestMethod.POST)
	public ModelAndView gameControl(ModelAndView mav) {
		System.out.println("here");
		mav.setViewName("t:game/ladder");
		return mav;
	}
	
	@RequestMapping(value="/game/result", method=RequestMethod.POST)
	public ModelAndView resultsControl(ModelAndView mav) {
		int start=0;
		int end=20;
		List<GameDto> gameDtoList = gameService.readGameListService(start, end);
		
		mav.addObject("gameDtoList", gameDtoList);
		mav.setViewName("t:game/result");
		return mav;
	}
}
