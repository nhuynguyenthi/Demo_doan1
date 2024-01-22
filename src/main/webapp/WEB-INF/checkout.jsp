<%@ page import="models.entities.Customer" %>
<%@ page import="models.entities.Order" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Customer user = (Customer) session.getAttribute("userLogin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Check Out</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>


<%
    if(session.getAttribute("userLogin")==null){
%>
<br><br><br>
<h1 id="plzlogin">Đăng nhập để tiếp tục</h1><br>
<center><a style="text-decoration: none" href="${pageContext.request.contextPath}/login" id="gologin"><b>Đi đến đăng nhập</b></a></center><br><br>
<center><a style="text-decoration: none" href="${pageContext.request.contextPath}/cart" id="gocart"><b>Quay lại giỏ hàng</b></a></center><br>
<%} else{%>

        <br>
        <center><h1 id="cyo">Hoàn tất đơn đặt hàng của bạn</h1></center>

            <div class="deli_form">
                <div class="txtb">
                <h2>Địa chỉ thanh toán</h2>
                <label for="fname"> Họ và tên : </label>
                <input type="text" id="fname" name="fullname" placeholder=<%=user.getFirstName()+" "+user.getLastName()%>>
            <br>
                <label for="address"> Địa chỉ : </label>
                <input type="text" id="address" name="address" placeholder="123 Hòa Quý" required>
            <br>
            <label for="city"> Thành phố : </label>
                <input type="text" id="city" name="city" placeholder="Đà Nẵng" required>
                <div class="col-50">
                    <label for="postcode" >Mã Tĩnh : </label>
                    <input type="text" id="postcode" name="postcode" placeholder="423ADV" required>
                </div>
                </div>


        <div class="payment-method">
            <h2>Phương thức thanh toán</h2>
            <label for="card" class="method card">
                    <img src="${pageContext.request.contextPath}/img/pay.jpg"/>
                    <!--<img src="${pageContext.request.contextPath}/img/mastercard_logo.png"/>-->

                <div class="radio-input">
                    <input id="card" type="radio" name="payment" checked>
                   Thanh toán khi nhận hàng
                </div>
            </label>

          <%--  <label for="paypal" class="method paypal">
                <img style="width: 25%" src="${pageContext.request.contextPath}/img/Paypallogopng.png"/>
                <div class="radio-input">
                    <input id="paypal" type="radio" name="payment">
                    Thanh toán với Paypal
                </div>
            </label> --%> 
        </div>
            </div>

    <div class="panel-footer">
        <a style="text-decoration: none" href="${pageContext.request.contextPath}/finish" id="gofin"><b>Thanh toán</b></a><br><br><br>
        <a style="text-decoration: none" href="${pageContext.request.contextPath}/cart" id="gocart"><b>Quay lại mua sắm</b></a>

    </div>

<% }%>
<br><br>
<jsp:include page="./layouts/footer.jsp"/>
</body>

</html>
