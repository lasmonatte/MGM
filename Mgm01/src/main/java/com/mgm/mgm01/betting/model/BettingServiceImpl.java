package com.mgm.mgm01.betting.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mgm.mgm01.gameresult.model.GameResultService;

@Component
public class BettingServiceImpl implements BettingService{

	@Autowired BettingDao dao;
	@Autowired GameResultService gameResultService;
	
	@Override
	public int createBettingService(BettingDto dto) {
		// TODO Auto-generated method stub
		return dao.createBetting(dto);
	}

	@Override
	public BettingDto readBettingOneService(String id) {
		// TODO Auto-generated method stub
		return dao.readBettingOne(id);
	}

	@Override
	public List<BettingDto> readBettingListService(String id, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("id", id);
		info.put("start", start);
		info.put("end", end);
		
		return dao.readBettingList(info);
	}
	
	@Override
	public List<BettingDto> readBettingListAllService(String id) {
		// TODO Auto-generated method stub
		return dao.readBettingListAll(id);
	}

	@Override
	public List<BettingDto> readBettingListToUpdateService() {
		// TODO Auto-generated method stub
		return dao.readBettingListToUpdate();
	}
	
	@Override
	public int updateBettingService(BettingDto dto) {
		// TODO Auto-generated method stub
		return dao.updateBetting(dto);
	}

	@Override
	public int updateBettingInfoService(BettingDto dto) {
		// TODO Auto-generated method stub
		return dao.updateBettingInfo(dto);
	}
	
	
	@Override
	public int deleteBettingService(int betting_num) {
		// TODO Auto-generated method stub
		return dao.deleteBetting(betting_num);
	}

	
	public Map<String, Object> readPageServiceNaver(int p, String id) {
		List<BettingDto> li = readBettingListAllService(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 5;
		int pageSize = li.size()/size;
		if(li.size()%size != 0)
			pageSize++;
		// sublist ó���ؼ� �����͸� ����
		// 10���� �ѷ��߰ڴٰ� �����Ѵٸ�,
		// p�� 1�϶� 0~9 , 2�̸� 10~19, 3�̸� 20 ~29
		int start = (p - 1) * size;
		int end = p * size;
		if (end > li.size())
			end = li.size();
		map.put("size", pageSize);
		map.put("list", li.subList(start, end));
		return map;
	}

	@Override
	public int updateBettingReceivedService(int game_num, String id) {
		// TODO Auto-generated method stub
		BettingDto dto = new BettingDto();
		dto.setGame_num(game_num);
		dto.setId(id);
		
		return dao.updateBettingReceived(dto);
	}

}
