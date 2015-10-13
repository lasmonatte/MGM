package com.mgm.mgm01.gameresult.model;

import java.sql.Timestamp;

public class GameResultDto {

	private int game_num;
	private Timestamp date;
	private int ordernum;
	private String oe;
	private String lr;
	private int line;
	
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
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getOe() {
		return oe;
	}
	public void setOe(String oe) {
		this.oe = oe;
	}
	public String getLr() {
		return lr;
	}
	public void setLr(String lr) {
		this.lr = lr;
	}
	public int getLine() {
		return line;
	}
	public void setLine(int line) {
		this.line = line;
	}


}
