package com.mgm.mgm01.cashinfo.model;

import java.util.Map;

public interface CashInfoService {
	public int createCashInfo(CashInfoDto dto);
	public Map<String, Object> readCashInfoById(int p, String id);
	public Map<String, Object> reareadCashInfoByRecmd(int p, String id);
	public Map<String, Object> readCashInfoAll(int p, String type);
	public int deleteCashInfo(int num);
}
