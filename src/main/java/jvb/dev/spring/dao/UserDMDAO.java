package jvb.dev.spring.dao;

import java.util.List;

import jvb.dev.spring.model.UserDM;

public interface UserDMDAO {
	UserDM insertUserDM(UserDM userDM);

	List<UserDM> getUserDM(UserDM userDM);
	
	UserDM finUserByID(int id);
}
