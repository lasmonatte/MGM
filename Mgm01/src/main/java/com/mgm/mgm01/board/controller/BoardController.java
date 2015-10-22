package com.mgm.mgm01.board.controller;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgm.mgm01.board.model.BoardDto;
import com.mgm.mgm01.board.model.BoardService;
import com.mgm.mgm01.sercurity.UserDetailsVO;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class BoardController {

	@Autowired BoardService boardService;
	@Autowired UserService userService;
	
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public ModelAndView writeControl(ModelAndView mav, String type, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		
		mav.addObject("type", type);
		mav.addObject("cash", cash);
		mav.setViewName("t:board/write");
		return mav;
	}

	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public ModelAndView writeControl(ModelAndView mav, Authentication auth, BoardDto dto) {
		BigInteger cash = userService.readCashService(auth.getName());
		String nickname = ((UserDetailsVO)auth.getPrincipal()).getNickname();
		dto.setNickname(nickname);
		boardService.createBoardSerivce(dto);

		
		mav.addObject("cash", cash);
		mav.setViewName("redirect:/board/"+dto.getType());
		return mav;
	}
	
	@RequestMapping(value="/board/notice")
	public ModelAndView noticeControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start,
			Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		String type = "notice";
		Map<String, Object> info = boardService.readBoardListAllService(start, type);
		
		mav.addAllObjects(info);
		mav.addObject("type", type);
		mav.addObject("cash", cash);
		mav.setViewName("t:board/notice");
		return mav;
	}
	
	@RequestMapping(value="/board/customer")
	public ModelAndView customerControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start,
			@RequestParam(defaultValue="")String id, Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		String type = "customer";
		Map<String, Object> info = null;
		String nickname = ((UserDetailsVO)auth.getPrincipal()).getNickname();
		
		if(id.equals(auth.getName()))	
			info = boardService.readBoardListService(nickname, start, type);
		else
			info = boardService.readBoardListAllService(start, type);
			
		mav.addAllObjects(info);
		mav.addObject("type", type);
		mav.addObject("cash", cash);
		mav.setViewName("t:board/customer");
		return mav;
	}
	
	@RequestMapping(value="/board/details")
	public ModelAndView detailsControl(ModelAndView mav, @RequestParam(required=true) int num,
			Authentication auth) {
		BigInteger cash = userService.readCashService(auth.getName());
		BoardDto boardDto = boardService.readBoardOneService(num);

		mav.addObject("boardDto", boardDto);
		mav.addObject("cash", cash);
		mav.setViewName("t:board/details");
		return mav;
	}
	

}
