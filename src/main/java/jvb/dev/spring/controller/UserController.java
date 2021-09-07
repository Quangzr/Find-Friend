package jvb.dev.spring.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jvb.dev.spring.dao.FollowerDAO;
import jvb.dev.spring.dao.FollowingDAO;
import jvb.dev.spring.dao.PostDAO;
import jvb.dev.spring.dao.SearchDAO;
import jvb.dev.spring.dao.UserDAO;
import jvb.dev.spring.dao.UserDMDAO;
import jvb.dev.spring.model.Follower;
import jvb.dev.spring.model.Following;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.model.User;
import jvb.dev.spring.model.UserDM;

@Controller
public class UserController {

	private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
	private UserDAO userDAO = (UserDAO) context.getBean("userDAO");
	private PostDAO postDAO = (PostDAO) context.getBean("postDAO");
	private SearchDAO searchDAO = (SearchDAO) context.getBean("searchDAO");
	private FollowingDAO followingDAO = (FollowingDAO) context.getBean("followingDAO");
	private FollowerDAO followerDAO = (FollowerDAO) context.getBean("followerDAO");
	private UserDMDAO userDMDAO = (UserDMDAO) context.getBean("userDMDAO");

	private List<User> whoToFollow = new ArrayList<>();
	private List<User> whoToChat = new ArrayList<>();
	private List<User> listAllUser = new ArrayList<>();
	private List<User> listUserActive = new ArrayList<>();
	private List<User> listUserDelete = new ArrayList<>();
	private List<User> listAllUserFollowing = new ArrayList<>();
	private List<User> listUser = new ArrayList<>();
	private List<User> listUserSearchFollowing = new ArrayList<>();
	private List<User> listUserSearch = new ArrayList<>();
	private List<Post> posts = new ArrayList<>();
	private List<Search> seaList = new ArrayList<>();
	private List<Search> listLike = new ArrayList<>();
	private List<Search> listComment = new ArrayList<>();
	private List<Following> listUserFollowing = new ArrayList<>();
	private List<Follower> listUserFollower = new ArrayList<>();
	private List<UserDM> listUserDM = new ArrayList<>();

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String login(Model model, HttpSession session, Post post, Search search) {

		if (session.getAttribute("username") == null) {
			return "/index-register";
		}

		int id = (int) session.getAttribute("id");

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		posts = postDAO.getAllPost(post);
		model.addAttribute("posts", posts);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		model.addAttribute("arr", new int[] { 1, 2, 3, 4, 5 });

		search.setUser_id(id);
		seaList = searchDAO.getAllPost(search);
		model.addAttribute("seaList", seaList);

		// listComment = searchDAO.getListComment(((Search) seaList).getId_post());
		// model.addAttribute("listComment", listComment);

		System.out.println("Login->id:" + session.getAttribute("id"));
		System.out.println("Login->Username:" + session.getAttribute("username"));

		return "/newsfeed";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {

		session.setAttribute("username", null);

		return "/index-register";
	}

	@RequestMapping(value = "/myHome")
	public String myHome() {

		return "/newsfeed";
	}

	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public String doLogin(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("Login_form") User Login_form, Model model, String email, String password,
			HttpSession session, Post post, Search search) throws IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		User user = userDAO.loginUser(email, password);
		String role_1 = "admin";
		String role_2 = "user";
		if (user.getRole_name().equals(role_1)) {
			User admin = userDAO.loginAdmin(email, password);
			if (admin.getEmail() == null || admin.getPassword() == null) {
				System.out.println("login Fail");
				return "/index-register";
			}
			session.setAttribute("id", admin.getId());
			session.setAttribute("username", admin.getEmail());
			model.addAttribute("currentUser", admin);

			// listUser = userDAO.getListUser(user);
			// model.addAttribute("listUser", listUser);

			listUserActive = userDAO.getUserActive(admin.getId());
			model.addAttribute("listUserActive", listUserActive);

			listUserDelete = userDAO.getUserDelete(admin.getId());
			model.addAttribute("listUserDelete", listUserDelete);

			if (admin.getEmail() != null && admin.getPassword() != null) {
				return "/admin";
			}

		} else if (user.getRole_name().equals(role_2)) {
			User normalUser = userDAO.loginNormalUser(email, password);
			if (normalUser.getEmail() == null || normalUser.getPassword() == null) {
				System.out.println("Login Fail");
				return "/index-register";
			}
			session.setAttribute("id", normalUser.getId());
			session.setAttribute("username", normalUser.getEmail());
			model.addAttribute("currentUser", normalUser);

			whoToFollow = userDAO.getWhoToFollowList(normalUser.getId());
			model.addAttribute("whoToFollow", whoToFollow);

			search.setUser_id(normalUser.getId());
			search.setFirst_name(normalUser.getFirst_name());
			search.setLast_name(normalUser.getLast_name());
			search.setCreated(normalUser.getCreated());
			search.setDescription(post.getDescription());
			seaList = searchDAO.getAllPost(search);
			model.addAttribute("seaList", seaList);

			if (normalUser.getEmail() != null && normalUser.getPassword() != null) {
				return "/newsfeed";
			}
		}
		posts = postDAO.getAllPost(post);
		model.addAttribute("posts", posts);
		return "/index-register";

	}

	@RequestMapping(value = "/getStudentPhoto/{id}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("id") int id) throws Exception {
		String connectionURL = "jdbc:mysql://localhost:3306/java_spring_web";
		String user = "root";
		String pass = "";
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionURL, user, pass);

			PreparedStatement ps = con
					.prepareStatement("SELECT avatar FROM" + "(SELECT * FROM avatars WHERE avatars.user_id=" + id
							+ " ORDER BY avatars.updated DESC LIMIT 1) as p");
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Blob blob = rs.getBlob("avatar");
				byte byteArray[] = blob.getBytes(1, (int) blob.length());

				response.setContentType("image/gif");
				OutputStream os = response.getOutputStream();
				os.write(byteArray);
				os.flush();
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "/getPhoto/{id_post}")
	public void getPhoto(HttpServletResponse response, @PathVariable("id_post") int id_post) throws Exception {
		String connectionURL = "jdbc:mysql://localhost:3306/java_spring_web";
		String user = "root";
		String pass = "";
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionURL, user, pass);

			PreparedStatement ps = con.prepareStatement("select image from posts where id_post=" + id_post);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Blob blob = rs.getBlob("image");
				// Blob blob_1 = rs.getBlob("avatar");
				byte byteArray[] = blob.getBytes(1, (int) blob.length());
				// byte byteArray_1[] = blob_1.getBytes(2, (int)blob_1.length());

				response.setContentType("image/gif");
				OutputStream os = response.getOutputStream();
				os.write(byteArray);
				// os.write(byteArray_1);
				os.flush();
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "/doregister", method = RequestMethod.POST)
	public String doRegister(HttpServletRequest request, Model model, HttpServletResponse response,
			@ModelAttribute("registration_form") User user, @Valid String day, String month, String year,
			BindingResult result) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		String dob = year + "-" + month + "-" + day;
		System.out.println("DOB: " + dob);
		user.setDateofbirth(dob);
		user.setRole_name("user");
		// PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		System.out.println("Register:" + user);
		if (result.hasErrors()) {
			System.out.println("Fail");
			List<ObjectError> errors = result.getAllErrors();
			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "/index-register";
		}
		userDAO.registerUser(user);

		return "/index-register";
	}

	@RequestMapping(value = "/dofollow/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Object> doFollow(@PathVariable("id") int id, Model model, HttpSession session, User user,
			Following following, Follower follower) {

		int currentID = (int) session.getAttribute("id");

		userDAO.doFollow(currentID, id);
		user = userDAO.finUserByID(id);

		following.setUser_id(currentID);
		following.setId_user_following(id);
		following.setFirst_name(user.getFirst_name());
		following.setLast_name(user.getLast_name());
		Following getUserFollowing = followingDAO.insertUserFollowing(following);

		model.addAttribute("getUserFollowing", getUserFollowing);

		User user_1 = userDAO.finUserByID(currentID);
		follower.setUser_id(user.getId());
		follower.setId_user_follower(user_1.getId());
		follower.setFirst_name(user_1.getFirst_name());
		follower.setLast_name(user_1.getLast_name());

		Follower getUserFollower = followerDAO.insertUserFollower(follower);
		model.addAttribute("getUserFollower", getUserFollower);

		return new ResponseEntity<Object>("{\"result\":\"Follow Done!\"}", HttpStatus.OK);

	}

	@RequestMapping(value = "/dounfollow/{id_user_following}", method = RequestMethod.GET)
	public ResponseEntity<Object> doUnfollow(@PathVariable("id_user_following") int id_user_following, Model model,
			HttpSession session) {

		int currentID = (int) session.getAttribute("id");

		userDAO.doUnfollow(currentID, id_user_following);

		listUserFollowing = followingDAO.getUserFollowing(currentID);
		model.addAttribute("listUserFollowing", listUserFollowing);

		int total = followingDAO.countgetUserFollowing(currentID);
		model.addAttribute("total", total);

		return new ResponseEntity<Object>("{\"result\":\"Unfollow Done!\"}", HttpStatus.OK);
	}

	@RequestMapping(value = "/doDelete/{id}", method = RequestMethod.GET)
	public String doDelete(@PathVariable("id") int id, Model model, HttpSession session, User user) {

		int currentID = (int) session.getAttribute("id");

		userDAO.doDelete(id);

		user.setId(currentID);

		// listUserActive= userDAO.getUserActive(user);
		// model.addAttribute("listUserActive", listUserActive);

		return "/admin";
	}

	@RequestMapping(value = "/doActive/{id}", method = RequestMethod.GET)
	public String doActive(@PathVariable("id") int id, Model model, HttpSession session, User user) {

		int currentID = (int) session.getAttribute("id");

		userDAO.doActive(id);

		user.setId(currentID);

		// listUserDelete= userDAO.getUserDelete(user);
		// model.addAttribute("listUserDelete", listUserDelete);

		return "/admin";
	}

	// Timeline
	@RequestMapping(value = "/doView/{id_user_follower}", method = RequestMethod.GET)
	public String viewTimeLine(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id_user_follower") int id_user_follower, Follower follower, Model model, HttpSession session,
			User user, Post post, Search search) {

		int id = (int) session.getAttribute("id");
		User currentUser = userDAO.finUserByID(id_user_follower);
		model.addAttribute("currentUser", currentUser);
		// post.setUser_id(id);
		// search.setUser_id(post.getUser_id());

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		seaList = searchDAO.getPostById(search);
		model.addAttribute("seaList", seaList);

		return "/timeline";
	}

	@RequestMapping(value = "/timeLine/{id}", method = RequestMethod.GET)
	public String timeLine(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") int id,
			Follower follower, Model model, HttpSession session, User user, Post post, Search search) {

		int currentID = (int) session.getAttribute("id");
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);
		// post.setUser_id(id);
		search.setUser_id(id);

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		seaList = searchDAO.getPostById(search);
		model.addAttribute("seaList", seaList);

		return "/timeline";
	}

	@RequestMapping(value = "/myTimeLine")
	public String viewTimeLine(HttpServletRequest request, HttpServletResponse response, Follower follower, Model model,
			HttpSession session, User user, Post post, Search search) {

		int id = (int) session.getAttribute("id");
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);
		post.setUser_id(id);
		search.setUser_id(post.getUser_id());

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		seaList = searchDAO.getPostById(search);
		model.addAttribute("seaList", seaList);

		return "/timeline";
	}

	@RequestMapping(value = "/doDelete", method = RequestMethod.POST)
	public String doDelete(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("formList") User user, HttpSession session, Post post, Search search) {

		int id = Integer.parseInt(request.getParameter("user_id"));
		System.out.println("id =" + id);
		User getUser = userDAO.getUser(id);
		User deleted = userDAO.deleteUser(getUser);
		return "/admin";
	}

	@RequestMapping(value = "/following")
	public String following(HttpServletRequest request, HttpServletResponse response, Model model, String first_name,
			String last_name, HttpSession session, User user, Following following) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		following.setUser_id(id);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		User currenID = userDAO.findUserByUserFollowing(user);
		model.addAttribute("currenID", currenID);

		listUserFollowing = followingDAO.getUserFollowing(following);
		model.addAttribute("listUserFollowing", listUserFollowing);
		return "/people-following";
	}

	@RequestMapping(value = "/follower")
	public String follower(HttpServletRequest request, HttpServletResponse response, Model model, String first_name,
			String last_name, HttpSession session, User user, Follower follower) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		follower.setUser_id(id);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		listUserFollower = followerDAO.getUserFollower(follower);
		model.addAttribute("listUserFollower", listUserFollower);

		return "/people-follower";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("form_search") User user, Model model, HttpSession session) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		user.setId(id);
		listUserSearchFollowing = userDAO.getResultSearchFollowing(user);
		model.addAttribute("listUserSearchFollowing", listUserSearchFollowing);

		listUserSearch = userDAO.getResultSearch(user);
		model.addAttribute("listUserSearch", listUserSearch);

		return "/people-search";
	}

	@RequestMapping(value = "/searchAddress")
	public String doSearch(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("searchForm") User user, Model model, HttpSession session) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);

		user.setId(id);
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		listUserSearch = userDAO.getResultSearchAddress(user);
		model.addAttribute("listUserSearch", listUserSearch);

		listUserSearchFollowing = userDAO.getResultSearchAddressFollowing(user);
		model.addAttribute("listUserSearchFollowing", listUserSearchFollowing);

		return "/newsfeed-people-nearby";
	}

	@RequestMapping(value = "/searchSex")
	public String doSearchSex(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("searchForm") User user, Model model, HttpSession session) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);

		user.setId(id);
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		listUserSearch = userDAO.getResultSearchSex(user);
		model.addAttribute("listUserSearch", listUserSearch);

		listUserSearchFollowing = userDAO.getResultSearchSexFollowing(user);
		model.addAttribute("listUserSearchFollowing", listUserSearchFollowing);

		return "/people-search-sex";
	}

	@RequestMapping(value = "/doGetValue/{id}")
	public ResponseEntity<Object> doGetValue(@PathVariable("id") int id, Model model, HttpSession session, User user,
			UserDM userDM) {
		//
		int currentID = (int) session.getAttribute("id");
		//
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		userDM.setUser_id(currentUser.getId());
		userDM.setFirst_name(currentUser.getFirst_name());
		userDM.setLast_name(currentUser.getLast_name());
		userDM.setDeleted(currentUser.getDeleted());
		userDM.setDateofbirth(currentUser.getDateofbirth());
		userDM.setCountry(currentUser.getCountry());
		userDM.setFollowers(currentUser.getFollowers());
		userDM.setFollowings(currentUser.getFollowings());
		userDM.setRole_name(currentUser.getRole_name());

		UserDM getUserDM = userDMDAO.insertUserDM(userDM);
		model.addAttribute("getUserDM", getUserDM);
		return new ResponseEntity<Object>("{\"result\":\" Done!\"}", HttpStatus.OK);

	}

	@RequestMapping(value = "/doValueUser")
	public String doValueUser(@PathVariable("id") int id, HttpServletRequest request, HttpServletResponse response,
			Model model, String first_name, String last_name, HttpSession session) {

		int currentID = (int) session.getAttribute("id");
		UserDM currentUser = userDMDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		return "/timeline-select";
	}

	@RequestMapping(value = "/message")
	public String message(HttpServletRequest request, HttpServletResponse response, Model model, String first_name,
			String last_name, HttpSession session, User user, Follower follower) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		user.setId(id);
		whoToChat = userDAO.getUserList(user);
		model.addAttribute("whoToChat", whoToChat);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		return "/message";
	}

	@RequestMapping(value = "/message/{id}")
	public String sendMessage(@PathVariable("id") int id, Model model, HttpSession session, User user) {

		int currentID = (int) session.getAttribute("id");

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		User userChat = userDAO.finUserByID(id);
		model.addAttribute("userChat", userChat);
		return "/message";
	}

	@RequestMapping(value = "/doLike/{id_post}")
	public String doLike(@PathVariable("id_post") int id_post, Model model, HttpSession session, User user, Post post,
			Search search) {

		int currentID = (int) session.getAttribute("id");
		Post doLike = postDAO.doLike(id_post);
		User currentUser = userDAO.finUserByID(currentID);
		model.addAttribute("currentUser", currentUser);

		search.setUser_id(currentID);
		search.setId_post(id_post);
		search.setFirst_name(currentUser.getFirst_name());
		search.setLast_name(currentUser.getLast_name());

		Search addList = searchDAO.addUserLike(search);
		model.addAttribute("addList", addList);
		return "/newsfeed";
	}

	@RequestMapping(value = "/getUserLike/{id_post}")
	public String getUserLike(@PathVariable("id_post") int id_post, HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session, User user, Search search) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		search.setId_post(id_post);
		listLike = searchDAO.getUseLike(search);
		model.addAttribute("listLike", listLike);

		return "/people-search";
	}

	@RequestMapping(value = "/getListComment/{id_post}", method = RequestMethod.GET)
	public ResponseEntity<Object> getListComment(@PathVariable("id_post") int id_post, Model model,
			HttpSession session) {

		int currentID = (int) session.getAttribute("id");

		listComment = searchDAO.getListComment(id_post);
		model.addAttribute("listComment", listComment);

		return new ResponseEntity<Object>("{\"result\":\" Done!\"}", HttpStatus.OK);
	}

	@RequestMapping(value = "/doPostComment")
	public ResponseEntity<Object> doPostCMT(@ModelAttribute("doPostComment") Search search,
			@RequestParam("id_post") int id_post, HttpServletRequest request, Model model, HttpSession session,
			User user, Post post) throws Exception {

		int currentID = (int) session.getAttribute("id");
		// int id_post = request.getIntHeader("id_post");
		// int id_post = 173;
		//
		User currentUser = userDAO.finUserByID(currentID);
		model.addAttribute("currentUser", currentUser);

		// seaList = searchDAO.getAllPost(search);
		// model.addAttribute("seaList", seaList);
		//
		// whoToFollow = userDAO.getWhoToFollowList(currentID);
		// model.addAttribute("whoToFollow", whoToFollow);

		String comment = request.getParameter("value_comment");
		search.setUser_id(currentID);
		search.setId_post(id_post);
		search.setFirst_name(currentUser.getFirst_name());
		search.setLast_name(currentUser.getLast_name());
		search.setValue_comment(comment);

		Search addList = searchDAO.addComment(search);
		model.addAttribute("addList", addList);

		// listComment = searchDAO.getListComment(id_post);
		// model.addAttribute("listComment", listComment);

		Post doPostCmt = postDAO.doPostCmt(id_post);

		return new ResponseEntity<Object>("{\"result\":\" Done!\"}", HttpStatus.OK);
	}

	@RequestMapping(value = "/getAllUser")
	public String getAllUser(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session,
			User user) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);
		user.setId(id);
		listAllUser = userDAO.getAll(user);
		model.addAttribute("listAllUser", listAllUser);

		listAllUserFollowing = userDAO.getAllFollowing(user);
		model.addAttribute("listAllUserFollowing", listAllUserFollowing);
		return "/search";
	}

	@RequestMapping(value = "/friend")
	public String getFriend(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session,
			User user, Following following) {

		int id = (int) session.getAttribute("id");
		System.out.println("id = " + id);
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);
		user.setId(id);
		following.setUser_id(id);
		listUserFollowing = followingDAO.getUserFollowing(following);
		model.addAttribute("listUserFollowing", listUserFollowing);
		return "/list-friend";
	}

	@RequestMapping(value = "/sendMail")
	public String sendMail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session,
			User user, Following following) {

		return "/send-Mail";
	}

	// @RequestMapping(value = "/updateProfile")
	// public String updateProfile(HttpServletRequest request, HttpServletResponse
	// response,
	// Model model, HttpSession session, User user, Following following) {
	//
	// int id = (int) session.getAttribute("id");
	//
	// whoToFollow = userDAO.getWhoToFollowList(id);
	// model.addAttribute("whoToFollow", whoToFollow);
	//
	// User currentUser = userDAO.finUserByID(id);
	// model.addAttribute("currentUser", currentUser);
	//
	// return "/update-profile";
	// }

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(HttpServletRequest request, Model model, HttpServletResponse response,
			@ModelAttribute("registration_form") User user, Post post, Search search, HttpSession session,
			@Valid String day, String month, String year, BindingResult result) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		String dob = year + "-" + month + "-" + day;
		System.out.println("DOB: " + dob);
		user.setDateofbirth(dob);
		user.setRole_name("user");
		System.out.println("Register:" + user);

		if (result.hasErrors()) {
			System.out.println("Fail");
			List<ObjectError> errors = result.getAllErrors();
			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "/index-register";
		}
		userDAO.UpdateUser(user);

		int id = (int) session.getAttribute("id");

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		post.setUser_id(id);
		search.setUser_id(post.getUser_id());

		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);

		seaList = searchDAO.getPostById(search);
		model.addAttribute("seaList", seaList);

		return "/timeline";
	}

}
