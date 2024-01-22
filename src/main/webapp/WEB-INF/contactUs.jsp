<%@ page import="models.entities.Customer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
<title>Liên hệ với chúng tôi</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/img/miniapple.png"
	type="image/x-icon">
<style>
.success {
  color: green;
  font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="./layouts/header.jsp" />
	<div id="page-container">
		<div class="background">

			<div class="myForm">
				<div class="regi_form">
					<div>
						<h2>
							<b> Gửi tin nhắn cho chúng tôi</b>
						</h2>
						<%
						if (session.getAttribute("messageSent") != null) {
						%>
						<h1 class="success">Tin nhắn của bạn đã được gửi!</h1>
						<%
						session.removeAttribute("messageSent");
						}
						%>
					</div>
					<div>
						<p> Nếu bạn có bất kỳ câu hỏi, ý kiến ​thì liên hệ với chúng tôi, vui lòng điền vào mẫu dưới đây.</p>
					</div>
					<form action="${pageContext.request.contextPath}/contactUs"
						method="post">
						<div class="txtb">
							<p>
								<label>Tên của bạn :</label> <b><input type="text"
									name="fName"></b>
							</p>
							<p>
								<label>Tin nhắn :</label> <b><textarea rows="15"
										cols="63" name="message"></textarea></b>
							</p>
						</div>
						<input type='submit' class='signup_btn' value='Send' name="Send">

						<div class="bottom-text">
							<p>
								Quay trở lại <a href='${pageContext.request.contextPath}/home'>
									<b> Trang chủ</b>
								</a>
						</div>
					</form>

				</div>

			</div>

		</div>
	</div>
	<jsp:include page="./layouts/footer.jsp" />
</body>
</html>


