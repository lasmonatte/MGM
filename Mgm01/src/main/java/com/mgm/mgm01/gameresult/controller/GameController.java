package com.mgm.mgm01.gameresult.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.gameresult.model.GameResultDto;
import com.mgm.mgm01.gameresult.model.GameResultService;

@Controller
public class GameController {

	@Autowired GameResultService gameResultService;
	
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
	public ModelAndView resultControl(ModelAndView mav) {
		int start=0;
		int end=20;
		List<GameResultDto> gameResultDtoList =
				gameResultService.readGameResultListService(start, end);
		
		mav.addObject("gameResultDtoList", gameResultDtoList);
		mav.setViewName("t:game/result");
		return mav;
	}
}
