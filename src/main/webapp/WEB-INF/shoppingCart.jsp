<%@ page import="models.entities.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.entities.ShoppingCart" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
if (cartList == null) cartList = new ArrayList<ShoppingCart>();
BigDecimal total = BigDecimal.ZERO;
DecimalFormat formatter = new DecimalFormat("#,### đ");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="img/miniapple.png" type="image/x-icon">
  
    <style>
    #subtotal input[type="submit"] {
        background-color: green;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
    }
   
</style>
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>

<section id="cart" class="section-p1">
    <table width="100%" id="table1">
        <thead>
        <tr>
            <td>Xóa</td>
            <td>Ảnh</td>
            <td>Sản phẩm</td>
            <td>Giá</td>
            <td>Số lượng</td>
            <td>Tổng tiền</td>
        </tr>
        </thead>

        <tbody>
        <% if (cartList.isEmpty()){ %>
        <div class="empty-title">
            <p id="empty1">Giỏ hàng của bạn</p>
            <br>
            <img id="empty-bag" src="./img/empty-bag.png">
            <br><br>
            <p id="empty2"><b>Giỏ của bạn trống!</b></p>
            <p id="empty3">Thêm các mặt hàng vào giỏ hàng của bạn</p>
            <p id="empty4"><b>Mua sắm từ</b></p>
            <div class="empty-btn">
            <p class="empty5"><a style="text-decoration: none" style="color: red;" href="${pageContext.request.contextPath}/products"><b>Sản phẩm của chúng tôi</b></a>
            </p>
            </div>
            <br>
        <% } else { %>
        <% for(ShoppingCart item: cartList){ %>
            <tr class="cart-items">
                <td class="remove-btn"><a style="text-decoration: none" href="Remove?index=<%=cartList.indexOf(item)%>" style="color: inherit;"><b>Xóa</b></a></td>
                <td><img src="img/<%= item.getName()%>.jpg" alt=""></td>
                <td><%= item.getName()%></td>
                <td class="price"><%=formatter.format(item.getPrice())%>/<%=item.getUnit()%></td>
                <td>
                    <a style="text-decoration: none" href="quantity?action=0&index=<%=cartList.indexOf(item)%>" id="qtyminus">-</a>&nbsp
                    <input type="number" value="<%=item.getQuantity()%>" name="" class="quanity" readonly>&nbsp
                    <a style="text-decoration: none" href="quantity?action=1&index=<%=cartList.indexOf(item)%>" id="qtyplus">+</a>
                </td>
                <% BigDecimal itemPrice = item.getPrice();
                   int itemQuantity = item.getQuantity();
                   BigDecimal itemTotal = itemPrice.multiply(BigDecimal.valueOf(itemQuantity));
                   total = total.add(itemTotal);
                %>
                <td><%= formatter.format(itemTotal) %></td>
            </tr>
        <% } %>
        <% } %>
        </tbody>
    </table>
</section>

<div class="con-btn">
    <p class="continue-btn"><a style="color: inherit;" href="${pageContext.request.contextPath}/products"><b>Tiếp tục mua sắm</b></a>
    </p>
</div>

<section id="cart-add" class="section-p1">
    <div id="subtotal">
        <form action="${pageContext.request.contextPath}/checkout" method="post">
            <h3>Tổng Tiền: <%= formatter.format(total) %></h3>
            <input type="hidden" name="total" value="<%= total %>">
            <input type="submit" value="Thanh toán">
        </form>
    </div>
</section>

<jsp:include page="./layouts/footer.jsp"/>
</body>

</html>