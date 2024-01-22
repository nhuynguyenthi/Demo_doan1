<%@ page import="models.entities.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Customer user = (Customer) session.getAttribute("userLogin");
%>
<html>
<head>
    <title>Cập nhật thông tin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">

</head>
<body>
<jsp:include page="./layouts/header.jsp"/>
<div id="page-container">
    <div class="background">
        <div class="myForm">
            <div class="regi_form" >
                <div>
                    <h2><b>Cập nhật thông tin</b></h2>
                </div>
                <form action="${pageContext.request.contextPath}/updateProfile" method="post">
                    <div class="txtb">
                        <p> <label>Tên    :</label>
                            <b><input type="text" value='<%= user.getFirstName()%>' name="fName"></b></p>
                        <p> <label>Họ    :</label>
                            <b><input type="text" value='<%= user.getLastName()%>' name="lName"></b></p>
                        <p> <label>Email    :</label>
                            <b><input type="email" value='<%= user.getEmail()%>' name="email"></b></p>
                        <p><label>SĐT    :</label>
                            <b><input type="tel" value='<%= user.getPhone()%>' name="phone"></b></p>
                    </div>
                    <input type='submit' class='signup_btn' value='Update' name="Update">
                    <div class="bottom-text"><p>Quay trở lại <a href='${pageContext.request.contextPath}/profile'> <b> Profile cá nhân</b></a>
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>
<jsp:include page="./layouts/footer.jsp"/>
</body>
</html>


