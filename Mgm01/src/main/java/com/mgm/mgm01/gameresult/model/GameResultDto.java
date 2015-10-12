package com.mgm.mgm01.gameresult.model;

import java.security.Timestamp;

public class GameResultDto {

	private int game_num;
	private Timestamp date;
	private int orderNum;
	private String OE;
	private String LR;
	private int Line;
	
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOE() {
		return OE;
	}
	public void setOE(String oE) {
		OE = oE;
	}
	public String getLR() {
		return LR;
	}
	public void setLR(String lR) {
		LR = lR;
	}
	public int getLine() {
		return Line;
	}
	public void setLine(int line) {
		Line = line;
	}


}
