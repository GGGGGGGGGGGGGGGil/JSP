<%@page import="config.JDBC"%>
<%@page import="bean.BookBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bookId = request.getParameter("bookId");	
	
	BookBean bk = null;
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `book` WHERE `bookId`='"+bookId+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		bk = new BookBean();
		
		if(rs.next()){
			bk.setBookId(rs.getInt(1));
			bk.setBookName(rs.getString(2));
			bk.setPublisher(rs.getString(3));
			bk.setPrice(rs.getInt(4));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::modify</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>도서번호</td>				
					<td><input type="number" name="bookId"></td>
				</tr>			
				<tr>
					<td>도서명</td>				
					<td><input type="text" name="bookName"></td>
				</tr>			
				<tr>
					<td>출판사</td>				
					<td><input type="text" name="publisher"></td>
				</tr>			
				<tr>
					<td>가격</td>				
					<td><input type="number" name="price"></td>
				</tr>			
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정">
					</td>
				</tr>			
			</table>
		</form>
	</body>
</html>