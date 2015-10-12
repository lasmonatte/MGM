package com.mgm.mgm01.gameresult.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GameResultServiceImpl implements GameResultService{

	@Autowired GameResultDao dao;

	@Override
	public int createGameResultService(GameResultDto dto) {
		// TODO Auto-generated method stub
		return dao.createGameResult(dto);
	}

	@Override
	public GameResultDto readGameResultOneService(int game_num) {
		// TODO Auto-generated method stub
		return dao.readGameResultOne(game_num);
	}

	@Override
	public List<GameResultDto> readGameResultListService(int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> info = new HashMap<String, Integer>();
		info.put("start", start);
		info.put("end", end);
		
		return dao.readGameResultList(info);
	}

	@Override
	public int updateGameResultService(GameResultDto dto) {
		// TODO Auto-generated method stub
		return dao.updateGameResult(dto);
	}
	
	
}
