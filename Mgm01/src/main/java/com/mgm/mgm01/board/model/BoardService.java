package com.mgm.mgm01.board.model;

import java.util.Map;

public interface BoardService {

	public int createBoardSerivce(BoardDto dto);
	public BoardDto readBoardOneService(int board_num);
	public Map<String, Object> readBoardListService(String nickname, int p, String type);
	public Map<String, Object> readBoardListAllService(int p, String type);
	public int updateBoardService(int board_num, String content);
	public int deleteBoardService(int board_num);
}
