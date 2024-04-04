<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="com.project.model.*"%>
<%@page import="com.project.model.*"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
	response.sendRedirect("index.jsp");
	}
        
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
    <style>
        <%@include file="CSS/login.css" %>
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="loginsignup">
    <div class="loginsignup-container">
        <h1>Login</h1>
        <div class="loginsignup-faields">
            <form action="LoginServlet" method="post">
                <input class="form-controle" name="login-email" type="email" placeholder="Email Address" />
                <input class="form-controle" name="login-password" type="password" placeholder="Password" />
                <button class="" type="submit" >Login</button>
            </form>
        </div>
        <p class="loginsignup-login">Create an account?<span onclick="window.location.href='signup.jsp'">Sign Up here</span> </p>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>