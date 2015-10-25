package com.mgm.mgm01.reply.model;

import java.util.List;

public interface ReplyDao {
	public int createReply(ReplyDto dto);
	public List<ReplyDto> readReplyList(int board_num);
	public int deleteReply(int reply_num);
}
