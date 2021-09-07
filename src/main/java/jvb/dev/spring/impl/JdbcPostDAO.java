package jvb.dev.spring.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import jvb.dev.spring.dao.PostDAO;
import jvb.dev.spring.jdbc.Connect;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.util.LoggerUtil;

public class JdbcPostDAO extends JdbcDaoSupport implements PostDAO {

	public List<Post> getAllPost(Post post) {

		String sql = "SELECT * FROM users " + 
				"INNER JOIN (SELECT * FROM `posts`) as p  on users.id = p.user_id ORDER BY p.updated DESC";
		LoggerUtil.logConsole("getAllPost : " + sql.toString());
		try {
			List<Post> listPost = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Post.class));

			return listPost;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getAllPost : co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getAllPost : co loi! ");
			return new ArrayList<Post>();
		}
	}

	public Post getPost(Post post) {
		String sql = "SELECT * FROM users" + 
				"INNER JOIN (SELECT * FROM `posts` WHERE posts.user_id = "+post.getUser_id() +") as p  on users.id = p.user_id ORDER BY p.updated DESC";
		LoggerUtil.logConsole("getPost : " + sql.toString());
		try {
			Post postUp = (Post) getJdbcTemplate().query(sql, new BeanPropertyRowMapper(Post.class));

			return postUp;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("getPost: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("getPost: co loi! ");
			return new Post();
		}
	}

	@Override
	public Post findUserByID(int userId) {

		String sql = "SELECT * FROM posts WHERE user_id = " + userId;
		LoggerUtil.logConsole("findUserById: " + sql.toString());
		try {
			Post loginUser = (Post) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Post.class));
			return loginUser;
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("findUserById: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("findUserById: co loi! ");
			return new Post();
		}
	}

	private Post selectLast() {

		String sql = "SELECT * FROM posts ORDER BY id DESC LIMIT 1";

		try {
			Post post = (Post) getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper(Post.class));
			return post;
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Post insertPost(Post post) {
		String sql = "INSERT INTO posts ("
				+ "user_id,"
				+ "description," 
				+ "image,"
				+ "created) " 
				+ "VALUES (" 
				+ "?, " 
				+ "?, " 
				+ "?, " 
				+ "NOW())";
		LoggerUtil.logConsole("insertPost: " + sql.toString());
		String sql2 = "UPDATE users SET posts = posts + 1 WHERE id = " + post.getUser_id();
		try {
			int result = getJdbcTemplate().update(sql, new Object[] {
				post.getUser_id(),
				post.getDescription(),
				post.getImage()
			});
			getJdbcTemplate().update(sql2);
			System.out.println("result"+result);
			if (result == 0) {
				return null;
			} else {
				Post lastUser = selectLast();
				return lastUser;
			}
		} catch (InvalidResultSetAccessException e) {
			LoggerUtil.logConsole("insertPost: co loi! ");
			throw new RuntimeException(e);
		} catch (DataAccessException e) {
			LoggerUtil.logConsole("insertPost: co loi! ");
			throw new RuntimeException(e);
		}
	}

	@Override
	public Blob getPhotoById(int id) {
		String query = "select image from posts where user_id= "+id;
		LoggerUtil.logConsole("getPhotoById: " + query.toString());
		Blob photo = (Blob) getJdbcTemplate().queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper(Blob.class));

		return photo;
	}

	@Override
	public Post doLike(int id_post) {
		
		String sql = "UPDATE posts SET user_like = user_like + 1 WHERE id_post = " + id_post;
		LoggerUtil.logConsole("doLike: " + sql.toString());
		try {
			getJdbcTemplate().update(sql);
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
		
		return null;
	}

	@Override
	public List<Post> getListLike(Post post) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post addUserLike(Post post) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post doPostCmt(int id_post) {
		String sql = "UPDATE posts SET comment = comment + 1 WHERE id_post = " + id_post;
		LoggerUtil.logConsole("doPostCmt: " + sql.toString());
		try {
			getJdbcTemplate().update(sql);
		}
		catch (InvalidResultSetAccessException e) 
		{
		    throw new RuntimeException(e);
		} 
		catch (DataAccessException e)
		{
		    throw new RuntimeException(e);
		}
		
		return null;
	}

	@Override
	public Post addComment(Post post) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
