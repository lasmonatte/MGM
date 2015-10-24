package com.mgm.mgm01.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession session;
	
	@Override
	public int createAdmim(String id) {
		// TODO Auto-generated method stub
		return session.insert("com.mgm.mgm01.admin.model.AdminDao.createAdmin", id);
	}

	@Override
	public AdminDto readAdminOne(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.admin.model.AdminDao.readAdminOne", id);
	}

	@Override
	public List<AdminDto> readAdminAll() {
		// TODO Auto-generated method stub
		return session.selectList("com.mgm.mgm01.admin.model.AdminDao.readAdminAll");
	}
	
	@Override
	public AdminDto readTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("com.mgm.mgm01.admin.model.AdminDao.readTotal");
	}
	
	@Override
	public int updateAdmin(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.admin.model.AdminDao.updateAdmin", info);
	}

	@Override
	public int updateAdminSalary(String id) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.admin.model.AdminDao.updateAdminSalary", id);
	}

	@Override
	public int updateDividend(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return session.update("com.mgm.mgm01.admin.model.AdminDao.updateDividend", info);
	}
	
	@Override
	public int deleteAdmin(int admin_num) {
		// TODO Auto-generated method stub
		return session.delete("com.mgm.mgm01.admin.model.AdminDao.deleteAdmin", admin_num);
	}

}
