package sa45.team9.inventoryApp.services;
import sa45.team9.inventoryApp.model.User;


public interface IUserService {
	public User findUserByEmail(String email);
	public void saveUser(User user);
}
