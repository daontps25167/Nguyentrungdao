<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/styleSP.css">
</head>
<body>
	<div class="container">
		<table width="100%" style="align-content: center">
			<tr>
				<td width="40%">
					<div class="bg">
						<img src="images/${ctsp.getHinhSP()}" width="10" height="20">
					</div>
				</td>
				<td width="60%">
					<h2>
						<strong>${ctsp.getTenSP()}</strong>
					</h2>

					<h5>
						<strong>Giá sản phẩm:</strong>&ensp;<strong style="color: red">${gia}
							VNĐ</strong>
					</h5>
					<div class="chi-tiet mt-3" style="padding-top: 8px;">
						<p>
							&emsp;<i class="fa fa-map-marker" aria-hidden="true"></i>&emsp;<span>Mua
								sản phẩm tại showroom của <strong>sneaker</strong>
							</span>
						</p>

						<p>
							&emsp;<i class="fa fa-truck" aria-hidden="true"></i>&emsp;<span>Miễn
								phí vận chuyển trên toàn quốc</span>
						</p>
						<p>
							&emsp;<i class="fa fa-heartbeat" aria-hidden="true"></i>&emsp;<span>Bảo
								hành chính hãng</span>
						</p>
						<p>
							&emsp;<i class="fa fa-gift" aria-hidden="true"></i>&emsp;<span>Quà
								tặng hấp dẫn khi mua kèm sản phẩm</span>
						</p>
						<p>
							&emsp;<i class="fa fa-refresh" aria-hidden="true"></i>&emsp;<span>Đổi
								hàng miễn phí trong 7 ngày khi chưa sử dụng</span>
						</p>
					</div>
					<p></p>
					<form action="/gioHang?id=${ctsp.getIdSP()}" method="post">
						<button class="btn btn-dark text-center">THÊM VÀO GIỎ</button>
					</form>
				</td>
			</tr>
		</table>
	</div>

	<div class="container">
		<div class="bg-table pt-3">
			<table>
				<tr>
					<td width="5%"></td>
					<td width="30%"><h3>Giới thiệu sản phẩm</h3></td>
					<td width="30%"></td>
					<td width="5%"></td>
					<td width="40%"></td>
				</tr>
				<tr>
					<td></td>
					<td class="chi-tiet-1">
						<p>
							<strong>Bảo hành chính hãng</strong>
						</p>
						<p>
							<strong>Chống nước</strong>
						</p>
						<p>
							<strong>Đế cao</strong>
						</p>
						<p>
							<strong>Giới tính</strong>
						</p>
						<p>
							<strong>Chất liệu</strong>
						</p>
						<p>
							<strong>Loại giày</strong>
						</p>
						<p>
							<strong>Size</strong>
						</p>
						<p>
							<strong>Thương hiệu</strong>
						</p>
						<p>
							<strong>Xuất xứ</strong>
						</p>
					</td>
					<td class="chi-tiet-2">
						<p>Giày thời trang</p>
						<p>Vải cao cấp</p>
						<p>Sneaker</p>
						<p>Nam</p>
						<p>Đế khâu</p>
						<p>Full box</p>
						<p>Đế cao 2-3cm</p>
						<p>Nike</p>
						<p>Việt Nam</p>
					</td>
					<td></td>
					<td><img src="images/baohanh.jpeg" width="500px"
						height="550px"></td>
				</tr>
			</table>
		</div>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="bi bi-arrow-up text-white"></i>
	</button>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
