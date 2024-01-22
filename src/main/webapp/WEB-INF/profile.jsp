<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="models.entities.*" %>
<%@ page import="models.managers.OrderManager" %>
<%@ page import="models.managers.OrderProductManager" %>
<%@ page import="models.managers.ProductManager" %>
<%@ page import="models.managers.WishlistManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer user = (Customer) session.getAttribute("userLogin");
    HashMap<Integer, Order> orders = OrderManager.getOderByUserId(user.getId());
    if (orders == null) orders = new HashMap<>();

    HashMap<Integer, Wishlist> wishlists = WishlistManager.getWishlistByUserId(user.getId());
    if (wishlists == null) wishlists = new HashMap<>();

    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    symbols.setGroupingSeparator('.');
    symbols.setDecimalSeparator(',');
    String currencySymbol = "đ";
    DecimalFormat formatter = new DecimalFormat("#,##0", symbols);
    formatter.setPositiveSuffix(currencySymbol);
    formatter.setNegativeSuffix(currencySymbol);

%>


<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/miniapple.png" type="image/x-icon">
</head>
<body>
<jsp:include page="./layouts/header.jsp"/>

    <center><div class="profileInformation">
        <h3>Thông tin cá nhân</h3>
        <p id="proinfo"> <label>Tên    :</label>
            <b><%= user.getFirstName() + " " + user.getLastName()%></b></p>

        <p id="proinfo"> <label>Email    :</label>
            <b><%= user.getEmail()%></b></p>

        <p id="proinfo"><label>SĐT    :</label>
            <b><%= user.getPhone()%></b></p>

        <div><p class="empty5"><a href='${pageContext.request.contextPath}/updateProfile'> <b> Cập nhật thông tin</b></a></p></div>
    </div></center>

    <center><section class="wishList">
        <div class="prof-wish">
        <section id="cart" class="section-prof">
            <table id="table1">
                <thead>
                <tr>
                    <td>Xóa</td>
                    <td>Ảnh</td>
                    <td>Sản phẩm</td>
                    <td>Giá</td>
                    <td>Thêm vào giỏ hàng</td>
                </tr>
                </thead>

                <tbody>

                <div class="empty-title">
                    <p id="empty1">Sản phẩm yêu thích</p>
                    <br>
                    <% if (wishlists.isEmpty()){%>
                    <img id="empty-bag" src="./img/empty-bag.png">
                    <br><br>
                    <p id="empty2"><b>Danh sách yêu thích trống!</b></p>
                    <p id="empty3">Thêm sản phẩm vào danh sách yêu thích của bạn</p>
                    <p id="empty4"><b>Mua sắm từ</b></p>
                    <div class="empty-btn">
                        <p class="empty5"><a style="text-decoration: none" style="color: red;" href="${pageContext.request.contextPath}/products"><b>Sản phẩm của chúng tôi</b></a>
                        </p>
                    </div>
                    <br>

                    <%} else{%>
                    <%
                        for (Map.Entry<Integer, Wishlist> wishlist : wishlists.entrySet()){
                    %>

                </div>

                <div class="dd1">
                    <tr class="cart-items">
                        <td class="remove-btn" id="remove-product"><a style="text-decoration: none" href="Remove?action=1?&id=<%=wishlist.getValue().getId()%>" style="color: inherit;"><b>Xóa</b></a></td>
                        <td><img src="img/<%= wishlist.getValue().getName()%>.jpg" alt=""></td>
                        <td><%= wishlist.getValue().getName()%></td>
                      
<td class="price"><%= new DecimalFormat("###,###.###").format(wishlist.getValue().getPrice()) %>/<%=wishlist.getValue().getUnit()%></td>
                        <td class="remove-btn"><a style="text-decoration: none" href="${pageContext.request.contextPath}/cart?id=<%=wishlist.getValue().getProductId()%>" id="add-btn" style="color: inherit; "><b>Thêm vào giỏ hàng</b></a></td>
                    </tr>
                </div>

                <%}
                }%>
                </tbody>
            </table>

        </section>
        </div>
    </section></center>
    

<center><section class="prof-prev">
    <div class = "previousOrder">
            <div class="empty-title">
                <p id="empty1">Đơn hàng đã đặt của bạn</p>
                <br>
                <% if (orders.isEmpty()){%>
                <img id="empty-bag" src="./img/empty-bag.png">
                <br><br>
                <p id="empty2"><b>Bạn chưa có đơn hàng nào!!</b></p>
                <p id="empty3">Thêm sản phẩm vào giỏ </p>
                <p id="empty4"><b>Mua sắm từ</b></p>
                <div class="empty-btn">
                    <p class="empty5"><a style="text-decoration: none" style="color: red;" href="${pageContext.request.contextPath}/products"><b>Sản phẩm của chúng tôi</b></a>
                    </p>
                </div>
                <br>

                <%} else{%>
                <%
                    for (Map.Entry<Integer, Order> order : orders.entrySet()){
                %>
                <div>
                <%-- <p class="prv">Order number: <%= order.getValue().getOrderNumber() %></p>
                <p class="prv">Date: <%= order.getValue().getOrderDate().toString() %></p>
                <p class="prv-tt">Total: $<%= order.getValue().getTotal() %></p> --%>

    <p class="prv">Số đơn hàng: <%= order.getValue().getOrderNumber() %></p>
    <% if (order.getValue().getOrderDate() != null) { %>
        <p class="prv">Ngày: <%= order.getValue().getOrderDate().toString() %></p>
    <% } %>
    <p class="prv-tt">Tổng tiền: <%= new DecimalFormat("###,###").format(order.getValue().getTotal()) %></p>


                <section id="cart" class="section-prof">
                <table id="table1">
                    <thead>
                    <tr>
                        <td>Ảnh</td>
                        <td>Sản phẩm</td>
                        <td>Giá</td>
                        <td>Số lượng</td>
                        <td>Tổng tiền</td>
                    </tr>
                    </thead>

                    <%
                        HashMap<Integer, OrderProduct> orderProducts = OrderProductManager.getProductByOrderNumber(order.getValue().getOrderNumber());
                        for (Map.Entry<Integer, OrderProduct> orderProduct : orderProducts.entrySet()){
                            Products itemBought = ProductManager.getProductById(orderProduct.getValue().getProductId());
                    %>
                    <!--<tbody style="border: #333333 solid">-->
                    <tr class="cart-items">
                        <td><img src="img/<%= itemBought.getName()%>.jpg" alt="" width="20%"></td>
                        <td><%= itemBought.getName()%></td>
                       <td class="price"><%= new DecimalFormat("###,###.###").format(itemBought.getPrice()).replace(".", ",") %>/<%= itemBought.getUnit() %></td>
                        <td><%= orderProduct.getValue().getQuantity()%></td>
                       <td><%= formatter.format(itemBought.getPrice().multiply(BigDecimal.valueOf(orderProduct.getValue().getQuantity()))) %></td>

                    </tr>
                    <% } %>
                    <!-- </tbody> -->
            </table>
                </section>
                </div>
                <%
                }
                }
                %>
        </div>
    </div>
</div>
</section></center> 

<jsp:include page="./layouts/footer.jsp"/>
</body>
</html>