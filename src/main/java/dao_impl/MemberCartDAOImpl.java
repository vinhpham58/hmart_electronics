package dao_impl;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.MemberCartDAO;
import dao.ProductDAO;
import dao.SecurityDAO;
import dao.UserDAO;
import domain.Cart;
import domain.Product;
import domain.User;
import utils.HibernateUtil;

public class MemberCartDAOImpl implements MemberCartDAO {
	ProductDAO productDAO = new ProductDAOImpl();
	UserDAO userDAO = new UserDAOImpl();
	SecurityDAO securityDAO = new SecurityDAOImpl();

	@Override
	public Map<Integer, Cart> getCart(Principal pcl) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM Cart c where c.user.userID = :id";
			List<Cart> cartList = session.createQuery(hql, Cart.class)
					.setParameter("id", userDAO.getUserIDByUserName(pcl)).list();
			Map<Integer, Cart> carts = new HashMap<Integer, Cart>();
			for (Cart c : cartList) {
				carts.put(c.getProduct().getProductID(), c);
			}
			return carts;
		}
	}

	public void saveCarts(HttpServletRequest req, short qty, int id, Principal pcl) {
		Map<Integer, Cart> carts = new HashMap<Integer, Cart>();
		carts = getCart(pcl);
		if (carts.containsKey(id)) {
			carts.get(id).increaseQuantity(qty);
			System.out.println(carts.get(id).getQuantity());
			try (Session session = HibernateUtil.getSessionfactory().openSession()) {
				String hql = "Update Cart c set c.quantity = :quantity where c.product.productID = :productID and c.user.userID = :userID";
				Query query = session.createQuery(hql);
				query.setParameter("quantity", carts.get(id).getQuantity());
				query.setParameter("productID", id);
				query.setParameter("userID", userDAO.getUserIDByUserName(pcl));
				session.beginTransaction();
				int executeUpdate = query.executeUpdate();
				session.getTransaction().commit();
			}
		} else {
			User user = securityDAO.logon(pcl.getName());
			Product obj = productDAO.getAProduct(id);
			Cart cart = new Cart(obj, qty, obj.getProductName(), obj.getImageURL(), obj.getPrice(), user, new Date());
			Transaction tran = null;
			try (Session session = HibernateUtil.getSessionfactory().openSession()) {
				tran = session.beginTransaction();
				session.save(cart);
				tran.commit();
			} catch (Exception e) {
				e.printStackTrace();
				if (tran != null) {
					tran.rollback();
				}
			}
		}
	}
}
