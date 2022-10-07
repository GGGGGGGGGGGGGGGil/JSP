<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" errorPage="/70-2p.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에러 페이지 지정</title>
	</head>
	<body>
		<%
			int myAge = Integer.parseInt(request.getParameter("age")) + 10; // 에러 발생
			out.println("10년 후 당신의 나이는 " + myAge + "입니다."); // 실행되지 않음
		%>
	</body>
</html>