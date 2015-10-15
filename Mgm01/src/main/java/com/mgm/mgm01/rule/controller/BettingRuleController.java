package com.mgm.mgm01.rule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mgm.mgm01.rule.model.RuleService;

@Controller
public class BettingRuleController {

	@Autowired RuleService ruleService;
	
}
