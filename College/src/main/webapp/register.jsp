<%@page import="java.util.ArrayList"%>
<%@page import="college.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<RegisterBean> registers = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT a.*, b.`lecName`, c.`stdName` FROM `register` AS a JOIN `lecture` AS b ON a.regLecNo = b.lecNo JOIN `student` AS c ON a.regStdNo = c.stdNo";
		ResultSet rs = stmt.executeQuery(sql);
		
		registers = new ArrayList<>();
		
		while(rs.next()){
			RegisterBean rb = new RegisterBean();
			
			rb.setRegStdNo(rs.getString(1));	
			rb.setRegLecNo(rs.getInt(2));	
			rb.setRegMidScore(rs.getInt(3));	
			rb.setRegFinalScore(rs.getInt(4));	
			rb.setRegTotalScore(rs.getInt(5));	
			rb.setRegGrede(rs.getString(6));	
			rb.setLecName(rs.getString(7));
			rb.setStdName(rs.getString(8));
			
			registers.add(rb);
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
		<title>College::register</title>
	</head>
	<body>
		<h3>수강관리</h3>
		
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		
		<h4>수강현황</h4>
		
		<form action="#" method="post">
			<input type="text">
			<button>검색</button>
			<button>수강신청</button>
			
			<table border="1">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>강좌명</th>
					<th>강좌코드</th>
					<th>중간시험</th>
					<th>기말시험</th>
					<th>총점</th>
					<th>등급</th>
				</tr>
				<% for(RegisterBean rb : registers){ %>
				<tr>
					<td><%= rb.getRegStdNo() %></td>
					<td><%= rb.getStdName() %></td>
					<td><%= rb.getLecName() %></td>
					<td><%= rb.getRegLecNo() %></td>
					<td><%= rb.getRegMidScore() %></td>
					<td><%= rb.getRegFinalScore() %></td>
					<td><%= rb.getRegTotalScore() %></td>
					<td><%= rb.getRegGrede() %></td>
				</tr>
				<% } %>
			</table>		
		</form>
		
		<h4>수강신청</h4>
		
		<form action="#" method="post">
			<button>닫기</button>
			
			<table border="1">
					<tr>
						<td>학번</td>
						<td><input type="text" name="regStdNo"></td>
					</tr>		
					<tr>
						<td>이름</td>
						<td><input type="text" name="stdName"></td>
					</tr>		
					<tr>
						<td>신청강좌</td>
						<td><input type="text" name="lecName" placeholder="강좌선택"></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><button>신청</button></td>
					</tr>
			</table>
		</form>
	</body>
</html>