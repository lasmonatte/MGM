package com.mgm.mgm01.user.model;

import java.math.BigInteger;

public interface UserService {
	public int createUserService(UserDto dto);
	public int grantAuthorityService(UserDto dto);
	public BigInteger readCashService(String id);
	public int updateCashService(String id, BigInteger cash);
}
