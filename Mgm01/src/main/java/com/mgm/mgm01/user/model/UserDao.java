package com.mgm.mgm01.user.model;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

public interface UserDao {
	public int createUser(UserDto dto);
	public UserDto readUser(String id);
	public int grantAuthority(UserDto dto);
	public BigInteger readCash(String id);
	public int updateCash(Map<String, Object> info);
	public String readB_password(String id);
	public List<UserDto> readAllUser(Map<String, Object> info);
	public int readUserForRegister(Map<String, String> info);
	public int updateUserInfo(UserDto dto);
	public int updateUserAccount(UserDto dto);
//	public UserDto readUser(String id);
//	public int deleteUser(String id);
//	public UserDetailsVO loginUser(String username);
	
}
