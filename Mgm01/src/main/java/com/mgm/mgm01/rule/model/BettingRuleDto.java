package com.mgm.mgm01.rule.model;

public class BettingRuleDto {

	private float dividend_oe;
	private float dividend_lr;
	private float dividend_line;
	private int betting_max;
	private int betting_min;
	private float tax;

	public float getDividend_oe() {
		return dividend_oe;
	}
	public void setDividend_oe(float dividend_oe) {
		this.dividend_oe = dividend_oe;
	}
	public float getDividend_lr() {
		return dividend_lr;
	}
	public void setDividend_lr(float dividend_lr) {
		this.dividend_lr = dividend_lr;
	}
	public float getDividend_line() {
		return dividend_line;
	}
	public void setDividend_line(float dividend_line) {
		this.dividend_line = dividend_line;
	}
	public int getBetting_max() {
		return betting_max;
	}
	public void setBetting_max(int betting_max) {
		this.betting_max = betting_max;
	}
	public int getBetting_min() {
		return betting_min;
	}
	public void setBetting_min(int betting_min) {
		this.betting_min = betting_min;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	
	@Override
	public String toString() {
		return "BettingRuleDto [dividend_oe=" + dividend_oe + ", dividend_lr=" + dividend_lr + ", dividend_line="
				+ dividend_line + ", betting_max=" + betting_max + ", betting_min=" + betting_min + ", tax=" + tax
				+ "]";
	}
}
