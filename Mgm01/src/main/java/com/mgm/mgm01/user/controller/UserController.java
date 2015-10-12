package com.mgm.mgm01.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
