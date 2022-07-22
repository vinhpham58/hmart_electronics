package dao_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import dao.ProductDAO;
import domain.Category;
import domain.Product;
import utils.HibernateUtil;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public List<Product> getProductList() {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM Product";
			return session.createQuery(hql, Product.class).list();
		}
	}

	@Override
	public List<Product> getProductList(String type) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM Product p WHERE p.category.categoryName = :type";
			return session.createQuery(hql, Product.class).setParameter("type", type).list();
		}
	}

	@Override
	public Product getAProduct(int id) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			String hql = "FROM Product as p where p.id = :id";
			return session.createQuery(hql, Product.class).setParameter("id", id).uniqueResult();
		}
	}

	@Override
	public List<Product> getSearchedProductList(String searchedName) {
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			System.out.println(searchedName);
			String hql = "FROM Product p WHERE p.productName like :searchedName";
			return session.createQuery(hql, Product.class).setParameter("searchedName", "%" + searchedName + "%")
					.list();
		}
	}

	@Override
	public void editAProduct(Product product, Category category) {
		Transaction tran = null;
		try (Session session = HibernateUtil.getSessionfactory().openSession()) {
			tran = session.beginTransaction();
			product.setCategory(category);
			session.update(product);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tran != null) {
				tran.rollback();
			}
		}
	}
	
}
