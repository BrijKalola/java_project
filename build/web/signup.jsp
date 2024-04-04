<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <style>
        <%@include file="CSS/signup.css" %>
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="loginsignup">
    <div class="loginsignup-container">
        <h1>Sign Up</h1>
        <div class="loginsignup-faields">
            <form action="SignupServlet" method="post">
                <input class="form-controle" name="signup-name" type="text" placeholder="Name" />
                <input class="form-controle" name="signup-email" type="email" placeholder="Email Address" />
                <input class="form-controle" name="signup-password" type="password" placeholder="Password" />
                <button class="" type="submit" >Sign Up</button>
            </form>
        </div>
        <p class="loginsignup-login">Already have an account?<span onclick="window.location.href='login.jsp'">Login here</span> </p>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>