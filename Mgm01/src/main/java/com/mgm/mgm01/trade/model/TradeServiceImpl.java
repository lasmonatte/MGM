package com.mgm.mgm01.trade.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TradeServiceImpl implements TradeService{

	@Autowired TradeDao dao;

	@Override
	public int createTradeService(TradeDto dto) {
		// TODO Auto-generated method stub
		return dao.createTrade(dto);
	}

	@Override
	public TradeDto readTradeOneService(int t_num) {
		// TODO Auto-generated method stub
		return dao.readTradeOne(t_num);
	}

	@Override
	public Map<String, Object>  readTradeListAllService(String type, int p, boolean master, String admin_id) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("type", type);
		info.put("master", master);
		info.put("admin_id", admin_id);
		
		List<TradeDto> list = dao.readTradeListAll(info);
		int size = 10;	// 몇개씩 볼것인지
		int pageSize = list.size()/size;
		
		if(list.size()%size != 0)
			pageSize++;
		
		int start = (p - 1) * size;
		int end = p * size;
		
		if (end > list.size())
			end = list.size();
		
		info.put("size", pageSize);
		info.put("list", list.subList(start, end));
		
		return info;
	}

	@Override
	public Map<String, Object> readTradeListByIdService(String id, int p) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();

		List<TradeDto> list = dao.readTradeListById(id);
		
		int size = 10;	// 몇개씩 볼것인지
		int pageSize = list.size()/size;
		
		if(list.size()%size != 0)
			pageSize++;
		
		int start = (p - 1) * size;
		int end = p * size;
		
		if (end > list.size())
			end = list.size();
		
		info.put("size", pageSize);
		info.put("list", list.subList(start, end));
		
		return info;
	}

	@Override
	public int updateTradeService(int t_num) {
		// TODO Auto-generated method stub
		return dao.updateTrade(t_num);
	}

	@Override
	public int deleteTradeService(int t_num) {
		// TODO Auto-generated method stub
		return dao.deleteTrade(t_num);
	}
	
	
}
