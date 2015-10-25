package com.mgm.mgm01.rule.model;

public interface RuleService {

	public int createBettingRuleService(BettingRuleDto dto);
	public BettingRuleDto readBettingRuleService();
	public int updateBettingRuleService(BettingRuleDto dto);
	
	public int createTradeRuleService(TradeRuleDto dto);
	public TradeRuleDto readTradeRuleService();
	public int updateTradeRuleService(TradeRuleDto dto);
}
