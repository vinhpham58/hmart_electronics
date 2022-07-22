package dao_impl;

import java.util.List;

import org.hibernate.Session;

import dao.RoleDAO;
import domain.Role;
import utils.HibernateUtil;

public class RoleDAOImpl implements RoleDAO{

	@Override
	public List<Role> getRoleList() {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM Role";
			return session.createQuery(hql, Role.class).list();
		}
	}

}
