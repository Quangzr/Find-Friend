package jvb.dev.spring.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet_1")
@MultipartConfig(maxFileSize = 80177215)
public class FileUploadDBServlet extends HttpServlet {

	// database connection settings
	private String dbURL = "jdbc:mysql://localhost:3306/java_spring_web";
	private String dbUser = "root";
	private String dbPass = "";

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("id");
		String description = request.getParameter("description");

		InputStream inputStream = null; // input stream of the upload file
		InputStream inputStream_1 = null;

		// obtains the upload file part in this multipart request
		Part fileImage = request.getPart("image");
//		Part fileAvatar = request.getPart("avatar");
		
		if (fileImage != null) {
			// prints out some information for debugging
			System.out.println(fileImage.getName());
			System.out.println(fileImage.getSize());
			System.out.println(fileImage.getContentType());

			inputStream_1 = fileImage.getInputStream();
		}
		
//		if (fileAvatar != null) {
//			// prints out some information for debugging
//			System.out.println(fileAvatar.getName());
//			System.out.println(fileAvatar.getSize());
//			System.out.println(fileAvatar.getContentType());
//
//			inputStream = fileAvatar.getInputStream();
//		}

			Connection conn = null; // connection to the database
			String mes = null; // message will be sent back to client

			try {
				// connects to the database
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
				// constructs SQL statement
				
//				if (fileAvatar.getSize() == 0) {
					String sql_1 = "INSERT INTO posts (user_id, description,image) values (?, ?, ?)";

					PreparedStatement statement_1 = conn.prepareStatement(sql_1);
					statement_1.setInt(1, user_id);
					statement_1.setString(2, description);
					if (inputStream_1 != null) {
						statement_1.setBlob(3, inputStream_1);
					}
//					if (inputStream_1 != null) {
//						statement_1.setBlob(4, inputStream_1);
//					}
					int row_1 = statement_1.executeUpdate();
					
					if (row_1 > 0) {
						mes = "File uploaded and saved into database";
					}
//				}
//				if (fileAvatar.getSize() != 0) {
//					String sql = "INSERT INTO  avatars (user_id ,avatar, updated) values ( ?, ?, NOW())";
//					PreparedStatement statement = conn.prepareStatement(sql);
//				
//					statement.setInt(1, user_id);
//					if (inputStream != null) {
//						statement.setBlob(2, inputStream);
//					}
//					// sends the statement to the database server
//					int row = statement.executeUpdate();
//					
//					if (row > 0) {
//						mes = "File uploaded and saved into database";
//					}
//				}
				
				
				// sends the statement to the database server
//				int row = statement.executeUpdate();
				
//				if (row > 0) {
//					mes = "File uploaded and saved into database";
//				}
				
			} catch (SQLException ex) {
				mes = "ERROR: " + ex.getMessage();
				ex.printStackTrace();
			} finally {
				if (conn != null) {
					// closes the database connection
					try {
						conn.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
				}
				// sets the message in request scope
				request.setAttribute("mes", mes);
//             
//            // forwards to the message page
				getServletContext().getRequestDispatcher("/views/mes.jsp").forward(request, response);
			}
			// return "/newsfeed";
		}
	}

