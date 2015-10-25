package com.mgm.mgm01.admin.model;

import java.math.BigInteger;
import java.util.Map;

public interface AdminService {
	public int createAdminService(String id);
	public AdminDto readAdminOneService(String id);
	public Map<String, Object> readAdminAllService(int p);
	public AdminDto readTotalService();
	public int updateAdminService(String admin_id, String type, BigInteger cash);
	public int updateAdminSalaryService(String id);
	public int updateDividendService(String id, float dividend);
	public int updateMasterSalaryService(BigInteger cash);
	public int deleteAdminService(int admin_num);
}
