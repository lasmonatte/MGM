package com.mgm.mgm01.betting.controller;

import java.math.BigInteger;
import java.time.Duration;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.betting.model.BettingDto;
import com.mgm.mgm01.betting.model.BettingService;
import com.mgm.mgm01.gameresult.model.GameResultDto;
import com.mgm.mgm01.gameresult.model.GameResultService;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class BettingController {
	@Autowired BettingService bettingService;
	@Autowired UserService userService;
	@Autowired GameResultService gameResultService;

	@Transactional
	@ResponseBody
	@RequestMapping(value="/betting/new",produces="text/plain;charset=UTF-8")
	public String newControl(ModelAndView mav, Authentication auth, BettingDto dto,
			@RequestParam(value="cash")BigInteger cash) {
		String msg="기본형";

		dto.setId(auth.getName());
		BettingDto tmpDto = bettingService.readBettingOneService(auth.getName());
		GameResultDto gameResultDto = gameResultService.readGameResultOneService();

		//check Duration
		Instant instant = Instant.now();
		Instant instant2 = gameResultDto.getDate().toInstant();
		//		Instant instant3 = tmpDto.getDate().toInstant();

		Duration duration = Duration.between(instant2, instant);
		//		Duration duration2 = Duration.between(instant3, instant);

		long seconds = duration.getSeconds();
		//		long seconds2 = duration2.getSeconds();

		if(seconds<180) {
			dto.setGame_num(gameResultDto.getGame_num()+1);
			if(tmpDto!=null) {
				dto.setBetting_num(tmpDto.getBetting_num());

				if(tmpDto.getOrdernum()==dto.getOrdernum()) {
					BigInteger cash2 = userService.readCashService(auth.getName());
					cash = cash2.add(BigInteger.valueOf(tmpDto.getBetting_money()));
					cash = cash.subtract(BigInteger.valueOf(dto.getBetting_money()));
					bettingService.updateBettingInfoService(dto);
					userService.updateCashService(auth.getName(), cash);
					msg = "배팅내용을 변경하였습니다.";
				}

				else {
					bettingService.createBettingService(dto);
					userService.updateCashService(auth.getName(), cash);
					msg = "배팅에 성공하였습니다.";
				}
			} else {
				bettingService.createBettingService(dto);
				userService.updateCashService(auth.getName(), cash);
				msg = "배팅에 성공하였습니다.";
			}
		} else
			msg="배팅 가능시간이 지났습니다.\n 다음회차에 배팅해주세요";

		return msg;
	}


}