
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>

<div id="page-container">
    <div class="Login_bg">
        <div class="login-form">
            <div class="log_form" >
                <div>
                    <h2><b>Đăng nhập</b></h2>
                    <%if(session.getAttribute("loginError")!=null){ %>
                    <h3 class="error">Sai Email hoặc Password!</h3>
                    <%session.removeAttribute("loginError");}%>
                </div>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="txtb">
                        <label>Email : </label><span class="error"></span>
                        <input type="email" placeholder='Nhập e-mail của bạn. ' name="email" required>
                        <label>Password : </label><span class="error"></span>
                        <input type="password" placeholder='Nhập password của bạn.' name="password" required>
                    </div>
                    <input type='submit' class='login_btn' value='LOG IN'>
                    <div class="bottomtext">
                        <p>Bạn chưa có tài khoản? <a href='${pageContext.request.contextPath}/register'><b> Đăng ký tại đây!</b></a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./layouts/footer.jsp"/>
</body>
</html>
