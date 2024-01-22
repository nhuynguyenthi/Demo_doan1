<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="models.entities.Customer"%>

<%
    String username="";
    if(session.getAttribute("userLogin")==null){
         username = "customer";
    } else {
        Customer userLogin = (Customer)session.getAttribute("userLogin");
        username = userLogin.getFirstName();
    }

%>

<div id="showcase">
    <div class="header-container">
        <div id="branding">
            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/img/logoraucu.png" width="60%" alt="logo"></a>
        </div>
        <nav >
            <ul id="nav_bar">
                <li><p>Welcome <%= username %></p></li>
                <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/about">Về chúng tôi</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
                <% if(session.getAttribute("userLogin")==null){%>
                <li><a href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
                <li><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                <%} else{%>
                <li><a href="${pageContext.request.contextPath}/profile">Profile cá nhân</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Thoát</a></li>
                <%}%>
                <li><a href="${pageContext.request.contextPath}/cart"><img src="./img/cart.png" width="2.3%"></a><li>

            </ul>
            <div id="mobile">
                <a href="${pageContext.request.contextPath}/cart"><img src="./img/cart.png" width="2.3%"></a>
                <img src="./img/dooha.png" width="2.1%" id="bar">
            </div>
        </nav>

    </div>
</div>

