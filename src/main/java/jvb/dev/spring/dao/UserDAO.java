package jvb.dev.spring.dao;

import java.sql.Blob;
import java.util.List;

import jvb.dev.spring.model.User;

public interface UserDAO {

	User loginUser(String username, String password);

	User loginNormalUser(String username, String password);

	User loginAdmin(String username, String password);

	User registerUser(User user);
	
	User UpdateUser(User user);

	User timeLine(User user);

	User findUserByUserFollowing(User user);

	void doFollow(int currentUser, int followUser);

	void doUnfollow(int currentUser, int followUser);
	
	void doDelete(int idUserNormal);
	
	void doActive(int idUserNormal);

	List<User> getWhoToFollowList(int currentUser);
	
	List<User> getUserList(User user);

	User finUserByID(int id);

	List<User> getListUser(User user);

	User deleteUser(User user);
	
	List<User> getUserChat(int id);

	User getUser(int id);

	List<User> getResultSearch(User user);
	
	List<User> getResultSearchFollowing(User user);
	
	List<User> getResultSearchAddress(User user);
	
	List<User> getResultSearchAddressFollowing(User user);
	
	List<User> getResultSearchSex(User user);
	
	List<User> getResultSearchSexFollowing(User user);
	
	Blob getPhotoById(int id);
	
	List<User> getAll(User user);
	
	List<User> getAllFollowing(User user);
	
	List<User> getUserActive(int id);
	
	List<User> getUserDelete(int id);

}
