<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%> 
<% //html로 출력되서 contentType을 application/json로 바꿔줌
	
	//Java Json 데이터 생성
	//이건 너무 불편해서 gson 라이브러리 추가해서 사용함
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":25}";
	
	//Json 데이터 출력
	out.print(jsonData);
%>