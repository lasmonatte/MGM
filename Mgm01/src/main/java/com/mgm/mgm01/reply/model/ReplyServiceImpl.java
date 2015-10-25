package com.mgm.mgm01.reply.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired ReplyDao dao;
	
	@Override
	public int createReplyService(ReplyDto dto) {
		// TODO Auto-generated method stub
		return dao.createReply(dto);
	}

	@Override
	public List<ReplyDto> readReplyListService(int board_num) {
		// TODO Auto-generated method stub
		return dao.readReplyList(board_num);
	}

	@Override
	public int deleteReplyService(int reply_num) {
		// TODO Auto-generated method stub
		return dao.deleteReply(reply_num);
	}

	
}
