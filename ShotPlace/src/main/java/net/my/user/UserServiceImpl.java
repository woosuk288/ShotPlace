package net.my.user;

import net.my.mybatis.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
		
	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public User login(String email, String passwd) {
		return userMapper.login(email, passwd);
	}

}
