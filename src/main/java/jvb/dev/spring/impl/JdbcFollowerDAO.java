package jvb.dev.spring.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.FollowerDAO;
import jvb.dev.spring.dao.FollowingDAO;
import jvb.dev.spring.model.Follower;
import jvb.dev.spring.model.Following;
import jvb.dev.spring.util.LoggerUtil;

public class JdbcFollowerDAO extends JdbcDaoSupport implements FollowerDAO {

	@Override
	public Follower insertUserFollower(Follower follower) {
		String sql = "INSERT INTO list_follower ("
				+ "user_id,"
				+ "id_user_follower," 
				+ "first_name,"
				+ "last_name) " 
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "? )";
		LoggerUtil.logConsole("insertUserFollower : " + sql.toString());
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				follower.getUser_id(),
				follower.getId_user_follower(),
				follower.getFirst_name(),
				follower.getLast_name()
			});
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				Follower lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("insertUserFollower : co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("insertUserFollower : co loi! ");
			throw new RuntimeException(e);
		}
	}

	private Follower selectLast() {
		String sql = "SELECT * FROM list_follower ORDER BY id DESC LIMIT 1";

		try {
			Follower follower = (Follower) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Follower.class));
			return follower;
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Follower> getUserFollower(Follower follower) {
		String sql = "SELECT * FROM `list_follower` WHERE user_id = " + follower.getUser_id();
		LoggerUtil.logConsole("getUserFollower: " + sql.toString());
		try {
			List<Follower> getUserFollower = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Follower.class));
			
			return getUserFollower;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("getUserFollower: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    return null;
		}
	}

}
