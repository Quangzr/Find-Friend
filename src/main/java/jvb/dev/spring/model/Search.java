package jvb.dev.spring.model;

public class Search {
	private int id;
	private int id_post;
	private String first_name;
	private String last_name;
	private String dateofbirth;
	private int posts;
	private String created;
	private int user_id;
	private String description;
	private byte[] image;
	private byte[] avatar;
	private String updated;
	private String email;
	private String password;
	private int deleted;
	private String base64Image;
	private String base64Image_1;
	private int user_like;
	private int comment;
	private String value_comment;
	private int status;

	public Search() {
		super();
	}

	public Search(int id, int id_post, String first_name, String last_name, String dateofbirth, int posts,
			String created, int user_id, String description, byte[] image, byte[] avatar, String updated, String email,
			String password, int deleted, String base64Image, String base64Image_1, int user_like, int comment,
			String value_comment, int status) {
		super();
		this.id = id;
		this.id_post = id_post;
		this.first_name = first_name;
		this.last_name = last_name;
		this.dateofbirth = dateofbirth;
		this.posts = posts;
		this.created = created;
		this.user_id = user_id;
		this.description = description;
		this.image = image;
		this.avatar = avatar;
		this.updated = updated;
		this.email = email;
		this.password = password;
		this.deleted = deleted;
		this.base64Image = base64Image;
		this.base64Image_1 = base64Image_1;
		this.user_like = user_like;
		this.comment = comment;
		this.value_comment = value_comment;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_post() {
		return id_post;
	}

	public void setId_post(int id_post) {
		this.id_post = id_post;
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

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public int getPosts() {
		return posts;
	}

	public void setPosts(int posts) {
		this.posts = posts;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
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

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public byte[] getAvatar() {
		return avatar;
	}

	public void setAvatar(byte[] avatar) {
		this.avatar = avatar;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
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

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public String getBase64Image_1() {
		return base64Image_1;
	}

	public void setBase64Image_1(String base64Image_1) {
		this.base64Image_1 = base64Image_1;
	}

	public int getUser_like() {
		return user_like;
	}

	public void setUser_like(int user_like) {
		this.user_like = user_like;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public String getValue_comment() {
		return value_comment;
	}

	public void setValue_comment(String value_comment) {
		this.value_comment = value_comment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

}
