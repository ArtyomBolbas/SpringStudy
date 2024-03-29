package com.bolbas.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

import com.bolbas.app.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests().
				antMatchers("/", "/registration", "/static/**").
				permitAll().
				anyRequest().
				authenticated().
			and().
				formLogin().
				loginPage("/login").
				permitAll().
			and().
				logout().
				permitAll();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		/*auth.jdbcAuthentication()
			.dataSource(dataSource)
			.passwordEncoder(NoOpPasswordEncoder.getInstance())
			.usersByUsernameQuery("select username, password, active from users where username = ?")
			.authoritiesByUsernameQuery("select u.username, ur.roles from users u inner join user_roles ur on u.id = ur.user_id where u.username = ?");*/
		
		auth.userDetailsService(userService)
			.passwordEncoder(NoOpPasswordEncoder.getInstance());
	}
}