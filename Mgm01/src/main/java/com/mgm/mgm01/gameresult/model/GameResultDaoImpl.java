package com.mgm.mgm01.gameresult.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GameResultDaoImpl implements GameResultDao{

	@Autowired
	SqlSession session;

	@Override
	public int createGameResult(GameResultDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.gameresult.model.GameResultDao.createGameResult", dto);
	}

	@Override
	public GameResultDto readGameResultOne(int game_num) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.gameresult.model.GameResultDao.readGameResultOne", game_num);
	}

	@Override
	public List<GameResultDto> readGameResultList(Map<String, Integer> info) {
		// TODO Auto-generated method stub
		
		return session.selectList("com.mgm.mgm01.gameresult.model.GameResultDao.readGameResultList", info);
	}

	@Override
	public int readGameNumRecently() {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.gameresult.model.GameResultDao.readGameNumRecently");
	}

	@Override
	public int updateGameResult(GameResultDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.gameresult.model.GameResultDao.updateGameResult", dto);
	}

	
	
}
