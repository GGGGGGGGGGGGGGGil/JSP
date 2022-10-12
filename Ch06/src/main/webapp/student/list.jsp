<%@page import="java.util.List"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DB"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	List<StudentBean> students = null;
	
	try{
		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			
			sb.setStdNo(rs.getString(1));
			sb.setName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdyear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::list</title>
	</head>
	<body>
		<h3>student 목록</h3>
		<a href="./register.jsp">student 등록하기</a>
		<table border="1">
			<tr>
				<th>학생번호</th>
				<th>학생이름</th>
				<th>학생번호</th>
				<th>학년</th>
				<th>학생주소</th>
			</tr>
			<% for(StudentBean sb : students){ %>
			<tr>
				<td><%= sb.getStdNo() %></td>
				<td><%= sb.getName() %></td>
				<td><%= sb.getStdHp() %></td>
				<td><%= sb.getStdyear() %></td>
				<td><%= sb.getStdAddress() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= sb.getStdNo() %>">수정</a>
				</td> 
			</tr>
			<% } %>
		</table>
	</body>
</html>