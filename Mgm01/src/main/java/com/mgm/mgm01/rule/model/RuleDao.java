package com.mgm.mgm01.rule.model;

public interface RuleDao {

	public int createBettingRule(BettingRuleDto dto);
	public BettingRuleDto readBettingRule();
	public int updateBettingRule(BettingRuleDto dto);
	
	public int createTradeRule(TradeRuleDto dto);
	public TradeRuleDto readTradeRule();
	public int updateTradeRule(TradeRuleDto dto);
	
}
