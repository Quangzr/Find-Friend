package jvb.dev.spring.model;

public class Follower {
	private int id;
	private int user_id;
	private int id_user_follower;
	private String first_name;
	private String last_name;

	public Follower() {
		super();
	}

	public Follower(int id, int user_id, int id_user_follower, String first_name, String last_name) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.id_user_follower = id_user_follower;
		this.first_name = first_name;
		this.last_name = last_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getId_user_follower() {
		return id_user_follower;
	}

	public void setId_user_follower(int id_user_follower) {
		this.id_user_follower = id_user_follower;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

}
