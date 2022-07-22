package dao;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import domain.Cart;

public interface MemberCartDAO {
	public Map<Integer, Cart> getCart(Principal pcl);
	public void saveCarts(HttpServletRequest req, short qty, int id, Principal pcl);
}
