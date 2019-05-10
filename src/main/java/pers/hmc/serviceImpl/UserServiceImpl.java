package pers.hmc.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.hmc.bean.User;
import pers.hmc.dao.UserMapper;
import pers.hmc.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(String username) {
		
		return userMapper.login(username);
	}

}
