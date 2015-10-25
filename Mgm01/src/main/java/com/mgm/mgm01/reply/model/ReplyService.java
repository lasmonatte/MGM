package com.mgm.mgm01.reply.model;

import java.util.List;

public interface ReplyService {
	public int createReplyService(ReplyDto dto);
	public List<ReplyDto> readReplyListService(int board_num);
	public int deleteReplyService(int reply_num);
}
