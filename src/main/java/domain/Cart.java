package domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name = "cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CartID")
	private int cartID;
	
	@ManyToOne
	@JoinColumn(name = "productID")
	private Product product;
	
	@Column(name = "Quantity")
	private short quantity;
	
	private String productName;
	private String imageUrl;
	private double price;
	
	
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@OneToOne
	@JoinColumn(name = "UserID")
	private User user;
	
	@Column (name = "AddedDate")
	@Temporal(TemporalType.DATE)
	private Date addedDate;

	public Cart() {
	}

	public Cart(Product product, short quantity, String productName, String imageUrl, double price, User user,
			Date addedDate) {
		this.product = product;
		this.quantity = quantity;
		this.productName = productName;
		this.imageUrl = imageUrl;
		this.price = price;
		this.user = user;
		this.addedDate = addedDate;
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	
	public void increaseQuantity(short quantity) {
		this.quantity += quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public short getQuantity() {
		return quantity;
	}

	public void setQuantity(short quantity) {
		this.quantity = quantity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

}
