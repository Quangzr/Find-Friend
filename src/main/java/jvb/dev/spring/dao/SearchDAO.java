package jvb.dev.spring.dao;

import java.util.List;

import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.model.User;

public interface SearchDAO {
	
	List<Search> getAllPost(Search search);
	
	List<Search> getPostById(Search search);
	
	Search finUserByID(int id);
	
	Search addUserLike(Search search);
	
	Search finUserByIDLike(int currentID, int id_post);
	
	List<Search> getUseLike(Search search);
	
	Search addComment(Search search);
	
	List<Search> getComment(Search search);
	
	List<Search> getListComment(int id_post);

}
