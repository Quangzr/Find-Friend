package jvb.dev.spring.controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jvb.dev.spring.dao.PostDAO;
import jvb.dev.spring.dao.SearchDAO;
import jvb.dev.spring.dao.UserDAO;
import jvb.dev.spring.model.Post;
import jvb.dev.spring.model.Search;
import jvb.dev.spring.model.User;

@Controller
public class PostController extends HttpServlet {

	private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
	private UserDAO userDAO = (UserDAO) context.getBean("userDAO");
	private PostDAO postDAO = (PostDAO) context.getBean("postDAO");
	private SearchDAO searchDAO = (SearchDAO) context.getBean("searchDAO");
	private List<User> whoToFollow = new ArrayList<>();
	private List<Post> posts = new ArrayList<>();
	private List<Search> seaList = new ArrayList<>();

	@RequestMapping(value = "/people")
	public String showPeople() {
		return "/people";
	}

	@RequestMapping(value = "/image")
	public String showImage() {
		return "/image";
	}

	@RequestMapping(value = "/doPost", method = RequestMethod.POST)
	public String doPost(HttpSession session, HttpServletRequest request, @ModelAttribute("formPost") Post post, Model model, HttpServletResponse response, BindingResult result, Search search) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		int id = (int) session.getAttribute("id");
		post.setUser_id(id);
		whoToFollow = userDAO.getWhoToFollowList(id);
		model.addAttribute("whoToFollow", whoToFollow);
		User currentUser = userDAO.finUserByID(id);
		model.addAttribute("currentUser", currentUser);

		search.setUser_id(post.getUser_id());
		seaList = searchDAO.getAllPost(search);
		model.addAttribute("seaList", seaList);

		return "/newsfeed";
	}

	private String ExtractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("fileName")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}
