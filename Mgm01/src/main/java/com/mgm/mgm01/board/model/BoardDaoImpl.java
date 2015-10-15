package com.mgm.mgm01.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDaoImpl implements BoardDao{

	@Autowired SqlSession session;
	
	@Override
	public int createBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.board.model.BoardDao.createBoard", dto);
	}

	@Override
	public BoardDto readBoardOne(int board_num) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.board.model.BoardDao.readBoardOne", board_num);
	}

	@Override
	public List<BoardDto> readBoardList(Map<String, String> info) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.board.model.BoardDao.readBoardList", info);
	}

	@Override
	public List<BoardDto> readBoardListAll(String type) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.board.model.BoardDao.readBoardListAll", type);
	}

	@Override
	public int updateBoard(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.board.model.BoardDao.updateBoard", info);
	}

	@Override
	public int deleteBoard(int board_num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.board.model.BoardDao.deleteBoard", board_num);
	}

}
