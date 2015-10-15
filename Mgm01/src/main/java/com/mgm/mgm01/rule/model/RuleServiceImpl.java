package com.mgm.mgm01.rule.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RuleServiceImpl implements RuleService{

	@Autowired RuleDao dao;
	
	@Override
	public int createBettingRuleService(BettingRuleDto dto) {
		// TODO Auto-generated method stub
		return dao.createBettingRule(dto);
	}

	@Override
	public BettingRuleDto readBettingRuleService() {
		// TODO Auto-generated method stub
		return dao.readBettingRule();
	}

	@Override
	public int updateBettingRuleService(BettingRuleDto dto) {
		// TODO Auto-generated method stub
		return dao.updateBettingRule(dto);
	}

	@Override
	public TradeRuleDto readTradeRuleService() {
		// TODO Auto-generated method stub
		return dao.readTradeRule();
	}

	
	
}
