package com.andamiro.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.andamiro.security.domain.CustomUser;
import com.andamiro.security.domain.CustomUserDetails;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.warn("Login success");
		
		List<String>roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);
		
		 // Get the authenticated user's details (assuming CustomUserDetails is used)
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        // Get the HttpSession from the request
        HttpSession session = request.getSession();

        // Store the CustomUser object in the session
        session.setAttribute("loginUser", userDetails);

		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/sample/member");
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/recipe/recipe_reg");
			return;
		}
		
		response.sendRedirect("/");
	}
}
