package com.mgm.mgm01.rule.model;

public interface RuleService {

	public int createBettingRuleService(BettingRuleDto dto);
	public BettingRuleDto readBettingRuleService();
	public int updateBettingRuleService(BettingRuleDto dto);
	
	public TradeRuleDto readTradeRuleService();
}
