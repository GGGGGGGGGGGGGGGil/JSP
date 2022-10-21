<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int bookId	     = Integer.parseInt(request.getParameter("bookId"));
	String bookName	 = request.getParameter("bookName");
	String publisher = request.getParameter("publisher");
	int price		 = Integer.parseInt(request.getParameter("price"));
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		
		String sql = "INSERT INTO `book` VALUES (?,?,?,?)";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setInt(1, bookId);
		psmt.setString(2, bookName);
		psmt.setString(3, publisher);
		psmt.setInt(4, price);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");


%>