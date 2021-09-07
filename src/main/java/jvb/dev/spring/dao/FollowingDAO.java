package jvb.dev.spring.dao;

import java.util.List;

import jvb.dev.spring.model.Following;

public interface FollowingDAO {
	Following insertUserFollowing(Following following);
	
	List<Following> getUserFollowing(Following following);
	
	List<Following> getUserFollowing(int currentUser);
	
	int countgetUserFollowing(int currentUser);
}
