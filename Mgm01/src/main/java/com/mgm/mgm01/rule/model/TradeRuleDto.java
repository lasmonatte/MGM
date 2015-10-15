package com.mgm.mgm01.rule.model;

public class TradeRuleDto {

	private int rule_num;
	private String b_account;
	private String b_bankname;
	private String b_username;
	
	public int getRule_num() {
		return rule_num;
	}
	public void setRule_num(int rule_num) {
		this.rule_num = rule_num;
	}
	public String getB_account() {
		return b_account;
	}
	public void setB_account(String b_account) {
		this.b_account = b_account;
	}
	public String getB_bankname() {
		return b_bankname;
	}
	public void setB_bankname(String b_bankname) {
		this.b_bankname = b_bankname;
	}
	public String getB_username() {
		return b_username;
	}
	public void setB_username(String b_username) {
		this.b_username = b_username;
	}
}
