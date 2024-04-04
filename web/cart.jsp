
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.project.connection.DataBaseConnection"%>
<%@page import="com.project.data.ProductData"%>
<%@page import="com.project.model.*"%>
<%@page import="java.util.*"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductData pDao = new ProductData(DataBaseConnection.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
    <style>
        <%@include file="CSS/cart.css" %> 
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class='cartitems'>
    <div class="cartitems-format-main">
        <p>Products</p>
        <p>Title</p>
        <p>Price</p>
        <p>Quantity</p>
        <p>Total</p>
        <p>Remove</p>
        <p>Order</p>
    </div>  
        <hr/>
            
            
<%  double LogicalTotal = 0.0;
    if (cart_list != null) { for (Cart c : cartProduct) {
        double TemporaryTotal = c.getPrice() * c.getQuantity();           %>

    <div>
        <form action="OrderServlet" method="post">
            <div class="cartitems-format cartitems-format-main">
                <img src="Assets/product_<%=c.getId()%>.png" alt="" class='carticon-product-icon'/>
                <input type="hidden" name="id" value="<%=c.getId()%>">
                <p><%=c.getName()%> </p> 
                <p>₹<%=c.getPrice()%></p>
                <button class='cartitems-quantity'><%=c.getQuantity()%></button>
                <input type="hidden" name="quantity" value="<%=c.getQuantity()%>">     
                <p>₹<%=TemporaryTotal%></p>
                <a href="RemoveCartProductServlet?id=<%=c.getId() %>">
                    <img class='carticon-remove-icon' src="Assets/cart_cross_icon.png" alt="" />
                </a>
                <button class="cart-button">
                    <img src="Assets/cart_icon.png" alt="Cart Icon" class="cart-icon" />
                </button> 
            </div>
        </form>        
        <hr/>
    </div>
                                    
                                    
    <%  LogicalTotal += TemporaryTotal;  }}%>
                     
                                                
    <div class="cartitems-down">
        <div class="cartitems-total">
        <h1>cart Totals</h1>
        <div>                       
            <div class="cartitems-total-item">
                <p>Shipping Fee</p>
                <p>Free</p> 
            </div>
            <hr/>
            <div class="cartitems-total-item">
                <h3>Total Price</h3>
                <h3>₹<%=LogicalTotal%></h3>
            </div>
        </div>                        
        </div>
    </div>                          
</div>
                
<%@ include file="footer.jsp" %>
</body>
</html>
