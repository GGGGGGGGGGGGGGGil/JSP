<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieConfirm</title>
	</head>
	<body>
		<h3>cookie 확인</h3>
		<%
			//클라이언트에서 서버로 전송되는 쿠키확인
			Cookie[] cookies = request.getCookies(); //get으로 시작하는 메서드는 geter라 반환타입이 필요함
			
			for(Cookie cookie : cookies){
		%>
			<p>
				쿠키명 : <%= cookie.getName() %><br/>
				쿠키값 : <%= cookie.getValue() %><br/>
			</p>
		<%
			}
		%>
		
		<a href="../1_Cookie.jsp">로그인</a>
		
	</body>
</html>