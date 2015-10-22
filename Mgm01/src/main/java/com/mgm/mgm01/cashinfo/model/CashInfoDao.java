package com.mgm.mgm01.cashinfo.model;

import java.util.List;

public interface CashInfoDao {

	public int createCashInfo(CashInfoDto dto);
	public List<CashInfoDto> readCashInfoById(String id);
	public List<CashInfoDto> reareadCashInfoByRecmd(String id);
	public List<CashInfoDto> readCashInfoAll(String type);
	public int deleteCashInfo(int num);
}
