package dao;

import java.util.List;

import domain.Category;
import domain.Product;

public interface ProductDAO {
	public List<Product> getProductList();
	public List<Product> getProductList(String type);
	public Product getAProduct(int id);
	public List<Product> getSearchedProductList(String searchedName);
	public void editAProduct(Product product, Category category);
}
