package domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;



@Entity
@Table(name = "user")

public class User {
	@Id
	@Column(name = "UserID")
	private long userID;
	@Column(name = "UserName")
	private String userName;
	@Column(name = "PassWord")
	private String passWord;
	@Column(name = "FirstName")
	private String firstName;
	@Column(name = "LastName")
	private String lastName;
	@Column(name = "Email")
	private String email;
	@Column(name = "Tel")
	private String tel;
	@Column(name = "Address")
	private String address;
	@Column(name = "AddedDate")
	@Temporal(TemporalType.DATE)
	private Date addedDate;
	
	
	
	
	@OneToOne(mappedBy = "user", fetch = FetchType.EAGER)
	private Cart cart;
	
	@OneToOne(mappedBy = "user", fetch = FetchType.EAGER)
	private Invoice invoice;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", 
			joinColumns = @JoinColumn(name = "UserID"), 
			inverseJoinColumns = @JoinColumn(name = "RoleID"))
	private Set<Role> roles;

	public User() {
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}
