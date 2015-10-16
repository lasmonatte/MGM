package com.mgm.mgm01.betting.controller;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingDto;
import com.mgm.mgm01.betting.model.BettingService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class BettingController {
	@Autowired BettingService bettingService;
	@Autowired UserService userService;
	
	@Transactional
	@RequestMapping(value="/betting/new")
	public ModelAndView newControl(ModelAndView mav, Authentication auth, BettingDto dto,
			@RequestParam(value="cash")BigInteger cash) {
		dto.setId(auth.getName());
		bettingService.createBettingService(dto);
		userService.updateCashService(auth.getName(), cash);
		
		BigInteger new_cash = userService.readCashService(auth.getName());
		
		mav.addObject("cash", new_cash);
		mav.setViewName("t:game/ladder");
		return mav;
	}
	
	
	
}
