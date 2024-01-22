<%@ page import="models.entities.Products" %>
<%@ page import="models.action.ProductAction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

    HashMap<Integer, Products> products = (HashMap<Integer, Products>) request.getAttribute(ProductAction.PRODUCT_PARAM);
    if (products == null) products = new HashMap<>();
%>
<html>
<head>
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>
<br><br>

<center><section class="ser-bar">
<div class="name-input">
    <form action="#" method="get">
        <!--<label for="name-input"><b>Search by name</b></label>-->
        <input name="name" id="name-input" placeholder="Tìm kiếm theo tên"/>
        <button type="submit" id="search-btn" value="search">Tìm kiếm</button>
    </form>

</div>

<div class="cate-input">
    <form action="${pageContext.request.contextPath}/products" method="get">
       <!-- <label for="category-input"><b>Search by category</b></label>-->
        <input name="category" id="category-input" placeholder="Tìm kiếm theo loại"/>
        <button type="submit" id="filter-btn" value="filter">Tìm kiếm</button>
    </form>
</div>
</section></center>

<!--<a href="${pageContext.request.contextPath}/products">All products-->
<div class="pro_txt">
<h2><a href="${pageContext.request.contextPath}/products" style="color: inherit; text-decoration: none;">Sản phẩm của chúng tôi</a></h2>
</div>
<br>
<% if(session.getAttribute("loginRequireError")!=null){ %>
    <h1 id="plzlogin">Đăng nhập để thêm vào danh sách yêu thích</h1><br>
    <center><a style="text-decoration: none" href="${pageContext.request.contextPath}/login" id="gologin"> <b>Đi tới Đăng nhập</b></a></center><br><br>
    <center><a style="text-decoration: none" href="${pageContext.request.contextPath}/products" id="conshop"><b>Tiếp tục mua</b></a></center><br>
<% session.removeAttribute("loginRequireError");}%>

<br>
<center><div class="products_container">
        <%
            for (Map.Entry<Integer, Products> product : products.entrySet())
            { %>
            <div class="products" >
                <img src="${pageContext.request.contextPath}/img/<%= product.getValue().getName() %>.jpg" alt="product of <%= product.getValue().getName() %>">
                <p class="name"><%= product.getValue().getName() %></p>
                <p class="Category"><%= product.getValue().getCategory() %></p>
               <p class="price"><%= currencyFormat.format(product.getValue().getPrice()) %> một <%= product.getValue().getUnit() %> </p>
                <p class="description"><%= product.getValue().getDescription() %></p>
                <form id='quantity_form' class='quantity'>
                    <div id="add-product">
                        <p class="add-btn">
                            <a href="${pageContext.request.contextPath}/cart?id=<%=product.getValue().getId()%>" id="add-btn" style="color: inherit;"><b>Thêm vào giỏ</b></a>
                        </p>
                    </div>

                    <div id="wish-btn">
                        <p class="wish-btn">
                            <a href="${pageContext.request.contextPath}/wishlist?id=<%=product.getValue().getId()%>" id="wish-bt" style="color: inherit;"><b>Thêm vào yêu thích</b></a>
                        </p>
                    </div>
                </form>
            </div>
        <%}
        %>

</div></center>
<br>
<jsp:include page="./layouts/footer.jsp"/>

</body>
</html>