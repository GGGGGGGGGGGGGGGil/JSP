<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션 사용자 제거
	response.sendRedirect("/JBoard1/user/login.jsp?success=201");
%>