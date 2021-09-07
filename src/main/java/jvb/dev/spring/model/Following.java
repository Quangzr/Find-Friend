package jvb.dev.spring.model;

public class Following {
	private int id;
	private int user_id;
	private int id_user_following;
	private String first_name;
	private String last_name;
	private int status;

	public Following() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Following(int id, int user_id, int id_user_following, String first_name, String last_name, int status) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.id_user_following = id_user_following;
		this.first_name = first_name;
		this.last_name = last_name;
		this.status = status;
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

	public int getId_user_following() {
		return id_user_following;
	}

	public void setId_user_following(int id_user_following) {
		this.id_user_following = id_user_following;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
