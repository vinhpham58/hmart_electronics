package dao;

import domain.User;

public interface SecurityDAO {
	public User logon(String userName);
}
