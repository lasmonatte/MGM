package com.mgm.mgm01.cashinfo.model;

import java.math.BigInteger;
import java.sql.Timestamp;

public class CashInfoDto {

	private int cashinfo_num;
	private BigInteger breakdown;
	private String type;
	private String id;
	private Timestamp date;
	
	public int getCashinfo_num() {
		return cashinfo_num;
	}
	public void setCashinfo_num(int cashinfo_num) {
		this.cashinfo_num = cashinfo_num;
	}
	public BigInteger getBreakdown() {
		return breakdown;
	}
	public void setBreakdown(BigInteger breakdown) {
		this.breakdown = breakdown;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "CashInfoDto [cashinfo_num=" + cashinfo_num + ", breakdown=" + breakdown + ", type=" + type + ", id="
				+ id + ", date=" + date + "]";
	}
}
