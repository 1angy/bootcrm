package com.riley.service;

import com.riley.entity.SysUser;

public interface UserService {
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public SysUser findUserToLogin(SysUser user);
}
