package com.mgm.mgm01.admin.model;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

public interface AdminDao {
	public int createAdmim(String id);
	public AdminDto readAdminOne(String id);
	public List<AdminDto> readAdminAll();
	public AdminDto readTotal();
	public int updateAdmin(Map<String, Object> info);
	public int updateAdminSalary(String id);
	public int updateDividend(Map<String, Object> info);
	public int updateMasterSalary(BigInteger cash);	
	public int deleteAdmin(int admin_num);
}
