package com.mgm.mgm01.game.model;

import java.util.List;

public interface GameService {

	public int createGameService(GameDto dto);
	public GameDto readGameOneService(int game_num);
	public List<GameDto> readGameListService(int start, int end);
	public int updateGameService(GameDto dto);
}
