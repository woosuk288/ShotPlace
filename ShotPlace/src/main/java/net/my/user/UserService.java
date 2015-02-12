package net.my.user;

public interface UserService {
	
	public int insert(User user);
	
	public User login(String email, String passwd);

	public int modify(User user);

	public void changePasswd(User user);

	public void byeMember(User user);

	

}