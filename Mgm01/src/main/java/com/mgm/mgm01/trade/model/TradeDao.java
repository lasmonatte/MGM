package com.mgm.mgm01.trade.model;

import java.util.List;

public interface TradeDao {
	public int createTrade(TradeDto dto);
	public TradeDto readTradeOne(int t_num);
	public List<TradeDto> readTradeListAll(String type);
	public List<TradeDto> readTradeListById(String id);
	public int updateTrade(int t_num);
	public int deleteTrade(int t_num);
	
}
