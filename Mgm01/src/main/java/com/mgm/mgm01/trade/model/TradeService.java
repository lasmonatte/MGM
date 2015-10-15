package com.mgm.mgm01.trade.model;

import java.util.Map;

public interface TradeService {

	public int createTradeService(TradeDto dto);
	public TradeDto readTradeOneService(int t_num);
	public Map<String, Object> readTradeListAllService(int p);
	public Map<String, Object> readTradeListByIdService(String id, int p);
	public int updateTradeService(TradeDto dto);
	public int deleteTradeService(int t_num);
}
