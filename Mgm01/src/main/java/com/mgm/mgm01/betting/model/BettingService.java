package com.mgm.mgm01.betting.model;

import java.util.List;
import java.util.Map;

public interface BettingService {

	public int createBettingService(BettingDto dto);
	public BettingDto readBettingOneService(String id);
	public Map<String, Object>readBettingListByIdService(String id, int p);
	public Map<String, Object> readBettingListAllService(int p, boolean master, String admin_id);
	public List<BettingDto> readBettingListToUpdateService();
	public int updateBettingService(BettingDto dto);
	public int updateBettingInfoService(BettingDto dto);
	public int updateBettingReceivedService(int game_num, String id);
	public int deleteBettingService(int betting_num);
}
