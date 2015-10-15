package com.mgm.mgm01.gameresult.model;

import java.util.List;
import java.util.Map;

public interface GameResultDao {

	public int createGameResult(GameResultDto dto);
	public GameResultDto readGameResultOne(int game_num);
	public List<GameResultDto> readGameResultList(Map<String, Integer> info);
	public int updateGameResult(GameResultDto dto);
	
}
