package com.mgm.mgm01.trade.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TradeDaoImpl implements TradeDao {

	@Autowired
	SqlSession session;
	
	@Override
	public int createTrade(TradeDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.trade.model.TradeDao.createTrade", dto);
	}

	@Override
	public TradeDto readTradeOne(int t_num) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.trade.model.TradeDao.readTradeOne", t_num);
	}

	@Override
	public List<TradeDto> readTradeListAll() {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.trade.model.TradeDao.readTradeListAll");
	}

	@Override
	public List<TradeDto> readTradeListById(String id) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.trade.model.TradeDao.readTradeListById", id);
	}


	@Override
	public int updateTrade(TradeDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.trade.model.TradeDao.updateTrade", dto);
	}

	@Override
	public int deleteTrade(int t_num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.trade.model.TradeDao.deleteTrade", t_num);
	}

}
