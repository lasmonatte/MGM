package com.mgm.mgm01.trade.model;

import java.util.Map;

public interface TradeService {

	public int createTradeService(TradeDto dto);
	public TradeDto readTradeOneService(int t_num);
	public Map<String, Object> readTradeListAllService(String type, int p, boolean master, String admin_id);
	public Map<String, Object> readTradeListByIdService(String id, int p);
	public int updateTradeService(int t_num);
	public int deleteTradeService(int t_num);
}
