package domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "invoicedetail")
public class InvoiceDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "InvoiceDetailID")
	private int invoiceDetailID;
	
	@ManyToOne
	@JoinColumn(name = "ProductID")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "InvoiceID")
	private Invoice invoice;
	
	@Column (name = "Quantity")
	private byte quantity;
	
	@Column (name = "Price")
	private double price;

	public InvoiceDetail() {
	}

	public int getInvoiceDetailID() {
		return invoiceDetailID;
	}

	public void setInvoiceDetailID(int invoiceDetailID) {
		this.invoiceDetailID = invoiceDetailID;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public byte getQuantity() {
		return quantity;
	}

	public void setQuantity(byte quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}
