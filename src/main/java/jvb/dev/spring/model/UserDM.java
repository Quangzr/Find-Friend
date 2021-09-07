package jvb.dev.spring.model;

import jvb.dev.spring.validation.ValidEmail;

public class UserDM {
	private int id;
	private int user_id;
	private String first_name;
	private String last_name;
	private String email;
	private String password;
	private String dateofbirth;
	private int gender;
	private String city;
	private String country;
	private int posts;
	private int followers;
	private int followings;
	private int deleted;
	private String login_time;
	private String logout_time;
	private int count_login;
	private String created;
	private String updated;
	private String role_name;
	private String value_search;

	public UserDM() {
		super();
	}

	public UserDM(int id, int user_id, String first_name, String last_name, String email, String password,
			String dateofbirth, int gender, String city, String country, int posts, int followers, int followings,
			int deleted, String login_time, String logout_time, int count_login, String created, String updated,
			String role_name, String value_search) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.dateofbirth = dateofbirth;
		this.gender = gender;
		this.city = city;
		this.country = country;
		this.posts = posts;
		this.followers = followers;
		this.followings = followings;
		this.deleted = deleted;
		this.login_time = login_time;
		this.logout_time = logout_time;
		this.count_login = count_login;
		this.created = created;
		this.updated = updated;
		this.role_name = role_name;
		this.value_search = value_search;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPosts() {
		return posts;
	}

	public void setPosts(int posts) {
		this.posts = posts;
	}

	public int getFollowers() {
		return followers;
	}

	public void setFollowers(int followers) {
		this.followers = followers;
	}

	public int getFollowings() {
		return followings;
	}

	public void setFollowings(int followings) {
		this.followings = followings;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public String getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}

	public int getCount_login() {
		return count_login;
	}

	public void setCount_login(int count_login) {
		this.count_login = count_login;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getValue_search() {
		return value_search;
	}

	public void setValue_search(String value_search) {
		this.value_search = value_search;
	}

}
