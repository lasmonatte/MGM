package com.mgm.mgm01.sercurity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(UserLoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String page="";
		
		logger.info(authentication.getName());
		logger.info(authentication.getAuthorities().toString());
		logger.info(authentication.getDetails().toString());
		logger.info(authentication.getPrincipal().toString());

		for(GrantedAuthority a : authentication.getAuthorities()){
			logger.info(a.getAuthority());
			if(a.getAuthority().equals("ROLE_USER"))
				page="/mgm01/user/main";
			else if(a.getAuthority().equals("ROLE_ADMIN"))
				page="/mgm01/admin/main";
			else if(a.getAuthority().equals("ROLE_MASTER"))
				page="/mgm01/admin/adminInfo";
		}

		UserDetails user = (UserDetails)authentication.getPrincipal();

		logger.info(String.valueOf(user.isAccountNonExpired()));
		logger.info(String.valueOf(user.isAccountNonLocked()));
		logger.info(String.valueOf(user.isCredentialsNonExpired()));
		logger.info(String.valueOf(user.isEnabled()));
		
		response.sendRedirect(page);
	}
}
