package sa45.team9.inventoryApp.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import sa45.team9.inventoryApp.model.User;
@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, String> {
	
	@Query("SELECT u FROM User u where u.email = :Email")
	 User findByEmail(@Param("Email") String email);
}