<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.StudentBean"%>
<%@page import="config.DB"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	
	StudentBean sb = null;
	
	try{	
		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student` WHERE `stdNo`='"+stdNo+"'");
		//5단계 - 
		if(rs.next()){ 
			sb = new StudentBean();
			
			sb.setStdNo(rs.getString(1));
			sb.setName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdyear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
		}
		
		//6단계
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
		<title>student::modify</title>
	</head>
	<body>
		<h3>student 수정하기</h3>
		
		<a href="./list.jsp">student 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학생번호</td>
					<td><input type="text" name="stdNo" placeholder="학생번호 입력"></td>
				</tr>			
				<tr>
					<td>학생이름</td>
					<td><input type="text" name="stdName" placeholder="학생이름 입력"></td>
				</tr>			
				<tr>
					<td>학생번호</td>
					<td><input type="text" name="stdHp" placeholder="학생전화번호 입력"></td>
				</tr>			
				<tr>
					<td>학년</td>
					<td><input type="number" name="stdyear" placeholder="학년 입력"></td>
				</tr>			
				<tr>
					<td>학생주소</td>
					<td><input type="text" name="stdAddress" placeholder="학생주소 입력"></td>
				</tr>			
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기">
					</td>
				</tr>	
			</table>
		</form>
	</body>
</html>