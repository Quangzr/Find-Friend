package jvb.dev.spring.model;

public class Post {

	private int id;
	private int user_id;
	private String description;
	private String image;
	private String updated;
	private String created;
	private int count_post;

	public Post() {

	}

	public Post(int id, int user_id, String description, String image, String updated, String created, int count_post) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.description = description;
		this.image = image;
		this.updated = updated;
		this.created = created;
		this.count_post = count_post;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getCount_post() {
		return count_post;
	}

	public void setCount_post(int count_post) {
		this.count_post = count_post;
	}

}
