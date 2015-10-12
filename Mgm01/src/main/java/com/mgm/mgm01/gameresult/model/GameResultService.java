package com.mgm.mgm01.gameresult.model;

import java.util.List;

public interface GameResultService {

	public int createGameResultService(GameResultDto dto);
	public GameResultDto readGameResultOneService(int game_num);
	public List<GameResultDto> readGameResultListService(int start, int end);
	public int updateGameResultService(GameResultDto dto);
}
