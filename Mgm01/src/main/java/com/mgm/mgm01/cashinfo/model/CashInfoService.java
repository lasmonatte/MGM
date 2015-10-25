package com.mgm.mgm01.cashinfo.model;

import java.math.BigInteger;
import java.util.Map;

public interface CashInfoService {
	public int createCashInfo(String id, BigInteger breakdown, String type);
	public Map<String, Object> readCashInfoById(int p, String id);
	public Map<String, Object> readCashInfoByRecmd(int p, String type, String id);
	public Map<String, Object> readCashInfoAll(int p, String type);
	public int deleteCashInfo(int num);
}
