package com.mgm.mgm01.betting.model;

import java.util.List;
import java.util.Map;

public interface BettingService {

	public int createBettingService(BettingDto dto);
	public BettingDto readBettingOneService(String id);
	public List<BettingDto> readBettingListService(String id, int start, int end);
	public List<BettingDto> readBettingListAllService(String id);
	public List<BettingDto> readBettingListToUpdateService();
	public int updateBettingService(BettingDto dto);
	public int updateBettingInfoService(BettingDto dto);
	public int updateBettingReceivedService(int game_num, String id);
	public int deleteBettingService(int betting_num);
	public Map<String, Object> readPageServiceNaver(int p, String id);
}
