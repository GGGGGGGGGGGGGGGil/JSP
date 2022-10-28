<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="bean.Productbean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	List<Productbean> products = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `product`");
		
		products = new ArrayList<>();
		
		while(rs.next()){
			Productbean pb = new Productbean();
			
			pb.setProdNo(rs.getInt(1));
			pb.setProdName(rs.getString(2));
			pb.setStock(rs.getInt(3));
			pb.setPrice(rs.getInt(4));
			pb.setCompany(rs.getString(5));
			
			products.add(pb);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product</title>
	</head>
	<body>
		<h3>상품목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재교량</th>
				<th>가격</th>
				<th>제조사</th>
				<th>주문</th>
			</tr>
			<% for(Productbean pb : products){ %>
			<tr>
				<td><%= pb.getProdNo() %></td>
				<td><%= pb.getProdName() %></td>
				<td><%= pb.getStock() %></td>
				<td><%= pb.getPrice() %></td>
				<td><%= pb.getCompany() %></td>
				<td><button>주문</button></td>
			</tr>		
			<% } %>
		</table>
	</body>
</html>