package com.mgm.mgm01.board.model;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	public int createBoard(BoardDto dto);
	public BoardDto readBoardOne(int board_num);
	public List<BoardDto> readBoardList(Map<String, String> info);
	public List<BoardDto> readBoardListAll(String type);
	public int updateBoard(Map<String, Object> info);
	public int deleteBoard(int board_num);
	
	
}
