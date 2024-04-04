
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
     <%@include file="CSS/navbar.css" %>
</style>
</head>
<body>

<div class="navbar">
    <div class="nav-logo">
        <img src="Assets/overlays_logo3.jpg" alt=""/>
        <p>Overlays</p>
    </div>

    <ul class="nav-menu">
        <li onclick="window.location.href='index.jsp'" >Home</li>
        <li onclick="window.location.href='men.jsp'" >Men </li>
        <li onclick="window.location.href='women.jsp'" >Women</li>
        <li onclick="window.location.href='kids.jsp'" >Kids</li>
    </ul>

    <div class="nav-login-cart">
    <%
    if (session.getAttribute("auth") != null) {
    %>
    
        <button onclick="window.location.href='LogoutServlet'">Logout</button>
      
    <%
    } else {
    %>
        <button onclick="window.location.href='login.jsp'">Login</button>
    <%
    }
    %> 
        <img onclick="window.location.href='cart.jsp'" src="Assets/cart_icon.png" alt=""/>
        <div class="nav-cart-count">${cart_list.size()}</div>
    </div>
</div>

</body>
</html>
