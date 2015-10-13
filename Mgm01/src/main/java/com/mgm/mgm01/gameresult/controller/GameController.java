package com.mgm.mgm01.gameresult.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingDto;
import com.mgm.mgm01.gameresult.model.GameResultDto;
import com.mgm.mgm01.gameresult.model.GameResultService;
import com.mgm.mgm01.rule.model.BettingRuleDto;
import com.mgm.mgm01.rule.model.RuleService;

@Controller
public class GameController {

	@Autowired GameResultService gameResultService;
	@Autowired RuleService ruleService;
	
	@RequestMapping(value="/user/main")
	public ModelAndView control(ModelAndView mav) {

		mav.setViewName("t:game/main");
		return mav;
	}
	
	@RequestMapping(value="/game/ladder", method=RequestMethod.POST)
	public ModelAndView gameControl(ModelAndView mav) {
		BettingRuleDto bettingRuleDto = ruleService.readBettingRuleService();
		mav.addObject("bettingRuleDto", bettingRuleDto);
		
		mav.setViewName("t:game/ladder");
		return mav;
	}
	
	@RequestMapping(value="/game/result", method=RequestMethod.POST)
	public ModelAndView resultControl(ModelAndView mav, @RequestParam(defaultValue="0")int start,
			@RequestParam(defaultValue="20")int end) {
	
		List<GameResultDto> gameResultDtoList = gameResultService.readGameResultListService(start, end);
		
		mav.addObject("gameResultDtoList", gameResultDtoList);
		mav.setViewName("t:game/result");
		return mav;
	}
	
	@RequestMapping(value="/game/betting", method=RequestMethod.POST)
	public ModelAndView bettingControl(ModelAndView mav, BettingDto dto) {
		System.out.println(dto.getExpect_money());
		return mav;
	}
}
