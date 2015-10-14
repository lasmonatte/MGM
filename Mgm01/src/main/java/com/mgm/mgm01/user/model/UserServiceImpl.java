package com.mgm.mgm01.user.model;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

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

	@Override
	public BigInteger readCashService(String id) {
		// TODO Auto-generated method stub
		return dao.readCash(id);
	}

	@Override
	public int updateCashService(String id, BigInteger cash) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("cash", cash);
		info.put("id", id);
		return dao.updateCash(info);
	}
}