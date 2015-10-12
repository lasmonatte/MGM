package com.mgm.mgm01.user.model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mgm.mgm01.sercurity.ShaEncoder;

@Component
public class UserServiceImpl implements UserService {

	@Autowired UserDao dao;
	@Resource(name="shaEncoder") ShaEncoder encoder;
	
	public int createUserService(UserDto dto) {
		// TODO Auto-generated method stub
		dto.setPassword(encoder.saltEncoding(dto.getPassword(), dto.getNickname()));
		return dao.createUser(dto);  
	}

	@Override
	public int grantAuthorityService(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.grantAuthority(dto);
	}
}