package com.mgm.mgm01.admin.controller;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingService;
import com.mgm.mgm01.board.model.BoardService;
import com.mgm.mgm01.cashinfo.model.CashInfoDto;
import com.mgm.mgm01.cashinfo.model.CashInfoService;
import com.mgm.mgm01.trade.model.TradeDto;
import com.mgm.mgm01.trade.model.TradeService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class AdminController {

	@Autowired UserService userService;
	@Autowired CashInfoService cashInfoService;
	@Autowired BoardService boardService;
	@Autowired BettingService bettingService;
	@Autowired TradeService tradeService;

	@RequestMapping(value="/admin/main",method=RequestMethod.GET)
	public ModelAndView mainControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start, Authentication auth){
		Map<String, Object> map = userService.readAllUserService(start, "ROLE_USER");

		mav.addAllObjects(map);
		mav.setViewName("t:admin/main");
		return mav;
	}
	
	@RequestMapping(value="/admin/userInfo",method=RequestMethod.GET)
	public ModelAndView userInfoControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start, Authentication auth){
		Map<String, Object> map = userService.readAllUserService(start, "ROLE_USER");

		mav.addAllObjects(map);
		mav.setViewName("t:admin/userInfo");
		return mav;
	}

	@RequestMapping("/admin/cashInfo")
	public ModelAndView cashInfoControl(ModelAndView mav,  Authentication auth,
			@RequestParam(defaultValue="all")String type, @RequestParam(defaultValue = "1") int start) {
		// List li = bls.readAllService();
		Map<String, Object> map = cashInfoService.readCashInfoAll(start, type);
		
		mav.addAllObjects(map);
		mav.addObject("type", type);
		mav.setViewName("t:admin/cashInfo");
		return mav;
	}
	
	@RequestMapping("/admin/bettinglist")
	public ModelAndView betlistControl(ModelAndView mav,  Authentication auth,
			@RequestParam(name="type")String type, @RequestParam(defaultValue = "1") int start) {
		// List li = bls.readAllService();
		Map<String, Object> map = bettingService.readBettingListAllService(start);
		mav.addAllObjects(map);
		mav.addObject("type", type);
		mav.setViewName("t:admin/bettingList");
		return mav;
	}
	
	@RequestMapping("/admin/tradeInfo")
	public ModelAndView tradeInfoControl(ModelAndView mav,  Authentication auth,
			@RequestParam(name="type")String type, @RequestParam(defaultValue = "1") int start) {
		// List li = bls.readAllService();
		Map<String, Object> map = tradeService.readTradeListAllService(type, start);
		mav.addAllObjects(map);
		mav.addObject("type", type);
		mav.setViewName("t:admin/tradeInfo");
		return mav;
	}


	@Transactional
	@ResponseBody
	@RequestMapping(value="/admin/trade",produces="text/plain;charset=UTF-8")
	public String newControl(ModelAndView mav, @RequestParam(value="t_num")int t_num) {
		String msg="기본형";
		CashInfoDto cashInfoDto = new CashInfoDto();
		
		TradeDto dto = tradeService.readTradeOneService(t_num);
		BigInteger userCash = userService.readCashService(dto.getId());
		
		if(dto.getType().equals("charge"))
			userCash = userCash.add(dto.getAmount());
		else
			userCash = userCash.subtract(dto.getAmount());

		userService.updateCashService(dto.getId(), userCash);
		tradeService.updateTradeService(t_num);
		
		cashInfoDto.setId(dto.getId());
		cashInfoDto.setType(dto.getType());
		cashInfoDto.setBreakdown(dto.getAmount());
		cashInfoService.createCashInfo(cashInfoDto);
		msg="처리되었습니다.";
		return msg;
	}
}
