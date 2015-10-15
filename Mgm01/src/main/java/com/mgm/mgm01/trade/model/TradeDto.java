package com.mgm.mgm01.trade.model;

import java.math.BigInteger;
import java.sql.Timestamp;

public class TradeDto {

	private int t_num;
	private String id;
	private String name;
	private String b_bankname;
	private String b_username;
	private String b_account;
	private Timestamp date;
	private BigInteger amount;
	private String type;
	private boolean result;
	private Timestamp result_date;

	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getB_account() {
		return b_account;
	}
	public void setB_account(String b_account) {
		this.b_account = b_account;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public BigInteger getAmount() {
		return amount;
	}
	public void setAmount(BigInteger amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public Timestamp getResult_date() {
		return result_date;
	}
	public void setResult_date(Timestamp result_date) {
		this.result_date = result_date;
	}
	
	@Override
	public String toString() {
		return "TradeDto [t_num=" + t_num + ", id=" + id + ", name=" + name + ", b_bankname=" + b_bankname
				+ ", b_username=" + b_username + ", b_account=" + b_account + ", date=" + date + ", amount=" + amount
				+ ", type=" + type + ", result=" + result + ", result_date=" + result_date + "]";
	}
}
