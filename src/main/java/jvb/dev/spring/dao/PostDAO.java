package jvb.dev.spring.dao;

import java.sql.Blob;
import java.util.List;

import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.User;

public interface PostDAO {

	List<Post> getAllPost(Post post);
	
	Post getPost(Post post);
	
	Post insertPost(Post post);
	
	Post findUserByID(int userId);
	
	Blob getPhotoById(int id);
	
	List<Post> getListLike(Post post);
	
	Post doLike(int id_post);
	
	Post addUserLike(Post post);
	
	Post doPostCmt(int id_post);
	
	Post addComment(Post post);
}
