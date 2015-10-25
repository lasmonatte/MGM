package com.mgm.mgm01.cashinfo.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CashInfoDaoImpl implements CashInfoDao{

	@Autowired
	SqlSession session;

	@Override
	public int createCashInfo(CashInfoDto dto) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.cashinfo.model.CashDao.createCashInfo", dto);
	}

	@Override
	public List<CashInfoDto> readCashInfoById(String id) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.cashinfo.model.CashDao.readCashInfoById", id);
	}

	@Override
	public List<CashInfoDto> readCashInfoByRecmd(Map<String, String> info) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.cashinfo.model.CashDao.readCashInfoByRecmd", info);
	}

	@Override
	public List<CashInfoDto> readCashInfoAll(String type) {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.cashinfo.model.CashDao.readCashInfoAll", type);
	}

	@Override
	public int deleteCashInfo(int num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.cashinfo.model.CashDao.deleteCashInfo", num);
	}
	
}
