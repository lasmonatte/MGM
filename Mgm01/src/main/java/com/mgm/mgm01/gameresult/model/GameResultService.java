package com.mgm.mgm01.gameresult.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

public interface GameResultService {

	public void createGameResultService() throws MalformedURLException, IOException;
	public GameResultDto readGameResultOneService(int game_num);
	public List<GameResultDto> readGameResultListService(int start, int end);
	public int updateGameResultService(GameResultDto dto);
}
