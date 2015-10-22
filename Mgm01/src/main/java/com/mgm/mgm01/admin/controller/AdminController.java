package com.mgm.mgm01.admin.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.user.model.UserDto;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/main",method=RequestMethod.GET)
	public ModelAndView mainControl(ModelAndView mav, Authentication auth){
		System.out.println("admin");
		
		//fake
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		UserDto dto = new UserDto();
		dto.setB_account("12-1234-4567");
		dto.setB_bankname("신한은행");
		dto.setB_username("예금주는테스트");
		dto.setCash(BigInteger.valueOf(1000000000));
		dto.setId("test");
		dto.setName("이름은테스트");
		dto.setNickname("닉네임도테스트");
		dto.setPhone(1012345678);
		dto.setRecmd_id("추천인은유저");
		
		userDtoList.add(dto);
		
		mav.addObject("userDtoList", userDtoList);
		mav.setViewName("t:admin/main");
		return mav;
	}
}
