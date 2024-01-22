<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Về chúng tôi</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/img/miniapple.png"
	type="image/x-icon">
</head>
<body>
	<jsp:include page="./layouts/header.jsp" />
	<div id="header-img">
		<img src="${pageContext.request.contextPath}/img/header4.jpg"
			width="100%" height="400" alt="header">
		<div id="story-ad">
			<p>Đôi nét về chúng tôi</p>
		</div>

		<section class="story1">
			<img src="${pageContext.request.contextPath}/img/story1.png"
				width="50%" height="450px">
			<div class="story11">
				<p>Tạo ra một hệ thống thực phẩm tốt hơn</p>
			</div>
			<div class="story111">
				<p>Chào mừng đến với cửa hàng Rau Củ Quả Sạch của chúng tôi -
					nơi chúng tôi cam kết tạo ra một hệ thống thực phẩm tốt hơn cho
					khách hàng của mình. Chúng tôi không chỉ cung cấp các sản phẩm rau
					củ quả tươi ngon mà còn đem đến cho bạn một trải nghiệm mua sắm thú
					vị và ý nghĩa. Chúng tôi hợp tác mật thiết với nông dân và nhà sản
					xuất thực phẩm địa phương, nhằm đảm bảo rằng chất lượng và nguồn
					gốc của các sản phẩm của chúng tôi luôn được kiểm soát chặt chẽ.</p>
			</div>

		</section>
		<section class="story2">
			<div class="story22">

				<p>Từ vườn rau củ quả sạch đến bữa ăn của bạn</p>
			</div>

			<div class="story222">
				<p>Chúng tôi cam kết mang đến cho bạn các sản phẩm rau củ quả
					sạch chất lượng cao, trồng bằng phương pháp tự nhiên và không sử
					dụng chất phụ gia độc hại. Bạn có thể tận hưởng những món ăn tươi
					ngon, giàu dinh dưỡng và an toàn, đồng thời góp phần vào sự phát
					triển bền vững của nền nông nghiệp và bảo vệ môi trường.</p>
			</div>

			<div class="story2222">
				<img src="${pageContext.request.contextPath}/img/story2.png"
					width="50%" height="450px">
				</right>

			</div>
		</section>
		<section class="video-section">
			<div class="video-container ">
				<br>
				<h2>
					<center>Quy trình sản xuất</center>
				</h2>
				<br>
				<iframe id="iframe1" width="500" height="315"
					src="https://www.youtube.com/embed/Gp2WSkS0uq0?si=6Xid6cu3KAj76ntM"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
				<iframe id="iframe2" width="500" height="315"
					src="https://www.youtube.com/embed/xQoJEwtEPHU?si=mR6QaIT9-nA5mgEO"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
				<br>
			</div>
			<section>

				<jsp:include page="./layouts/footer.jsp" />
</body>

</html>
