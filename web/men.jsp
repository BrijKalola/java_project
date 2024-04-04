<%-- 
    Document   : men
    Created on : 24-Mar-2024, 7:35:42 am
    Author     : brijk
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.project.connection.DataBaseConnection"%>
<%@page import="com.project.data.ProductData"%>
<%@page import="com.project.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}
ProductData pd = new ProductData(DataBaseConnection.getConnection());
List<Product> products = pd.getAllProducts();

List<Product> menProducts = new ArrayList<>();
for (Product p : products) {
    if ("men".equals(p.getCategory())) {
        menProducts.add(p);
    }
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
        <%@include file="CSS/men.css" %>
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
      
<div class="container_item">
<%   
    if (!menProducts.isEmpty()) {
    int productCount = 0;
    for (Product p : menProducts) {
    productCount++;
%>  
    <div class="item">
        <a href="productinfo.jsp?id=<%= p.getId() %>&name=<%=p.getName() %>&image=<%=p.getImage() %>&price=<%=p.getPrice() %>">
            <img src="Assets/<%=p.getImage() %>" alt=""/>
        </a>
        <p><%=p.getName() %></p>
        <div class="item-prices">       
            <div class="item-price-new">
               ₹<%=p.getPrice() %>
            </div>
        </div>
    </div>  
<%
        }
    } else {
	out.println("There is no products");
	}
%>  
</div>

<%@ include file="footer.jsp" %>
</body>
</html>

