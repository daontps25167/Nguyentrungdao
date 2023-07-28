<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<h3 style="text-align: center; margin-top: 15px"><s:message code="lo.mn.Genuineshoes" /></h3>
<p style="text-align: center"><s:message code="lo.mn.camket" /></p>
<img src="images/Capture.png" width="100%" height="200px">
;
<section>
	<div class="container">
		<h3 style="text-align: center"><s:message code="lo.mn.noibat" /></h3>

		<div class="row mb-3">
			<c:forEach var="item" items="${spNoiBac.content}">
				<div class="col-md-3 col-sm-12 mb-4">
					<div class="card container padding-right: 0px;">
						<a href="/sp?id=${item.getIdSP()}"><img class="card-img-top"
							src="images/${item.getHinhSP()}" style="height:300px; margin-left: 25px;"></a>
						<p style="text-align: center">${item.getTenSP()}</p>
						<p style="text-align: center; color: red;">
							<strong>${giaNB} VNĐ</strong>
						</p>
						<form action="" method="post">
							<center>
								<button class="btn btn-primary"
									formaction="ThemVaoGioindex?id=${item.getIdSP()}"><s:message code="lo.mn.addCart" /></button>
						</form>
						</center>
						<br>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<section class="section-1">
	<div class="container">
		<p></p>
		<h3 style="text-align: center"><s:message code="lo.mn.Gnam" /></h3>
		<div class="row">
			<c:forEach var="item" items="${spNam.content}">
				<div class="col-md-3 col-sm-12 mb-4">
					<div class="card">
						<a href="/sp?id=${item.getIdSP()}"><img class="card-img-top"
							src="images/${item.getHinhSP()}" style="height:300px; margin-left: 25px;"></a>
						<p style="text-align: center">${item.getTenSP()}</p>
						<p style="text-align: center; color: red;">
							<strong>${giaNam} VNĐ</strong>
						</p>
						<form action="" method="post">
							<center>
								<button class="btn btn-primary mb-4"
									formaction="?id=${item.getIdSP()}"><s:message code="lo.mn.addCart" /></button>
						</form>
						</center>
					</div>
				</div>
			</c:forEach>

		</div>

		<!----Hiển Thị Thêm--->
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-1">
					<div class="input-group">
						<a href="/Nam?loai=true"><button class="btn btn-secondary">More...</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section-2">
	<div class="container">
		<p></p>
		<h3 style="text-align: center"><s:message code="lo.mn.Gnu" /></h3>
		<div class="row">
			<c:forEach var="item" items="${spNu.content}">
				<div class="col-md-3 col-sm-12 mb-4">
					<div class="card">
						<a href="/sp?id=${item.getIdSP()}"><img class="card-img-top"
							src="images/${item.getHinhSP()}" style="height:300px; margin-left: 25px;"></a>
						<p style="text-align: center">${item.getTenSP()}</p>
						<p style="text-align: center; color: red;">
							<strong>${giaNu} VNĐ</strong>
						</p>
						<form action="" method="post">
							<center>
								<button class="btn btn-primary"
									formaction="?id=${item.getIdSP()}"><s:message code="lo.mn.addCart" /></button>
						</form>
						</center>
						<br>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-1">
					<div class="input-group">
						<a href="/Nam?loai=true"><button class="btn btn-secondary">More...</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
