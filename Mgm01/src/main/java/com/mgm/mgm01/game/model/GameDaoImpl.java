package com.mgm.mgm01.game.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GameDaoImpl implements GameDao{

	@Autowired
	SqlSession session;

	@Override
	public int createGame(GameDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.game.model.GameDao.createGame", dto);
	}

	@Override
	public GameDto readGameOne(int game_num) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.game.model.GameDao.readGameOne", game_num);
	}

	@Override
	public List<GameDto> readGameList(Map<String, Integer> info) {
		// TODO Auto-generated method stub
		
		return session.selectList("com.mgm.mgm01.game.model.GameDao.readGameList", info);
	}

	@Override
	public int updateGame(GameDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.game.model.GameDao.updateGame", dto);
	}
	
	
}
