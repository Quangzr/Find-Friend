package jvb.dev.spring.impl;

import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.UserDAO;
import jvb.dev.spring.model.Following;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.model.User;
import jvb.dev.spring.util.LoggerUtil;

public class JdbcUserDAO extends JdbcDaoSupport implements UserDAO{
	
	public User registerUser(User user) {
		
		String sql = "INSERT INTO users ("
				+ "first_name,"
				+ "last_name, "
				+ "email, "
				+ "password, "
				+ "dateofbirth, "
				+ "gender, "
				+ "city, "
				+ "country, "
				+ "role_name, "
				+ "created) "
				+ "VALUES ("
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "?, "
				+ "NOW())";
		LoggerUtil.logConsole("Register : " + sql.toString());
			try {
				int result = getJdbcTemplate().update(sql, new Object[] {
					user.getFirst_name(),
					user.getLast_name(),
					user.getEmail(),
					user.getPassword(),
					user.getDateofbirth(),
					user.getGender(),
					user.getCity(),
					user.getCountry(),
					user.getRole_name(),
				});
				System.out.println(result);
				if (result == 0) {
					return null;
				} else {
					User lastUser = selectLast();
					return lastUser;
				}
			}
			catch (InvalidResultSetAccessException e) 
			{
				LoggerUtil.logConsole("Register : co loi! ");
			    throw new RuntimeException(e);
			} 
			catch (DataAccessException e)
			{
				LoggerUtil.logConsole("Register : co loi! ");
			    throw new RuntimeException(e);
			}

	}

	public User timeLine(User user) {
		
		String sql = "SELECT * FROM users WHERE AND id = "+ user.getId();
		LoggerUtil.logConsole("timeLine : " + sql.toString());
		try {
			User timeLine = (User) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(User.class));
			
			if (timeLine.getFirst_name().isEmpty() && timeLine.getLast_name().isEmpty()) {
				return new User();
			}
			return timeLine;
		} 
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("timeLine : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("timeLine : co loi! ");
			return new User();
		} 
	}
	
public User loginUser(String username, String password) {
		
		String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND deleted = 0 LIMIT 1";
		LoggerUtil.logConsole("Login : " + sql.toString());
		try {
			User loginUser = (User) getJdbcTemplate().queryForObject(sql, new Object[] {
					username, password
			}, new BeanPropertyRowMapper(User.class));
			
			if (loginUser.getEmail().isEmpty() && loginUser.getPassword().isEmpty()) {
				return new User();
			}
			return loginUser;
		} 
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("loginUser : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("loginUser : co loi! ");
			return new User();
		} 
	}
	
	public User findUserByUserFollowing(User user) {
		
		String sql = "SELECT * FROM users WHERE email = " + user.getId();
		LoggerUtil.logConsole("Find user by email : " + sql.toString());
		try {
			User loginUser = (User) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(User.class));
			
			if (loginUser.getEmail().isEmpty() && loginUser.getPassword().isEmpty()) {
				return new User();
			}
			
			return loginUser;
		} 
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Find user by email : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Find user by email : co loi! ");
			return new User();
		} 
	}
	
	
	
	private User selectLast() {
		
		String sql = "SELECT * FROM users ORDER BY id DESC LIMIT 1";
		
		try {
			User user = (User) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(User.class));
			return user;
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
	}
	
	public void doFollow(int currentUser, int followUser) {
		
		String sql1 = "INSERT INTO followings ("
				+ "user_id, "
				+ "following) values ("
				+ "?,"
				+ "?"
				+ ")";
		LoggerUtil.logConsole("insert followings  : " + sql1.toString());
		String sql2 = "INSERT INTO followers ("
				+ "user_id, "
				+ "follower) values ("
				+ "?, "
				+ "?)";
		LoggerUtil.logConsole("insert follower : " + sql2.toString());
		String sql3 = "UPDATE users SET followers = followers + 1 WHERE id = " + followUser;
		
		String sql4 = "UPDATE users SET followings = followings + 1 WHERE id = " + currentUser;
		
//		String sql5 = "DELETE FROM  list_following WHERE user_id = ? AND id_user_following = ?";
		
		try {
			getJdbcTemplate().update(sql1, new Object[] {currentUser, followUser});
			getJdbcTemplate().update(sql2, new Object[] {followUser, currentUser});
			getJdbcTemplate().update(sql3);
			getJdbcTemplate().update(sql4);
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("doFollow : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("doFollow : co loi! ");
		    throw new RuntimeException(e);
		}
	}
	
	public void doUnfollow(int currentUser, int followUser) {
		
		String sql1 = "DELETE FROM followings WHERE user_id = ? AND following = ?" ;
		
		String sql2 = "DELETE FROM followers WHERE user_id = ? AND follower = ?";
		
		String sql3 = "UPDATE users SET "
				+ "followings = followings - 1 "
				+ "WHERE id = " + currentUser;
		
		String sql4 = "DELETE FROM  list_following WHERE user_id = ? AND id_user_following = ?";
		
		try {
			getJdbcTemplate().update(sql1, new Object[] {currentUser, followUser});
			getJdbcTemplate().update(sql2, new Object[] {followUser, currentUser});
			getJdbcTemplate().update(sql4, new Object[] {currentUser, followUser});
			getJdbcTemplate().update(sql3);
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
	}
	
	public List<User> getWhoToFollowList(int currentUser){
		
		String sql = "SELECT * FROM `users` WHERE NOT id = " + currentUser + " AND NOT id IN (SELECT following FROM followings WHERE user_id = ?) AND role_name='user' ORDER BY RAND() LIMIT 6";
		LoggerUtil.logConsole("Get who to follow list : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new Object[] {currentUser}, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get who to follow list : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Get who to follow list : co loi! ");
		    return null;
		}
	}
	
	public User finUserByID(int id) {
		
		String sql = "SELECT * FROM users WHERE deleted = 0 AND id = " + id;
		LoggerUtil.logConsole("Find user by ID : " + sql.toString());
		try {
			User user = (User)getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(User.class));
			
			return user;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Find user by ID : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Find user by ID : co loi! ");
		    return new User();
		}
	}

	@Override
	public User loginAdmin(String username, String password) {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role_name = 'admin' AND deleted = 0 LIMIT 1";
		LoggerUtil.logConsole("Login Admin : " + sql.toString());
		try {
			User loginUser = (User) getJdbcTemplate().queryForObject(sql, new Object[] {
					username, password
			}, new BeanPropertyRowMapper(User.class));
			
			if (loginUser.getEmail().isEmpty() && loginUser.getPassword().isEmpty()) {
				return new User();
			}
			return loginUser;
		} 
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Login Admin : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Login Admin : co loi! ");
			return new User();
		} 
	}

	@Override
	public User loginNormalUser(String username, String password) {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role_name = 'user' AND deleted = 0 LIMIT 1";
		LoggerUtil.logConsole("Login : " + sql.toString());
		try {
			User loginUser = (User) getJdbcTemplate().queryForObject(sql, new Object[] {
					username, password
			}, new BeanPropertyRowMapper(User.class));
			
			if (loginUser.getEmail().isEmpty() && loginUser.getPassword().isEmpty()) {
				return new User();
			}
			return loginUser;
		} 
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Login : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Login : co loi! ");
			return new User();
		} 
	}

	@Override
	public List<User> getListUser(User user) {
		String sql = "SELECT * FROM `users` WHERE role_name = 'user' ";
		LoggerUtil.logConsole("Get List user : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get List user : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Get List user : co loi! ");
		    return null;
		}
	}

	@Override
	public User deleteUser(User user) {
		String sql = "INSERT INTO users (deteled) value ('1')";
		LoggerUtil.logConsole("delete User : " + sql.toString());
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				user.getDeleted()			
			});
			if (result == 0) {
				return null;
			} else {
				User lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public User getUser(int id) {
		String sql = "SELECT * FROM users WHERE id = " + id;
		LoggerUtil.logConsole("Get User : " + sql.toString());
		try {
			User getUser = (User)getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(User.class));
			
			return getUser;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get User : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("Get User : co loi! ");
		    return new User();
		}
	}

	@Override
	public List<User> getResultSearch(User user) {
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND NOT id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.first_name) like '%"+user.getValue_search()+"%' OR LOWER(p.last_name) like '%"+user.getValue_search()+"%'ORDER BY RAND()";
		LoggerUtil.logConsole("Get Result Search : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get Result Search : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getUserList(User user) {
		String sql = "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " LIMIT 6";
		LoggerUtil.logConsole("Get user List : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get user List : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getUserChat(int id) {
		String sql = "SELECT * FROM users WHERE deleted = 0 AND id = " + id;
		LoggerUtil.logConsole("Get user chat : " + sql.toString());
		try {
			List<User> user = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return user;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get user chat: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public Blob getPhotoById(int id) {
		String query = "select avatar from avatars where user_id="+ id;
		LoggerUtil.logConsole("Get photo by id : " + query.toString());
		Blob photo = (Blob)getJdbcTemplate().queryForObject(query, new BeanPropertyRowMapper(Blob.class));

		return photo;
	}

	@Override
	public List<User> getResultSearchAddress(User user) {
//		String sql = "SELECT * FROM `users` WHERE city like '%"+user.getCity()+"%' and role_name = 'user' ";
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND NOT id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.city) like '%"+user.getCity()+"%' ORDER BY RAND()";
		
		LoggerUtil.logConsole("Get Result Search Address: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get Result Search Address: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getAll(User user) {
		String sql = "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND id NOT IN (SELECT following FROM followings WHERE user_id = "+user.getId()+") and role_name='user'";
		LoggerUtil.logConsole("Get All User: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("Get user List : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getResultSearchFollowing(User user) {
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.first_name) like '%"+user.getValue_search()+"%' OR LOWER(p.last_name) like '%"+user.getValue_search()+"%'ORDER BY RAND()";
		LoggerUtil.logConsole("getResultSearchFollowing : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getResultSearchFollowing : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getAllFollowing(User user) {
		String sql = "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+") and role_name='user'";
		LoggerUtil.logConsole("getAllFollowing : " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getAllFollowing : co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getResultSearchAddressFollowing(User user) {
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.city) like '%"+user.getCity()+"%' ORDER BY RAND()";
		
		LoggerUtil.logConsole("getResultSearchAddressFollowing: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getResultSearchAddressFollowing: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getResultSearchSex(User user) {
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND NOT id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.gender) like '%"+user.getGender()+"%' ORDER BY RAND()";
		
		LoggerUtil.logConsole("getResultSearchSex: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getResultSearchSex: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<User> getResultSearchSexFollowing(User user) {
		String sql = "SELECT * FROM ("
				+ "SELECT * FROM `users` WHERE NOT id = " + user.getId() + " AND id IN (SELECT following FROM followings WHERE user_id = "+user.getId()+")"
						+ ") as p where p.role_name='user' and LOWER(p.gender) like '%"+user.getGender()+"%' ORDER BY RAND()";
		
		LoggerUtil.logConsole("getResultSearchSexFollowing: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getResultSearchSexFollowing: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public void doDelete(int idUserNormal) {
		
		String sql3 = "UPDATE users SET "
				+ "deleted = deleted + 1 "
				+ "WHERE id = " + idUserNormal;
		try {
			
			getJdbcTemplate().update(sql3);
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
	}

	@Override
	public List<User> getUserActive(int id) {
		String sql = "Select * FROM users where not id="+id+" and deleted = 0 ";
		
		LoggerUtil.logConsole("getUserActive: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getUserActive: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public void doActive(int idUserNormal) {
		String sql3 = "UPDATE users SET "
				+ "deleted = deleted - 1 "
				+ "WHERE id = " + idUserNormal;
		try {
			
			getJdbcTemplate().update(sql3);
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
	}

	@Override
	public List<User> getUserDelete(int id) {
		String sql = "Select * FROM users where not id="+id+" and deleted = 1 ";
		
		LoggerUtil.logConsole("getUserDelete: " + sql.toString());
		try {
			List<User> users = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
			
			return users;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getUserDelete: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public User UpdateUser(User user) {
		String sql3 = "UPDATE users SET "
				+ " first_name = ?, "
				+"last_name = ?, "
				+"email = ?, "
				+ "password = ?,"
				+"dateofbirth = ?,"
				+"gender = ?,"
				+"city = ?, "
				+"country = ? where id = " + user.getId(); 	
				
			try {
				int result = getJdbcTemplate().update(sql3, new Object[] {
					user.getFirst_name(),
					user.getLast_name(),
					user.getEmail(),
					user.getPassword(),
					user.getDateofbirth(),
					user.getGender(),
					user.getCity(),
					user.getCountry()
				});
				System.out.println(result);
				if (result == 0) {
					return null;
				} else {
					User lastUser = selectLast();
					return lastUser;
				}
			}
			catch (InvalidResultSetAccessException e) 
			{
				LoggerUtil.logConsole("Register : co loi! ");
			    throw new RuntimeException(e);
			} 
			catch (DataAccessException e)
			{
				LoggerUtil.logConsole("Register : co loi! ");
			    throw new RuntimeException(e);
			}
	}

}
