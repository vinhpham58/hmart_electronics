package dao;

import java.security.Principal;

import domain.Role;
import domain.User;

public interface UserDAO {
	public int addUser(User user, Role role);
	public long getUserIDByUserName(Principal pcl);
}
