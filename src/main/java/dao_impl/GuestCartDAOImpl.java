package dao_impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GuestCartDAO;
import dao.ProductDAO;
import domain.GuestCart;
import domain.Product;

public class GuestCartDAOImpl implements GuestCartDAO {
	ProductDAO productDAO = new ProductDAOImpl();

	@Override
	public Map<Integer, GuestCart> getCarts(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("cart");
		Map<Integer, GuestCart> carts = null;
		if (obj != null) {
			carts = (Map<Integer, GuestCart>) obj;
		} else {
			carts = new HashMap();
			session.setAttribute("cart", carts);
		}
		return carts;
	}

	public void saveCarts(HttpServletRequest req, short qty, int id) {
		Map<Integer, GuestCart> carts = getCarts(req);
		System.out.println(qty);
		if (carts.containsKey(id)) {
			carts.get(id).increaseQuantity(qty);
		} else {
			Product obj = productDAO.getAProduct(id);
			GuestCart guestCart = new GuestCart(obj, obj.getImageURL(),obj.getProductName(), qty, obj.getPrice());
			carts.put(id, guestCart);
		}
		HttpSession session = req.getSession(true);
		session.setAttribute("cart", carts);
	}
	
//	public void editCart(HttpServletRequest req, HttpServletResponse resp) throws IOException{
//		try (PrintWriter pw = resp.getWriter()) {
//			short qty = Short.parseShort(req.getParameter("qty"));
//			System.out.println(qty);
//			int key = Integer.parseInt(req.getParameter("id"));
//			System.out.println(key);
//			Map<Integer, GuestCart> carts = getCarts(req);
//			if (carts.containsKey(key)) {
//				carts.get(key).setQuantity(qty);
//			}
//			pw.write("1");
//		}
//	}
	public void delCart(HttpServletRequest req, int id) {
		Map<Integer, GuestCart> carts = getCarts(req);
		if (id == -1) {
			carts.clear();
		} else {
			carts.remove(id);
		}
		HttpSession session = req.getSession(true);
		session.setAttribute("cart", carts);
	}

}
