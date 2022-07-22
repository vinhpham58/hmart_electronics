package security;


import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import dao.SecurityDAO;
import dao_impl.SecurityDAOImpl;
import domain.Role;

public class UserService implements UserDetailsService{

	SecurityDAO securityDAO = new SecurityDAOImpl();
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		domain.User obj = securityDAO.logon(username);
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role : obj.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		return new User(obj.getUserName(), obj.getPassWord(), true, true, true, true, authorities);
		
		
//		if (user == null) {
//            throw new UsernameNotFoundException("Could not find user with that email");
//        }
//         
//        return new SecurityUser(user);
	}
}

