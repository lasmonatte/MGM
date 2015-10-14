package com.mgm.mgm01.user.controller;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.user.model.UserDto;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
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
}
