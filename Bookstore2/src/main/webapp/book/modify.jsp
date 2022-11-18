<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::modify</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="/Bookstore2/">처음으로</a>
		<a href="/Bookstore2/book/list.do">도서목록</a>
		
		<form action="/Bookstore2/book/modify.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="bookId" readonly value="${bv.bookId}"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="bookName" value="${bv.bookName}"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="publisher" value="${bv.publisher}"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="price" value="${bv.price}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정"/>
					</td>
				</tr>			
			</table>	
		</form>
	</body>
</html>