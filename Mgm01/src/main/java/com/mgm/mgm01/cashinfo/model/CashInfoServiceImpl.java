package com.mgm.mgm01.cashinfo.model;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mgm.mgm01.admin.model.AdminService;
import com.mgm.mgm01.user.model.UserDto;
import com.mgm.mgm01.user.model.UserService;

@Component
public class CashInfoServiceImpl implements CashInfoService{

	@Autowired CashInfoDao dao;
	@Autowired AdminService adminService;
	@Autowired UserService userService;
	
	@Transactional
	@Override
	public int createCashInfo(String id, BigInteger breakdown, String type) {
		// TODO Auto-generated method stub
		CashInfoDto dto = new CashInfoDto();
		dto.setId(id);
		dto.setBreakdown(breakdown);
		dto.setType(type);
		
		UserDto userDto = userService.readUserService(id);
		adminService.updateAdminService(userDto.getRecmd_id(), dto.getType(), dto.getBreakdown());
		return dao.createCashInfo(dto);
	}
	@Override
	public Map<String, Object> readCashInfoById(int p, String id) {
		// TODO Auto-generated method stub
		List<CashInfoDto> li = dao.readCashInfoById(id);
		
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
	
	@Override
	public Map<String, Object> readCashInfoByRecmd(int p, String type, String id) {
		// TODO Auto-generated method stub
		Map<String, String> info = new HashMap<String, String>();
		info.put("id", id);
		info.put("type", type);
		List<CashInfoDto> li = dao.readCashInfoByRecmd(info);
		System.err.println("TYPE : " + type);
		System.err.println("ID : " + id);
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
	@Override
	public Map<String, Object> readCashInfoAll(int p, String type) {
		// TODO Auto-generated method stub
		List<CashInfoDto> li = dao.readCashInfoAll(type);
		
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
	
	@Override
	public int deleteCashInfo(int num) {
		// TODO Auto-generated method stub
		return dao.deleteCashInfo(num);
	}
}
