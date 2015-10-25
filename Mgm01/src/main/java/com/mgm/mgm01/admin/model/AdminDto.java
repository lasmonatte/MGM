package com.mgm.mgm01.admin.model;

import java.math.BigInteger;
import java.sql.Timestamp;

public class AdminDto {

	private int admin_num;
	private String id;
	private BigInteger total_cash;
	private BigInteger total_charge;
	private BigInteger total_exchange;
	private BigInteger total_betting;
	private BigInteger total_win;
	private int total_user;
	private Timestamp date_salary;
	private BigInteger total_salary;
	private BigInteger salary;
	private float dividend;
	
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public BigInteger getTotal_cash() {
		return total_cash;
	}
	public void setTotal_cash(BigInteger total_cash) {
		this.total_cash = total_cash;
	}
	public BigInteger getTotal_charge() {
		return total_charge;
	}
	public void setTotal_charge(BigInteger total_charge) {
		this.total_charge = total_charge;
	}
	public BigInteger getTotal_exchange() {
		return total_exchange;
	}
	public void setTotal_exchange(BigInteger total_exchange) {
		this.total_exchange = total_exchange;
	}
	public BigInteger getTotal_betting() {
		return total_betting;
	}
	public void setTotal_betting(BigInteger total_betting) {
		this.total_betting = total_betting;
	}
	public BigInteger getTotal_win() {
		return total_win;
	}
	public void setTotal_win(BigInteger total_win) {
		this.total_win = total_win;
	}
	public int getTotal_user() {
		return total_user;
	}
	public void setTotal_user(int total_user) {
		this.total_user = total_user;
	}
	public Timestamp getDate_salary() {
		return date_salary;
	}
	public void setDate_salary(Timestamp date_salary) {
		this.date_salary = date_salary;
	}
	public BigInteger getTotal_salary() {
		return total_salary;
	}
	public void setTotal_salary(BigInteger total_salary) {
		this.total_salary = total_salary;
	}
	public BigInteger getSalary() {
		return salary;
	}
	public void setSalary(BigInteger salary) {
		this.salary = salary;
	}
	public float getDividend() {
		return dividend;
	}
	public void setDividend(float dividend) {
		this.dividend = dividend;
	}
	
	@Override
	public String toString() {
		return "AdminDto [admin_num=" + admin_num + ", id=" + id + ", total_cash=" + total_cash + ", total_charge="
				+ total_charge + ", total_exchange=" + total_exchange + ", total_betting=" + total_betting
				+ ", total_win=" + total_win + ", total_user=" + total_user
				+ ", date_salary=" + date_salary + ", total_salary=" + total_salary + ", salary=" + salary
				+ ", dividend=" + dividend + "]";
	}
}
