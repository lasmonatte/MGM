package com.mgm.mgm01.user.model;

import java.math.BigInteger;

public class UserDto {

	private int user_num;
	private String id;
	private String password;
	private boolean enabled;
	private String nickname;
	private String name;
	private String phone;
	private String b_bankname;
	private String b_account;
	private String b_username;
	private String b_password;
	private String recmd_id;
	private BigInteger cash;
	private String authority;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getB_bankname() {
		return b_bankname;
	}
	public void setB_bankname(String b_bankname) {
		this.b_bankname = b_bankname;
	}
	public String getB_account() {
		return b_account;
	}
	public void setB_account(String b_account) {
		this.b_account = b_account;
	}
	public String getB_username() {
		return b_username;
	}
	public void setB_username(String b_username) {
		this.b_username = b_username;
	}
	public String getB_password() {
		return b_password;
	}
	public void setB_password(String b_password) {
		this.b_password = b_password;
	}
	public String getRecmd_id() {
		return recmd_id;
	}
	public void setRecmd_id(String recmd_id) {
		this.recmd_id = recmd_id;
	}
	public BigInteger getCash() {
		return cash;
	}
	public void setCash(BigInteger cash) {
		this.cash = cash;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	@Override
	public String toString() {
		return "UserDto [user_num=" + user_num + ", id=" + id + ", password=" + password + ", enabled=" + enabled
				+ ", nickname=" + nickname + ", name=" + name + ", phone=" + phone + ", b_bankname=" + b_bankname
				+ ", b_account=" + b_account + ", b_username=" + b_username + ", b_password=" + b_password
				+ ", recmd_id=" + recmd_id + ", cash=" + cash + ", authority=" + authority + "]";
	}
	
}