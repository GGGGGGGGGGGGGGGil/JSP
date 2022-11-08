<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="college.bean.LectureBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="college.db.DBCP"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<LectureBean> lectures = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `lecture`");
		
		lectures = new ArrayList<>();
		
		while(rs.next()){
			LectureBean lb = new LectureBean();
			
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			
			lectures.add(lb);
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
		<title>College::lecture</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				$('.btnlecAdd').click(function(){
					
					let lec = $(this).val();
					
					$('#lecAdd').show().find('input[name=lec]').val(lec);
					
				});
			});
			
			$(function(){
				$('.btnClose').click(function(){
					$('#lecAdd').hide();
				});
			});
		</script>
	</head>
	<body>
		<h3>강좌관리</h3>
		
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		
		<h4>강좌현황</h4>
		
		<form action="#" method="post">
			<button class="btnlecAdd">등록</button>			
			<table border="1">
				<tr>
					<th>번호</th>
					<th>강좌명</th>
					<th>학점</th>
					<th>시간</th>
					<th>강의장</th>
				</tr>
				<% for(LectureBean lb : lectures){ %>
				<tr>
					<td><%= lb.getLecNo() %></td>
					<td><%= lb.getLecName() %></td>
					<td><%= lb.getLecCredit() %></td>
					<td><%= lb.getLecTime() %></td>
					<td><%= lb.getLecClass() %></td>
				</tr>
				<% } %>
			</table>
		</form>
		
		<div id="lecAdd">
			<h4>강좌등록</h4>
				<button class="btnClose">닫기</button>
					<table border="1">
						<tr>
							<td>번호</td>
							<td><input type="text" name="lecNo"></td>
						</tr>			
						<tr>
							<td>강좌명</td>
							<td><input type="text" name="lecName"></td>
						</tr>			
						<tr>
							<td>학점</td>
							<td><input type="text" name="lecCredit"></td>
						</tr>			
						<tr>
							<td>시간</td>
							<td><input type="text" name="lecTime"></td>
						</tr>			
						<tr>
							<td>강의장</td>
							<td><input type="text" name="lecClass"></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><button class="btnAdd">추가</button></td>
						</tr>			
					</table>
		</div>
	</body>
</html>