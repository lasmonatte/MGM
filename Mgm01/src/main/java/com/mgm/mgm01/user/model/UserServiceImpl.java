package com.mgm.mgm01.user.model;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
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
	public UserDto readUserService(String id) {
		// TODO Auto-generated method stub
		return dao.readUser(id);
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

	@Override
	public boolean readB_passwordService(String id, String pass) {
		// TODO Auto-generated method stub
		String b_password = dao.readB_password(id);
		if(b_password.equals(pass))
			return true;
		else
			return false;
	}

	@Override
	public Map<String, Object> readAllUserService(int p, String type, boolean master, String admin_id) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("type", type);
		info.put("master", master);
		info.put("admin_id", admin_id);
		List<UserDto> li = dao.readAllUser(info);
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = 5;
		int pageSize = li.size()/size;
		if(li.size()%size != 0)
			pageSize++;
		// sublist ó���ؼ� �����͸� ����
		// 10���� �ѷ��߰ڴٰ� �����Ѵٸ�,
		// p�� 1�϶� 0~9 , 2�̸� 10~19, 3�̸� 20 ~29
		int start = (p - 1) * size;
		int end = p * size;
		if (end > li.size())
			end = li.size();
		map.put("size", pageSize);
		map.put("list", li.subList(start, end));
		
		return map;
	}

}