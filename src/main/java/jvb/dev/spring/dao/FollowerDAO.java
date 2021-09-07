package jvb.dev.spring.dao;

import java.util.List;

import jvb.dev.spring.model.Follower;

public interface FollowerDAO {
	Follower insertUserFollower(Follower follower);

	List<Follower> getUserFollower(Follower follower);
}
