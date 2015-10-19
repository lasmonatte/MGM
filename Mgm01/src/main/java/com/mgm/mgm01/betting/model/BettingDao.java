package com.mgm.mgm01.betting.model;

import java.util.List;
import java.util.Map;

public interface BettingDao {

	public int createBetting(BettingDto dto);
	public BettingDto readBettingOne(String id);
	public List<BettingDto> readBettingList(Map<String, Object> info);
	public List<BettingDto> readBettingListAll(String id);
	public List<BettingDto> readBettingListToUpdate();
	public int updateBetting(BettingDto dto);
	public int updateBettingInfo(BettingDto dto);
	public int deleteBetting(int betting_num); 
}
