<%@page import="java.sql.Statement"%>
<%@page import="config.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bookId = request.getParameter("bookId");
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		
		Statement stmt = conn.createStatement();
		String sql = "DELETE FROM `book` WHERE `bookId`='"+bookId+"'";
		
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");
%>