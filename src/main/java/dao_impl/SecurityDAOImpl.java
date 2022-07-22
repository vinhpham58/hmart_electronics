package dao_impl;

import org.hibernate.Session;

import dao.SecurityDAO;
import domain.User;
import utils.HibernateUtil;

public class SecurityDAOImpl implements SecurityDAO {

	@Override
	public User logon(String userName) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM User as u where u.userName = :userName";
			return session.createQuery(hql, User.class).setParameter("userName", userName).uniqueResult();
		}
	}
}
