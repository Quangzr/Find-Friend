package jvb.dev.spring.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.UserDMDAO;
import jvb.dev.spring.model.User;
import jvb.dev.spring.model.UserDM;

public class JdbcUserDMDAO extends JdbcDaoSupport implements UserDMDAO {

	@Override
	public UserDM insertUserDM(UserDM userDM) {
		String sql = "INSERT INTO userdm ("
				+ "user_id,"
				+ "first_name,"
				+ "last_name, " 
				+ "dateofbirth, "
				+ "country, "
				+ "followers, "
				+ "followings, "
				+ "deleted, "
				+ "role_name) "
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "? )";
		
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				userDM.getUser_id(),
				userDM.getFirst_name(),
				userDM.getLast_name(),
				userDM.getDateofbirth(),
				userDM.getCountry(),
				userDM.getFollowers(),
				userDM.getFollowings(),
				userDM.getDeleted(),
				userDM.getRole_name()
			});
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				UserDM lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	private UserDM selectLast() {
		String sql = "SELECT * FROM userdm ORDER BY id DESC LIMIT 1";
		
		try {
			UserDM user = (UserDM) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(UserDM.class));
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

	@Override
	public List<UserDM> getUserDM(UserDM userDM) {
		return null;
	}

	@Override
	public UserDM finUserByID(int id) {
		String sql = "SELECT * FROM userdm WHERE deleted = 0 AND id = " + id;
		
		try {
			UserDM user = (UserDM)getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(UserDM.class));
			
			return user;
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return new UserDM();
		}
	}

}
