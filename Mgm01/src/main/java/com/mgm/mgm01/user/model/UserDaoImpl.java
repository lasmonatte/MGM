package com.mgm.mgm01.user.model;

import java.math.BigInteger;
import java.util.Map;

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

	@Override
	public BigInteger readCash(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.user.model.UserDao.readCash", id);
	}

	@Override
	public int updateCash(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.user.model.UserDao.updateCash", info);
	}

}
