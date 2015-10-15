package com.mgm.mgm01.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDao dao;

	@Override
	public int createBoardSerivce(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.createBoard(dto);
	}

	@Override
	public BoardDto readBoardOneService(int board_num) {
		// TODO Auto-generated method stub
		return dao.readBoardOne(board_num);
	}

	@Override
	public Map<String, Object> readBoardListService(String nickname, int p, String type) {
		// TODO Auto-generated method stub
		Map<String, String> info = new HashMap<String, String>();
		info.put("nickname", nickname);
		info.put("type", type);
		
		List<BoardDto> list = dao.readBoardList(info);
		Map<String, Object> info2 = new HashMap<String, Object>();
		
		int size = 10;	// 몇개씩 볼것인지
		int pageSize = list.size()/size;
		if(list.size()%size != 0)
			pageSize++;
		int start = (p - 1) * size;
		int end = p * size;
		if (end > list.size())
			end = list.size();
		info2.put("size", pageSize);
		info2.put("list", list.subList(start, end));
		
		return info2;
	}

	@Override
	public Map<String, Object> readBoardListAllService(int p, String type) {
		// TODO Auto-generated method stub
		List<BoardDto> list = dao.readBoardListAll(type);
		Map<String, Object> info = new HashMap<String, Object>();
		
		int size = 10;	// 몇개씩 볼것인지
		int pageSize = list.size()/size;
		if(list.size()%size != 0)
			pageSize++;
		int start = (p - 1) * size;
		int end = p * size;
		if (end > list.size())
			end = list.size();
		info.put("size", pageSize);
		info.put("list", list.subList(start, end));
		
		return info;
	}

	@Override
	public int updateBoardService(int board_num, String content) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("board_num", board_num);
		info.put("content", content);
		
		return dao.updateBoard(info);
	}

	@Override
	public int deleteBoardService(int board_num) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(board_num);
	}
	
	
}
