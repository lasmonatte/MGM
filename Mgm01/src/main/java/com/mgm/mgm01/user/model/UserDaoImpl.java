package com.mgm.mgm01.user.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired SqlSession session;
	
	@Override
	public int createUser(UserDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.user.model.UserDao.createUser", dto);
	}

	@Override
	public int grantAuthority(UserDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.user.model.UserDao.grantAuthority", dto);
	}

}
