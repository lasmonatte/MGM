package com.mgm.mgm01.user.model;

public interface UserDao {
	public int createUser(UserDto dto);
	public int grantAuthority(UserDto dto);
//	public UserDto readUser(String id);
//	public int deleteUser(String id);
//	public UserDetailsVO loginUser(String username);
	
}
