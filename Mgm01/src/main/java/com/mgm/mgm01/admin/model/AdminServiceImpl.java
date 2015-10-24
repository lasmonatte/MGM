package com.mgm.mgm01.admin.model;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mgm.mgm01.sercurity.ShaEncoder;
import com.mgm.mgm01.user.model.UserDto;
import com.mgm.mgm01.user.model.UserService;

@Component
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao dao;
	@Autowired UserService userService;
	@Resource(name="shaEncoder") ShaEncoder encoder;
	
	
	@Override
	@Transactional
	public int createAdminService(String id) {
		// TODO Auto-generated method stub
		UserDto dto = new UserDto();
		dto.setId(id);
		dto.setPassword(encoder.saltEncoding(id, id));
		dto.setAuthority("ROLE_ADMIN");
		userService.createUserService(dto);
		userService.grantAuthorityService(dto);
		return dao.createAdmim(id);
	}

	@Override
	public AdminDto readAdminOneService(String id) {
		// TODO Auto-generated method stub
		return dao.readAdminOne(id);
	}

	@Override
	public Map<String, Object> readAdminAllService(int p) {
		// TODO Auto-generated method stub
		List<AdminDto> list = dao.readAdminAll();
		Map<String, Object> info = new HashMap<String, Object>();
		
		int size = 10;	// 몇개씩 볼것인지
		int pageSize = list.size()/size;
		
		if(list.size()%size != 0)
			pageSize++;
		
		int start = (p - 1) * size;
		int end = p * size;
		
		if (end > list.size())
			end = list.size();
		
		info.put("size", pageSize);
		info.put("list", list.subList(start, end));
		
		return info;
	}

	
	@Override
	public int updateAdminService(String admin_id, String type, BigInteger cash) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		
		//type=charge, exchange, betting, win, lose
		switch (type) {
		case "charge":
		case "exchange":
			info.put("cash", cash);	
			break;
		case "betting":
		case "win":
		case "lose":
			info.put("cash", 0);
			break;
		}

		info.put(type, cash);
		info.put("id", admin_id);
		
		return dao.updateAdmin(info);
	}

	@Override
	public int deleteAdminService(int admin_num) {
		// TODO Auto-generated method stub
		return dao.deleteAdmin(admin_num);
	}

	@Override
	public int updateAdminSalaryService(String id) {
		// TODO Auto-generated method stub
		return dao.updateAdminSalary(id);
	}

	@Override
	public int updateDividendService(String id, float dividend) {
		// TODO Auto-generated method stub
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("id", id);
		info.put("dividend", dividend);
		return dao.updateDividend(info);
	}

	@Override
	public AdminDto readTotalService() {
		// TODO Auto-generated method stub
		return dao.readTotal();
	}

}
