package com.mgm.mgm01.gameresult.controller;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingDto;
import com.mgm.mgm01.betting.model.BettingService;
import com.mgm.mgm01.gameresult.model.GameResultDto;
import com.mgm.mgm01.gameresult.model.GameResultService;
import com.mgm.mgm01.rule.model.BettingRuleDto;
import com.mgm.mgm01.rule.model.RuleService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class GameController {

	@Autowired GameResultService gameResultService;
	@Autowired RuleService ruleService;
	@Autowired UserService userService;
	@Autowired BettingService bettingService;
	
	@RequestMapping(value="/game/ladder", method=RequestMethod.GET)
	public ModelAndView gameControl(ModelAndView mav, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		BettingDto bettingDto = bettingService.readBettingOneService(auth.getName());
		BettingRuleDto bettingRuleDto = ruleService.readBettingRuleService();

		mav.addObject("cash", cash);
		mav.addObject("bettingDto", bettingDto);
		mav.addObject("bettingRuleDto", bettingRuleDto);
		mav.setViewName("t:game/ladder");
		return mav;
	}
	
	@RequestMapping(value="/game/result", method=RequestMethod.POST)
	public ModelAndView resultControl(ModelAndView mav, @RequestParam(defaultValue="0")int start,
			@RequestParam(defaultValue="20")int end, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		List<GameResultDto> gameResultDtoList = gameResultService.readGameResultListService(start, end);
		
		mav.addObject("cash", cash);
		mav.addObject("gameResultDtoList", gameResultDtoList);
		mav.setViewName("t:game/result");
		return mav;
	}
	
	@RequestMapping(value="/game/betting")
	public ModelAndView bettingControl(ModelAndView mav, Authentication auth, BettingDto dto) {
		BigInteger cash = userService.readCashService(auth.getName());
		mav.addObject("cash", cash);
		return mav;
	}
}
