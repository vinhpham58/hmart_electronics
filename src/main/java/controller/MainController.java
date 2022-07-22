package controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.GuestCartDAO;
import dao.MemberCartDAO;
import dao.ProductDAO;
import dao.RoleDAO;
import dao.UserDAO;
import dao_impl.GuestCartDAOImpl;
import dao_impl.MemberCartDAOImpl;
import dao_impl.ProductDAOImpl;
import dao_impl.RoleDAOImpl;
import dao_impl.UserDAOImpl;
import domain.Category;
import domain.Product;
import domain.Role;
import domain.User;

@Controller
public class MainController {
	ProductDAO productDAO = new ProductDAOImpl();
	RoleDAO roleDAO = new RoleDAOImpl();
	UserDAO userDAO = new UserDAOImpl();
	GuestCartDAO guestCartDAO = new GuestCartDAOImpl();
	MemberCartDAO memberCartDAO = new MemberCartDAOImpl();
	
	@RequestMapping({"/", "/index.html"})
	public String index() {
		return "index";
	}
	
	@RequestMapping("/thank-you.html")
	public String thankYou() {
		return "thank-you";
	}
	@RequestMapping("/forbidden.html")
	public String forbidden() {
		return "forbidden";
	}
	@RequestMapping("/check-out.html")
	public String checkOut() {
		return "check-out";
	}
	@RequestMapping("/cart.html")
	public String getCart(HttpServletRequest req, Principal pcl) {
		String cartPage = "empty-cart";
		Collection listCart = null;
		listCart = guestCartDAO.getCarts(req).values();
		if (pcl != null) {
			listCart = memberCartDAO.getCart(pcl).values();
		}
		if (!listCart.isEmpty() ) {
			req.setAttribute("listCart", listCart);
			cartPage = "cart";
		}
		return cartPage;
	}
	@RequestMapping(value = "/cart.html", method = RequestMethod.POST)
	public String saveCart(HttpServletRequest req, @RequestParam("qty") short qty, @RequestParam("id") int id, Principal pcl) {
		if (pcl != null) {
			memberCartDAO.saveCarts(req, qty, id, pcl);
		} else {
			guestCartDAO.saveCarts(req, qty, id);
		}
		return getCart(req, pcl);
	}
	
//	@RequestMapping(value = "/cart.html/edit", method = RequestMethod.POST)
//	public String editCart(HttpServletRequest req, HttpServletResponse resp) {
//		guestCartDAO.editCart(req, resp);
//		req.setAttribute("listCart", guestCartDAO.getCarts(req).values());
//		return "cart";
//	}
	@RequestMapping(value = "/cart.html/del/{id}")
	public String delCart(HttpServletRequest req, @PathVariable("id") int id) {
		guestCartDAO.delCart(req, id);
		req.setAttribute("listCart", guestCartDAO.getCarts(req).values());
		return "cart";
	}
	
	@RequestMapping("/login.html")
	public String login() {
		return "login";
	}
	@RequestMapping("/register.html")
	public String register(HttpServletRequest req) {
		List<Role> listRoles = roleDAO.getRoleList();
		req.setAttribute("listRoles", listRoles);
		return "register";
	}
	@RequestMapping(value = "/register.html", method = RequestMethod.POST)
	public String register(User user, Role role) {
		userDAO.addUser(user, role);
		return "redirect:/index.html";
	}
	
	@RequestMapping("/product-list.html")
	public String productList(HttpServletRequest req) {
		List<Product> listProducts = productDAO.getProductList();
		req.setAttribute("listProducts", listProducts);
		return "product-list";
	}
	
	@RequestMapping("/product-list.html/{type}")
	public String productListType(@PathVariable("type") String type, HttpServletRequest req) {
		List<Product> listProducts = productDAO.getProductList(type);
		req.setAttribute("listProducts", listProducts);
		return "product-list";
	}
	
	@RequestMapping(value = "/product-list.html", method = RequestMethod.POST)
	public String searchedProductList(@RequestParam("s") String searchedName, HttpServletRequest req) {
		List<Product> listProducts = productDAO.getSearchedProductList(searchedName);
		req.setAttribute("listProducts", listProducts);
		return "product-list";
	}
	
	@RequestMapping("/product-detail.html/{id}")
	public String productDetail(@PathVariable("id") int id, HttpServletRequest req) {
		Product product = productDAO.getAProduct(id); 
		req.setAttribute("product", product);
		return "product-detail";
	}
	@RequestMapping("/admin/product-list.html")
	public String productManagement_list(HttpServletRequest req) {
		List<Product> listProducts = productDAO.getProductList();
		req.setAttribute("listProducts", listProducts);
		return "admin/product-list";
	}
	@RequestMapping(value = "/admin/product-list.html", method = RequestMethod.POST)
	public String productManagement_list(HttpServletRequest req, Product product, Category category) {
		System.out.println(category.getCategoryID());
		System.out.println(category.getCategoryName());
		productDAO.editAProduct(product, category);
		return productManagement_list(req);
	}
	@RequestMapping("/admin/product-edit.html/{id}")
	public String productManagement_edit(@PathVariable("id") int id, HttpServletRequest req) {
		Product product = productDAO.getAProduct(id); 
		req.setAttribute("product", product);
		return "admin/product-edit";
	}
}
