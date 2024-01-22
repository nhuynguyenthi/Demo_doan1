<%@ page import="models.entities.Customer" %>
<%@ page import="models.entities.Order" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  Customer user = (Customer) session.getAttribute("userLogin");
  Order newOrder = (Order) session.getAttribute("newOrder");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Hoàn thành thanh toán</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"/>
  <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>
<div id="page-container">
  <center><section>
    <div class="fin-txt">
      <h1>Cảm ơn! Đơn hàng của bạn đã hoàn tất</h1>
      <h2>Số thứ tự đơn hàng: <%= newOrder.getOrderNumber()%> </h2>
      <%-- <h3>You will be receiving a confirmation email to <%=user.getEmail()%> with order details</h3> --%>
    </div>
  </section></center>
  <br><br>
  <div class="exp-more">
    <a style="text-decoration: none" style="color: red;" href="${pageContext.request.contextPath}/products"><b>Khám phá thêm sản phẩm</b></a>
  </div>

  <br><br>
  <jsp:include page="./layouts/footer.jsp"/>
</div>
</body>

</html>