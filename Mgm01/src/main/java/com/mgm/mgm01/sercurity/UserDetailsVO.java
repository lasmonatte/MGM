package com.mgm.mgm01.sercurity;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class UserDetailsVO extends User{

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	private String nickname;
	private String b_password;
	
	public UserDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,
			String nickname, String b_password) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
		this.nickname = nickname;
		this.b_password = b_password;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getB_password() {
		return b_password;
	}

	public void setB_password(String b_password) {
		this.b_password = b_password;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString() + "; nickname: " + this.nickname + "; b_password: " + this.b_password;
	}

}
