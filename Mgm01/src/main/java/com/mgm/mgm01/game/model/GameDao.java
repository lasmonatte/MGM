package com.mgm.mgm01.game.model;

import java.util.List;
import java.util.Map;

public interface GameDao {

	public int createGame(GameDto dto);
	public GameDto readGameOne(int game_num);
	public List<GameDto> readGameList(Map<String, Integer> info);
	public int updateGame(GameDto dto);
	
}
