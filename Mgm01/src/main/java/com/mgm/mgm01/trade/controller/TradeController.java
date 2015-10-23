package com.mgm.mgm01.trade.controller;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.trade.model.TradeDto;
import com.mgm.mgm01.trade.model.TradeService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class TradeController {

	@Autowired TradeService tradeService;
	@Autowired UserService userService;
	
	@RequestMapping(value="/trade/charge", method=RequestMethod.POST)
	public ModelAndView chargeControl(ModelAndView mav, Authentication auth, TradeDto dto) {
		BigInteger new_cash = userService.readCashService(auth.getName());
		dto.setId(auth.getName());
		dto.setType("charge");
		tradeService.createTradeService(dto);
		
		mav.addObject("cash", new_cash);
		mav.setViewName("forward:/trade/list");
		return mav;
	}
	
	@RequestMapping(value="/trade/exchange")
	public ModelAndView exchangeControl(ModelAndView mav, Authentication auth, TradeDto dto) {
		BigInteger new_cash = userService.readCashService(auth.getName());
		
		dto.setId(auth.getName());
		dto.setType("exchange");
		tradeService.createTradeService(dto);
		
		mav.addObject("cash", new_cash);
		mav.setViewName("forward:/trade/list");
		return mav;
	}
	
	@RequestMapping(value="/trade/list")
	public ModelAndView listControl(ModelAndView mav, Authentication auth,
			@RequestParam(defaultValue="1") int start) {
		BigInteger new_cash = userService.readCashService(auth.getName());
		Map<String, Object> info = tradeService.readTradeListByIdService(auth.getName(), start);

		mav.addAllObjects(info);
		mav.addObject("cash", new_cash);
		mav.setViewName("t:trade/list");
		return mav;
	}
	
	
}
