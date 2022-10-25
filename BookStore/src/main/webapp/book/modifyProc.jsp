<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int bookId    = Integer.parseInt(request.getParameter("bookId"));	
	String bookName  = request.getParameter("bookName");	
	String publisher = request.getParameter("publisher");	
	int price     = Integer.parseInt(request.getParameter("price"));	
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		String sql = "UPDATE `book` SET `bookName`=?, `publisher`=?, `price`=? ";
		   	   sql += "WHERE `bookId`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, bookName);
		psmt.setString(2, publisher);
		psmt.setInt(3, price);
		psmt.setInt(4, bookId);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>