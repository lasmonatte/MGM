package com.mgm.mgm01.cashinfo.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CashInfoServiceImpl implements CashInfoService{

	@Autowired CashInfoDao dao;
	@Override
	public int createCashInfo(CashInfoDto dto) {
		// TODO Auto-generated method stub
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
	public Map<String, Object> reareadCashInfoByRecmd(int p, String id) {
		// TODO Auto-generated method stub
		List<CashInfoDto> li = dao.reareadCashInfoByRecmd(id);
		
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
