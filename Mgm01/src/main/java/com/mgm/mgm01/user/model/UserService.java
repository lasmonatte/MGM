package com.mgm.mgm01.user.model;

import java.math.BigInteger;

public interface UserService {
	public int createUserService(UserDto dto);
	public UserDto readUserService(String id);
	public int grantAuthorityService(UserDto dto);
	public BigInteger readCashService(String id);
	public int updateCashService(String id, BigInteger cash);
	public boolean readB_passwordService(String id, String pass);
}
