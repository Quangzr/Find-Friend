package jvb.dev.spring.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.SearchDAO;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.model.User;
import jvb.dev.spring.util.LoggerUtil;

public class JdbcSearchDAO extends JdbcDaoSupport implements SearchDAO {

	@Override
	public List<Search> getAllPost(Search search) {
		String sql = "select * from users INNER JOIN (SELECT * FROM posts ORDER BY posts.updated DESC) as p ON users.id = p.user_id ORDER BY p.updated DESC";
		LoggerUtil.logConsole("getAllPost : " + sql.toString());
		try {
			List<Search> listPost = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return listPost;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getAllPost: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getAllPost: co loi! ");
			return new ArrayList<Search>();
		}
	}

	@Override
	public List<Search> getPostById(Search search) {
		String sql = "select * from users INNER JOIN (SELECT * FROM posts ORDER BY posts.updated DESC) as p ON users.id = p.user_id and p.user_id = "+search.getUser_id()+" ORDER BY p.updated DESC"; 
		LoggerUtil.logConsole("getPostById : " + sql.toString());
		try {
			List<Search> listPost = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return listPost;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getPostById: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getPostById: co loi! ");
			return new ArrayList<Search>();
		}
	}

	@Override
	public Search finUserByID(int id) {
		String sql = "SELECT * FROM users " + 
				"INNER JOIN (SELECT * FROM `posts` ) as p  on users.id = p.user_id and users.id = "+id+" and deleted = 0 ORDER BY p.updated DESC";
		LoggerUtil.logConsole("finUserByID : " + sql.toString());
		try {
			Search user = (Search)getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Search.class));
			
			return user;
		}
		catch (InvalidResultSetAccessException e) 
		{
			LoggerUtil.logConsole("finUserByID: co loi! ");
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
			LoggerUtil.logConsole("finUserByID: co loi! ");
		    return new Search();
		}
	}

	@Override
	public Search addUserLike(Search search) {
		String sql = "INSERT INTO list_user_like ("
				+ "post_id,"
				+ "user_id," 
				+ "first_name,"
				+ "last_name) "
//				+ "status)"
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?) " ;
//				+ " '1' )";
		LoggerUtil.logConsole("addUserLike : " + sql.toString());
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				search.getId_post(),
				search.getUser_id(),
				search.getFirst_name(),
				search.getLast_name()
//				search.getStatus()
			});
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				Search lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("addUserLike: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("addUserLike: co loi! ");
			throw new RuntimeException(e);
		}
	}
	
	private Search selectLast() {
		
		String sql = "SELECT * FROM list_user_like ORDER BY id DESC LIMIT 1";

		try {
			Search post = (Search) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Search.class));
			return post;
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Search> getUseLike(Search search) {
		String sql = "select * from  list_user_like where post_id = "+ search.getId_post(); 
		LoggerUtil.logConsole("getUseLike : " + sql.toString());
		try {
			List<Search> listLike = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return listLike;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			return new ArrayList<Search>();
		}
	}

	@Override
	public Search addComment(Search search) {
		String sql = "INSERT INTO list_comment ("
				+ "	id_post,"
				+ "user_id," 
				+ "first_name,"
				+ "last_name, " 
				+ "value_comment) " 
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "?, "
				+ "?)";
		LoggerUtil.logConsole("addComment : " + sql.toString());
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				search.getId_post(),
				search.getUser_id(),
				search.getFirst_name(),
				search.getLast_name(),
				search.getValue_comment()
			});
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				Search lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("addComment: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("addComment: co loi! ");
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Search> getComment(Search search) {
		String sql = "select * from list_comment where post_id = "+ search.getId_post(); 
		LoggerUtil.logConsole("getComment : " + sql.toString());
		try {
			List<Search> listComment = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return listComment;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			return new ArrayList<Search>();
		}
	}

	@Override
	public Search finUserByIDLike(int currentID, int id_post) {
		String sql = "select * from list_user_like where user_id = "+ currentID + "and post_id = "+id_post;
		LoggerUtil.logConsole("getComment : " + sql.toString());
		try {
			Search search = (Search) getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return search;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			return new Search();
		}
	}

	@Override
	public List<Search> getListComment(int id_post) {
		String sql = "select * from list_comment where id_post = "+ id_post; 
		LoggerUtil.logConsole("getListComment: " + sql.toString());
		try {
			List<Search> listComment = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Search.class));

			return listComment;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getUseLike: co loi! ");
			return new ArrayList<Search>();
		}
	}

}
