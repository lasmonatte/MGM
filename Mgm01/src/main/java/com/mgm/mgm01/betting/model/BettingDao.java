package com.mgm.mgm01.betting.model;

import java.util.List;

public interface BettingDao {

	public int createBetting(BettingDto dto);
	public BettingDto readBettingOne(String id);
	public List<BettingDto> readBettingListById(String id);
	public List<BettingDto> readBettingListAll();
	public List<BettingDto> readBettingListToUpdate();
	public int updateBetting(BettingDto dto);
	public int updateBettingInfo(BettingDto dto);
	public int updateBettingReceived(BettingDto dto);
	public int deleteBetting(int betting_num); 
}
