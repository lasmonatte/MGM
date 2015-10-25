package com.mgm.mgm01.reply.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	SqlSession session;

	@Override
	public int createReply(ReplyDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.reply.model.ReplyDao.createReply", dto);
	}

	@Override
	public List<ReplyDto> readReplyList(int board_num) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.reply.model.ReplyDao.readReplyList", board_num);
	}

	@Override
	public int deleteReply(int reply_num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.reply.model.ReplyDao.deleteReply", reply_num);
	}
}
