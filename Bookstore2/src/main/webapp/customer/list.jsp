<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>customer::list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		
		<table border="1">
			<tr>
				<th>고객번호</th>		
				<th>고객명</th>		
				<th>주소</th>		
				<th>휴대폰</th>		
				<th>관리</th>		
			</tr>
			<tr>
				<td>1</td>
				<td>박지성</td>
				<td>영국 맨체스터</td>
				<td>010-1234-1001</td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>김연아</td>
				<td>대한민국 서울</td>
				<td>010-1234-1002</td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>장미란</td>
				<td>대한민국 강원도</td>
				<td>010-1234-1003</td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>