package domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name = "role")
public class Role {
	@Id
	@Column(name = "RoleID")
	private byte roleID;
	@Column(name = "RoleName")
	private String roleName;
	
	@ManyToMany(mappedBy = "roles", fetch = FetchType.EAGER)
    private Set<User> users;
	
	public Role() {
	}

	public byte getRoleID() {
		return roleID;
	}

	public void setRoleID(byte roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
