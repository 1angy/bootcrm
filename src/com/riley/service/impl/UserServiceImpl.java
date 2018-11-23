package com.riley.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.riley.dao.SysUserMapper;
import com.riley.entity.SysUser;
import com.riley.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SysUserMapper dao;

	@Override
	public SysUser findUserToLogin(SysUser user) {
		return dao.login(user);
	}
}
