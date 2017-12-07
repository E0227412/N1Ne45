package sa45.team9.inventoryApp.services;
import java.util.Arrays;
import java.util.HashSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import sa45.team9.inventoryApp.model.Role;
import sa45.team9.inventoryApp.model.User;
import sa45.team9.inventoryApp.repository.RoleRepository;
import sa45.team9.inventoryApp.repository.UserRepository;

@Service
public class UserServiceManager implements IUserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	@Override
	public void saveUser(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepository.findByRole("ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		userRepository.save(user);
	}
}
