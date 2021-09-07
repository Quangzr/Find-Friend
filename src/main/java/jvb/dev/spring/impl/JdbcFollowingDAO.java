package jvb.dev.spring.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.FollowingDAO;
import jvb.dev.spring.model.Following;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.User;

public class JdbcFollowingDAO extends JdbcDaoSupport implements FollowingDAO {

	@Override
	public Following insertUserFollowing(Following following) {
		String sql = "INSERT INTO list_following ("
				+ "user_id,"
				+ "id_user_following," 
				+ "first_name,"
				+ "last_name) " 
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "? )";
		
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				following.getUser_id(),
				following.getId_user_following(),
				following.getFirst_name(),
				following.getLast_name()
			});
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				Following lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	private Following selectLast() {
		String sql = "SELECT * FROM list_following ORDER BY id DESC LIMIT 1";

		try {
			Following following = (Following) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Following.class));
			return following;
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Following> getUserFollowing(Following following) {
		String sql = "SELECT * FROM `list_following` WHERE user_id = " + following.getUser_id();
		
		try {
			List<Following> getUserFollowing = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Following.class));
			
			return getUserFollowing;
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public List<Following> getUserFollowing(int currentUser) {
		String sql = "SELECT * FROM `list_following` WHERE user_id = " + currentUser;
		
		try {
			List<Following> getUserFollowing = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Following.class));
			
			return getUserFollowing;
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

	@Override
	public int countgetUserFollowing(int currentUser) {
		String sql = "SELECT count(1) FROM (SELECT * FROM `list_following` WHERE user_id = "+currentUser+") as count";
		int total;
//		try {
			total = getJdbcTemplate().queryForObject(sql, new Object[] { currentUser },Integer.class);
			return total;
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return total;
	}

	
}
