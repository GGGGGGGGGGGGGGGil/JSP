<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>customer::register</title>
	</head>
	<body>
		<h3>고객수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">고객목록</a>
		
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>고객번호</td>				
					<td><input type="number" name="bookId"></td>
				</tr>
				<tr>
					<td>고객명</td>				
					<td><input type="text" name="bookName"></td>
				</tr>			
				<tr>
					<td>주소</td>				
					<td><input type="text" name="pub"></td>
				</tr>			
				<tr>
					<td>휴대폰</td>				
					<td><input type="number" name="price"></td>
				</tr>			
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록">
					</td>
				</tr>			
			</table>
		</form>
	</body>
</html>