package com.mgm.mgm01.gameresult.controller;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

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
import com.mgm.mgm01.rule.model.TradeRuleDto;
import com.mgm.mgm01.sercurity.UserDetailsVO;
import com.mgm.mgm01.user.model.UserDto;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class GameController {

	@Autowired GameResultService gameResultService;
	@Autowired RuleService ruleService;
	@Autowired UserService userService;
	@Autowired BettingService bettingService;
	
	@RequestMapping(value="/game/ladder")
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
	
	@RequestMapping(value="/game/result")
	public ModelAndView resultControl(ModelAndView mav, @RequestParam(defaultValue="0")int start,
			@RequestParam(defaultValue="20")int end, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		List<GameResultDto> gameResultDtoList = gameResultService.readGameResultListService(start, end);
		
		mav.addObject("cash", cash);
		mav.addObject("gameResultDtoList", gameResultDtoList);
		mav.setViewName("t:game/result");
		return mav;
	}
	
	@RequestMapping("/game/betlist")
	public ModelAndView betlistControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start, Authentication auth) {
		// List li = bls.readAllService();
		BigInteger cash = userService.readCashService(auth.getName());
		Map<String, Object> map = bettingService.readPageServiceNaver(start, auth.getName());
		mav.addObject("cash", cash);
		mav.addAllObjects(map);
		mav.addObject("isInner", false);
		mav.setViewName("t:game/list");
		return mav;
	}
	
	@RequestMapping("/game/betlist_inner")
	public ModelAndView innerControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());

		// List li = bls.readAllService();
		Map<String, Object> map = bettingService.readPageServiceNaver(start, auth.getName());
		mav.addAllObjects(map);
		mav.addObject("cash", cash);
		mav.addObject("isInner", true);
		mav.setViewName("game/list");
		return mav;
	}
	
	@RequestMapping(value="/game/charge")
	public ModelAndView chargeControl(ModelAndView mav, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());

		UserDto userDto = userService.readUserService(auth.getName());
		TradeRuleDto rule = ruleService.readTradeRuleService();
		mav.addObject("cash", cash);
		mav.addObject("userDto", userDto);
		mav.addObject("rule", rule);
		mav.setViewName("trade/charge");
		return mav;
	}
	
	@RequestMapping(value="/game/exchange")
	public ModelAndView exchangeControl(ModelAndView mav, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());

		UserDto userDto = userService.readUserService(auth.getName());

		mav.addObject("cash", cash);
		mav.addObject("userDto", userDto);
		mav.setViewName("trade/exchange");
		return mav;
	}
}
