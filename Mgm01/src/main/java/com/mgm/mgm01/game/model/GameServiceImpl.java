package com.mgm.mgm01.game.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GameServiceImpl implements GameService{

	@Autowired GameDao dao;

	@Override
	public int createGameService(GameDto dto) {
		// TODO Auto-generated method stub
		return dao.createGame(dto);
	}

	@Override
	public GameDto readGameOneService(int game_num) {
		// TODO Auto-generated method stub
		return dao.readGameOne(game_num);
	}

	@Override
	public List<GameDto> readGameListService(int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> info = new HashMap<String, Integer>();
		info.put("start", start);
		info.put("end", end);
		
		return dao.readGameList(info);
	}

	@Override
	public int updateGameService(GameDto dto) {
		// TODO Auto-generated method stub
		return dao.updateGame(dto);
	}
	
	
}
