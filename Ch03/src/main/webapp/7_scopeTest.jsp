<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7_scopeTest</title>
		<!-- 
			날짜 : 2022/10/06
			이름 : 길은섭
			내용 : JSP 내장객체와 영역(Scope) 실습하기
		 -->
	</head>
	<body>
		<h3>내장객체 영역</h3>
		
		<h4>각 내장객체 영역 설정</h4>
		<!-- 
			같은 영역 안에서 setAttribute 와 setAttribute 했기 때문에 출력됨
			application > session > request > pageContext
			작은 영역 부터 큰 영역까지 순서대로 출력
		-->
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "이순신");
		%>
		
		<h4>각 내장객체 영역 확인</h4>
		<p>
			pageContext 영역 : <%= pageContext.getAttribute("name") %><br/>
			request 영역 	: <%= request.getAttribute("name") %><br/>
			session 영역 	: <%= session.getAttribute("name") %><br/>
			application 영역 : <%= application.getAttribute("name") %><br/>
		</p>
		
		<% 
			//pageContext.forward("./proc/scopeResult.jsp");
		%>
		<a href="./proc/scopeResult.jsp">내장객체 영역 확인</a>
	</body>
</html>