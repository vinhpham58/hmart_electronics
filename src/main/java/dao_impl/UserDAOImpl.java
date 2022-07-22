package dao_impl;

import java.security.Principal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.UserDAO;
import domain.Product;
import domain.Role;
import domain.User;
import utils.HelperUtil;
import utils.HibernateUtil;

public class UserDAOImpl implements UserDAO {

	@Override
	public int addUser(User user, Role role) {
		Transaction tran = null;
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			user.setUserID(HelperUtil.randomLong());
			user.setPassWord(HelperUtil.bcrypt(user.getPassWord()));
			user.setAddedDate(new Date());
			Set<Role> roles = new HashSet<>();
			roles.add(role);
			user.setRoles(roles);
			tran = session.beginTransaction();
			session.save(user);
			tran.commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			if (tran != null) {
				tran.rollback();
			}
			return 0;
		}
	}

	@Override
	public long getUserIDByUserName(Principal pcl) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM User as u where u.userName = :userName";
			return session.createQuery(hql, User.class).setParameter("userName", pcl.getName()).uniqueResult().getUserID();
		}
	}

	

}
