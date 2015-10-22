package com.mgm.mgm01.betting.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BettingDaoImpl implements BettingDao{

	@Autowired
	SqlSession session;
	
	@Override
	public int createBetting(BettingDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.betting.model.BettingDao.createBetting", dto);
	}

	@Override
	public BettingDto readBettingOne(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.betting.model.BettingDao.readBettingOne", id);
	}

	@Override
	public List<BettingDto> readBettingList(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.betting.model.BettingDao.readBettingList", info);
	}

	@Override
	public List<BettingDto> readBettingListAll(String id) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.betting.model.BettingDao.readBettingListAll", id);
	}
	
	@Override
	public List<BettingDto> readBettingListToUpdate() {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.betting.model.BettingDao.readBettingListToUpdate");
	}
	
	@Override
	public int updateBetting(BettingDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.betting.model.BettingDao.updateBetting", dto);
	}
	
	@Override
	public int updateBettingInfo(BettingDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.betting.model.BettingDao.updateBettingInfo", dto);
	}

	@Override
	public int updateBettingReceived(BettingDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.betting.model.BettingDao.updateBettingReceived", dto);
	}

	
	@Override
	public int deleteBetting(int betting_num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.betting.model.BettingDao.deleteBetting", betting_num);
	}
}
