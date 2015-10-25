package com.mgm.mgm01.rule.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RuleDaoImpl implements RuleDao{

	@Autowired
	SqlSession session;

	@Override
	public int createBettingRule(BettingRuleDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.rule.model.RuleDao.createBettingRule", dto);
	}

	@Override
	public BettingRuleDto readBettingRule() {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.rule.model.RuleDao.readBettingRule");
	}

	@Override
	public int updateBettingRule(BettingRuleDto dto) {
		// TODO Auto-generated method stub
		System.out.println(dto);
		return session.update("com.mgm.mgm01.rule.model.RuleDao.updateBettingRule", dto);
	}

	@Override
	public int createTradeRule(TradeRuleDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.rule.model.RuleDao.createTradeRule", dto);
	}
	
	@Override
	public TradeRuleDto readTradeRule() {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.rule.model.RuleDao.readTradeRule");
	}

	@Override
	public int updateTradeRule(TradeRuleDto dto) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.rule.model.RuleDao.updateTradeRule", dto);
	}

	
}
