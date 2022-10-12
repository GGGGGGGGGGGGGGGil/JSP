<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::register</title>
	</head>
	<body>
		<h3>student 등록하기</h3>
		<a href="./list.jsp">student 목록</a>
	
		<form action="./list.jsp" method="post">
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