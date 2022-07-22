package domain;

public class GuestCart {
	private Product product;
	private String imageUrl;
	private String productName;
	private short quantity;
	private double price;
	
	public GuestCart() {
	}
	
	public GuestCart(Product product, String imageUrl, String productName, short quantity, double price) {
		this.product = product;
		this.imageUrl = imageUrl;
		this.productName = productName;
		this.quantity = quantity;
		this.price = price;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public short getQuantity() {
		return quantity;
	}
	
	public void increaseQuantity(short quantity) {
		this.quantity += quantity;
	}
	
	public void setQuantity(short quantity) {
		this.quantity += quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	

}
