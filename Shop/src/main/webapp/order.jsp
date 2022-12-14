<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.farmstory1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory1.bean.OrderBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	List<OrderBean> orderer = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT a.*, b.`name`, c.`prodName` FROM `order` AS a" ;
			   sql += "JOIN `customer` AS b ON a.orderId = b.custId";
			   sql += "JOIN `product` AS c ON a.orderProduct = c.prodNo";
			   
		ResultSet rs = stmt.executeQuery(sql);
		
		orderer = new ArrayList<>();
		
		while(rs.next()){
			OrderBean ob = new OrderBean();
			
			ob.setOrderNo(rs.getInt(1));
			ob.setOrderId(rs.getString(2));
			ob.setOrderProduct(rs.getInt(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			ob.setName(rs.getString(6));
			ob.setProdName(rs.getString(7));
			
			orderer.add(ob);
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
		<title>Order</title>
	</head>
	<body>
		<h3>주문목록</h3>
		
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
			<% for(OrderBean ob : orderer){ %>
			<tr>
				<td><%= ob.getOrderNo() %></td>
				<td><%= ob.getName() %></td>
				<td><%= ob.getProdName() %></td>
				<td><%= ob.getOrderCount() %></td>
				<td><%= ob.getOrderDate() %></td>
			</tr>		
			<% } %>
		</table>
	</body>
</html>