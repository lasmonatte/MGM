package com.mgm.mgm01.betting.model;

import java.sql.Timestamp;

public class BettingDto {

	private int betting_num;
	private String id;
	private int game_num;
	private int ordernum;
	private Timestamp date;
	private int betting_money;
	private int expect_money;
	private int prize_money;
	private float dividend;		// 배당
	private String betting_oe;
	private String betting_lr;
	private String betting_line;
	private boolean result_oe;
	private boolean result_lr;
	private boolean result_line;
	private String received;
	
	public int getBetting_num() {
		return betting_num;
	}
	public void setBetting_num(int betting_num) {
		this.betting_num = betting_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getBetting_money() {
		return betting_money;
	}
	public void setBetting_money(int betting_money) {
		this.betting_money = betting_money;
	}
	public int getExpect_money() {
		return expect_money;
	}
	public void setExpect_money(int expect_money) {
		this.expect_money = expect_money;
	}
	public int getPrize_money() {
		return prize_money;
	}
	public void setPrize_money(int prize_money) {
		this.prize_money = prize_money;
	}
	public float getDividend() {
		return dividend;
	}
	public void setDividend(float dividend) {
		this.dividend = dividend;
	}
	public String getBetting_oe() {
		return betting_oe;
	}
	public void setBetting_oe(String betting_oe) {
		this.betting_oe = betting_oe;
	}
	public String getBetting_lr() {
		return betting_lr;
	}
	public void setBetting_lr(String betting_lr) {
		this.betting_lr = betting_lr;
	}
	public String getBetting_line() {
		return betting_line;
	}
	public void setBetting_line(String betting_line) {
		this.betting_line = betting_line;
	}
	public boolean isResult_oe() {
		return result_oe;
	}
	public void setResult_oe(boolean result_oe) {
		this.result_oe = result_oe;
	}
	public boolean isResult_lr() {
		return result_lr;
	}
	public void setResult_lr(boolean result_lr) {
		this.result_lr = result_lr;
	}
	public boolean isResult_line() {
		return result_line;
	}
	public void setResult_line(boolean result_line) {
		this.result_line = result_line;
	}
	
	public String getReceived() {
		return received;
	}
	public void setReceived(String received) {
		this.received = received;
	}
	
	@Override
	public String toString() {
		return "BettingDto [betting_num=" + betting_num + ", id=" + id + ", ordernum=" + ordernum + ", date=" + date
				+ ", betting_money=" + betting_money + ", expect_money=" + expect_money + ", prize_money=" + prize_money
				+ ", dividend=" + dividend + ", betting_oe=" + betting_oe + ", betting_lr=" + betting_lr
				+ ", betting_line=" + betting_line + ", result_oe=" + result_oe + ", result_lr=" + result_lr
				+ ", result_line=" + result_line + ", received=" + received + "]";
	}

	
	
}
