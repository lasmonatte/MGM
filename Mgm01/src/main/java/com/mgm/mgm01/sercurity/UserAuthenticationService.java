package com.mgm.mgm01.sercurity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserAuthenticationService implements UserDetailsService{

	private static final Logger logger = LoggerFactory.getLogger(UserAuthenticationService.class);
	private SqlSessionTemplate sqlSession;
	
	public UserAuthenticationService() {
		// TODO Auto-generated constructor stub
	}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Map<String, Object> user = sqlSession.selectOne("com.mgm.mgm01.user.model.UserDao.loginUser", username);
		if(user == null ) throw new UsernameNotFoundException(username);
		 logger.info(user.toString());
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		return new UserDetailsVO(user.get("username").toString(), user.get("password").toString(), user.get("enabled").equals(true),
				true, true, true, gas, user.get("nickname").toString(), Integer.parseInt(user.get("cash").toString()));

	}
	
	

}
