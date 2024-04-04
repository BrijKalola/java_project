<%-- 
    Document   : productinfo
    Created on : 24-Mar-2024, 10:55:46 am
    Author     : brijk
--%>
<%@page import="com.project.model.User"%>
<%@page import="com.project.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.model.Cart"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}
%>


<%   
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
          <%@include file="CSS/productinfo.css" %>
        </style>
    </head>
    <body>
    <%@ include file="navbar.jsp" %>
    
    <%
        String productId = request.getParameter("id");
        String productPrice = request.getParameter("price");
    %>
    
    <div class="productdisplay">
        <div class="productdisplay-left">          
            <div class="productdisplay-img">
                <img class='productdisplay-main-img' src="Assets/<%= request.getParameter("image") %>" alt=""/>
            </div>
        </div>
        <div class="productdisplay-right">
            <h1><%=request.getParameter("name") %></h1>
                
            <div class="productdisplay-right-prices">
                <div class="productdisplay-right-price-new"> ₹<%=request.getParameter("price") %></div>
            </div>
            
            <a href="AddToCartServlet?id=<%=request.getParameter("id") %>" class="add-to-cart-btn">ADD TO CART</a>
            <p class='productdisplay-right-category'><span>Category :</span>Women , T-Shirt , Crop Top</p>
            <p class='productdisplay-right-category'><span>Tags :</span>Modern , Latest </p>
        </div>         
    </div>          
    <%@ include file="footer.jsp" %>            
    </body>
</html>
