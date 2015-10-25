package com.mgm.mgm01.admin.controller;

import java.util.List;
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
import com.mgm.mgm01.reply.model.ReplyDto;
import com.mgm.mgm01.reply.model.ReplyService;
import com.mgm.mgm01.sercurity.UserDetailsVO;
import com.mgm.mgm01.user.model.UserService;

@Controller
public class AdminBoardController {
	@Autowired BoardService boardService;
	@Autowired UserService userService;
	@Autowired ReplyService replyService;
	
	@RequestMapping(value="/admin/board_write", method=RequestMethod.GET)
	public ModelAndView writeControl(ModelAndView mav, Authentication auth,
			@RequestParam(name="type")String type) {
		mav.setViewName("t:admin/write");
		mav.addObject("type", type);
		return mav;
	}

	@RequestMapping(value="/admin/board_write", method=RequestMethod.POST)
	public ModelAndView writeControl(ModelAndView mav, Authentication auth, BoardDto dto) {

		String nickname = ((UserDetailsVO)auth.getPrincipal()).getNickname();
		dto.setNickname(nickname);
		
		boardService.createBoardSerivce(dto);
		
		mav.setViewName("redirect:/admin/board?type="+dto.getType());
		return mav;
	}
	
	@RequestMapping(value="/admin/board")
	public ModelAndView noticeControl(ModelAndView mav, @RequestParam(defaultValue = "1") int start,
			Authentication auth, @RequestParam(name="type")String type) {
//		String type = "notice";
		Map<String, Object> info = boardService.readBoardListAllService(start, type);
		
		mav.addAllObjects(info);
		mav.addObject("type", type);
		mav.setViewName("t:admin/board");
		return mav;
	}
	
	@RequestMapping(value="/admin/details")
	public ModelAndView detailsControl(ModelAndView mav, @RequestParam(required=true) int num,
			Authentication auth) {
		BoardDto boardDto = boardService.readBoardOneService(num);
		List<ReplyDto> replyList = replyService.readReplyListService(num);
		
		mav.addObject("boardDto", boardDto);
		mav.addObject("replyList", replyList);
		mav.setViewName("t:admin/details");
		return mav;
	}
	
	@RequestMapping(value="/admin/reply_write", method=RequestMethod.POST)
	public ModelAndView replyWriteControl(ModelAndView mav, Authentication auth, ReplyDto dto) {
		
		replyService.createReplyService(dto);
		
		mav.setViewName("redirect:/admin/details?num="+dto.board_num);
		return mav;
	}
	
}
