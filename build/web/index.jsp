
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@page import="com.project.connection.DataBaseConnection"%>
<%@page import="com.project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/index.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="banner-container">
    <a href="men.jsp"><img src="Assets/banner_mens.png" alt=""/></a>
    <a href="women.jsp"><img src="Assets/banner_women.png" alt=""/></a>
    <a href="kids.jsp"><img src="Assets/banner_kids.png" alt=""/></a>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
