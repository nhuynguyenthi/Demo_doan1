<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<html>
<head>
<title>Đăng ký</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/img/miniapple.png"
	type="image/x-icon">

</head>
<body>
	<jsp:include page="./layouts/header.jsp" />
	<div id="page-container">
		<div class="background">
			<div class="myForm">
				<div class="regi_form">
					<div>
						<h2>
							<b>Đăng ký</b>
						</h2>
						<%
						if (session.getAttribute("regisErrorEmailExist") != null) {
						%>
						<h3 class="error">Email này đã được đăng kí!</h3>
						<%
						session.removeAttribute("regisErrorEmailExist");
						}
						%>
					</div>
					<form action="${pageContext.request.contextPath}/register"
						method="post">
						<div class="txtb">
							<label>Tên* : </label>
							<%-- <input type="text" placeholder='Nhập vào tên của bạn.' name="fName" required pattern="[a-zA-Z]+$" title="Contain only alphabet characters"> --%>
							<input type="text" placeholder="Nhập vào tên của bạn."
								name="fName" required pattern="[a-zA-ZÀ-ỹ ]+$"
								title="Chỉ chứa chữ cái và dấu cách"> 
							<%-- <label>Họ* : </label> <input type="text" placeholder='Nhập vào họ của bạn.'
								name="lName" required pattern="[a-zA-Z]+$"
								title="Contain only alphabet characters"> --%>
							<label>Họ* :</label> <input type="text" placeholder="Nhập vào họ của bạn." name="lName" required pattern="[a-zA-ZÀ-ỹ]+$" title="Chỉ chứa chữ cái">
							<%--   <label>Enter your date of birth* : </label>--%>
							<%--   <input type="text" placeholder="yyyy-mm-dd" name="dob" pattern="(?:19|20)(?:[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:29|30))|(?:(?:0[13578]|1[02])-31))|(?:[13579][26]|[02468][048])-02-29)" required title="Format yyyy-mm-dd">--%>

							<label>Nhập SĐT của bạn* : </label> <input type="tel"
								placeholder='Nhập SĐT của bạn. ' name="phone"
								required> <label>Nhập email của bạn* : </label> <input
								type="email" placeholder='Nhập e-mail của bạn. '
								name="email" required> 
							<label>Nhập password* : </label>
							<input type="password" placeholder='Nhập password của bạn. '
								name="password" minlength="6" required pattern="^.{6,}$"
								title="Must contain at least 6 or more characters">
						</div>
						<input type='submit' class='signup_btn' value='Register'
							name="register">
						<div class="bottom-text">
							<p>
								Hãy quay lại trang <a href='${pageContext.request.contextPath}/login'>
									<b> Đăng nhập</b>
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
