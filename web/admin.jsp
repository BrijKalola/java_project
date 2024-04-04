<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
    <style>
        <%@include file="CSS/admin.css" %>
    </style>
</head>
<body>
<div class="admin">     
    <div class="navbar">
       <div class="footer-logo">
                <img src="Assets/overlays_logo2.png" alt="" />
                <p>Overlays</p>
            </div>
    

    </div>
    
    <div class="add-product">
        <div class="addproduct-itemfield">
            <p>Product Title</p>
            <input value=""  type="text" name='name' placeholder='Type Here' />
        </div>

        <div class="addproduct-price">
            <div class="addproduct-itemfield">
                <p>Price or Old Price</p>
                <input value=""  type="text" name="old_price" placeholder="Type Here" />
            </div>
            <div class="addproduct-itemfield">
                <p>Offer Price or New Price</p>
                <input value=""  type="text" name="new_price" placeholder="Type Here" />
            </div>
        </div>

        <div class="addproduct-itemfield">
            <p>Product Category</p>
            <select name="category" class="add-product-selector">
                <option value="women">Women</option>
                <option value="men">Men</option>
                <option value="kid">Kid</option>
            </select>
        </div>

        <div class="addproduct-itemfield">
            <label>
                <img src="" class="addproduct-thumnail-img" />
            </label>
            <input onChange={imageHandler} type="file" name="image" id="file-input" hidden />
        </div>
       
        <button onClick={}>ADD</button>
    </div>
</div>
</body>
</html>