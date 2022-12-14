<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_표현언어</title>
		<!-- 
			날짜 : 2022/11/07
			이름 : 길은섭
			내용 : JSP 표현언어(Expression Language) 실습하기
		 -->
	</head>
	<body>
		<h3>1.표현언어</h3>
		<%
			String name = "홍길동";		
			int num1 = 1;
			int num2 = 2;
			
			pageContext.setAttribute("name", name);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		%>
		
		<h4>표현식</h4>
		<p>
			name : <%= name %><br/>
			num1 : <%= num1 %><br/>
			num2 : <%= num2 %><br/>
			num3 : <%= num1 + num2 %><br/>
		</p>
		
		<h4>표현언어</h4><!-- 프로그램 요소x, 스크립트릿 직접 참조x --> 
		<p>
			name : ${name}<br/>
			num1 : ${num1}<br/>
			num2 : ${num2}<br/>
			num3 : ${num1+num2}<br/>
		</p>
		
		<h4>표현언어 내장객체</h4>
		
		
		
	</body>
</html>