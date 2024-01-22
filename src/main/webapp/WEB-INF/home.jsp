
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Trang chủ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/img/miniapple.png"
	type="image/x-icon">

</head>
<body>
	<div class="wrapper">
		<jsp:include page="./layouts/header.jsp" />
		<div id="page-container">
			<section>
				<img src="img/header4.jpg" width="100%" alt="header">
				<div id="ad">
					<p style="font-size: 30px;">Chào mừng bạn đã Đến với cửa hàng</p>
				</div>
				<div>
					<p id="inseason">Thực phẩm mùa</p>
					<div id="container">
						<img src="${pageContext.request.contextPath}/img/vegetables.jpg"
							width="45%">
						<div id="in-season1"></div>
						<div id="pre-order">
							<p class="order-btn">
								<a href="${pageContext.request.contextPath}/products"><input
									type="submit" value="Đặt sản phẩm"></a>
							</p>
						</div>
						<div class="box">
							<div class="in-season">
								<img src="${pageContext.request.contextPath}/img/spring.jpg"
									width="95%" height="80%">
								<p class="season-1">Mùa Xuân</p>
							</div>
							<div class="in-season">
								<img src="${pageContext.request.contextPath}/img/summer.jpg"
									width="95%" height="80%">
								<p class="season-2">Mùa Hè</p>
							</div>
							<div class="in-season">
								<img src="${pageContext.request.contextPath}/img/winter.jpg"
									width="95%" height="80%">
								<p class="season-3">Mùa Đông</p>
							</div>
							<div class="in-season">
								<img src="${pageContext.request.contextPath}/img/automn.jpg"
									width="95%" height="80%">
								<p class="season-4">Mùa Thu</p>
							</div>
						</div>
					</div>
				</div>
			</section>


			<jsp:include page="./layouts/footer.jsp" />
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/index.js"></script>
</body>

</html>