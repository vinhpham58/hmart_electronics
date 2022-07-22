package dao;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.GuestCart;

public interface GuestCartDAO {
	public Map<Integer, GuestCart> getCarts(HttpServletRequest req);
	public void saveCarts(HttpServletRequest req, short qty, int id);
	//public void editCart(HttpServletRequest req, HttpServletResponse resp);
	public void delCart(HttpServletRequest req, int id);
}
