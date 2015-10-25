package com.mgm.mgm01.user.controller;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingService;
import com.mgm.mgm01.cashinfo.model.CashInfoService;
import com.mgm.mgm01.user.model.UserDto;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class UserController {

	@Autowired UserService userService;
	@Autowired BettingService bettingService;
	@Autowired CashInfoService cashInfoService;
	
	@RequestMapping(value="/user/main")
	public ModelAndView control(ModelAndView mav, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		mav.addObject("cash", cash);
		mav.setViewName("t:game/main");
		return mav;
	}
	
	@Transactional
	@RequestMapping(value="user/register", method=RequestMethod.POST)
	public ModelAndView registerControl(ModelAndView mav, UserDto userDto) {
		userDto.setAuthority("ROLE_USER");
		userService.createUserService(userDto);
		userService.grantAuthorityService(userDto);
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping(value="user/info", method=RequestMethod.GET)
	public ModelAndView updateInfoControl(ModelAndView mav, Authentication auth) {
		UserDto dto = userService.readUserService(auth.getName());

		mav.addObject("userDto", dto);
		mav.setViewName("t:user/info");
		return mav;
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="user/updateCash", produces="text/plain;charset=UTF-8")
	public String updateCashControl(ModelAndView mav, Authentication auth, int game_num, int prize_money,
			BigInteger cash) {
		System.out.println("들어옴");
		String msg="기본형";
		cash = cash.add(BigInteger.valueOf(prize_money));
		
		int rst1 = userService.updateCashService(auth.getName(), cash);
		int rst2 = bettingService.updateBettingReceivedService(game_num, auth.getName());
		if(rst1>0 && rst2>0){
			msg = "당첨금을 수령하셨습니다.";
			cashInfoService.createCashInfo(auth.getName(), BigInteger.valueOf(prize_money), "win");
		}
		else
			msg = "당첨금을 수령하지 못했습니다.";
				
		return msg;
	}
	
//	@RequestMapping(value="user/updateCash")
//	public ModelAndView updateCashControl(ModelAndView mav, Authentication auth,
//			BigInteger cash, BigInteger prize_cash, boolean isInner) {
//		BigInteger new_cash = cash.add(prize_cash);
//		userService.updateCashService(auth.getName(), new_cash);
//		System.out.println("user/updateCash" + new_cash);
//		mav.addObject("cash", new_cash);
//		
//		if(isInner)
//			mav.setViewName("game/list");
//		else
//			mav.setViewName("t:game/list");
//		return mav;
//	}
	
}
