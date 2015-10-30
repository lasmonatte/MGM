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
		mav.setViewName("redirect:/game/ladder");
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

	@RequestMapping(value="user/updateInfo", method=RequestMethod.GET)
	public ModelAndView infoControl(ModelAndView mav, Authentication auth) {
		UserDto dto = userService.readUserService(auth.getName());
		String type="";

		if(auth.getAuthorities().toString().equals("[ROLE_USER]"))
			type="user";
		else
			type="admin";

		mav.addObject("dto", dto);
		mav.addObject("type", type);
		mav.setViewName("user/updateInfo");
		return mav;
	}

	@RequestMapping(value="user/updateInfo", method=RequestMethod.POST)
	public ModelAndView updateInfoControl(ModelAndView mav, Authentication auth, UserDto dto, String type) {
		System.err.println(dto.getPassword());
		System.err.println(dto.getB_password());
		userService.updateUserInfoService(dto);
		userService.updateUserAccountService(dto);

		mav.setViewName("redirect:/user/logout");
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

	@ResponseBody
	@RequestMapping(value="user/reg_inner", produces="text/plain;charset=UTF-8")
	public String regInnerControl(ModelAndView mav, String type, String msg) {
		String message="";
		int result = userService.readUserForRegister(type, msg);
		if(type.equals("id"))
			message = (result>0)?"이미 존재하는 아이디입니다.":"사용가능한 아이디입니다.";

		if(type.equals("recmd_id"))
			message = (result>0)?"추천인 아이디가 확인되었습니다.":"존재하지 않는 추천인 아이디입니다.";

		return message;
	}

}
