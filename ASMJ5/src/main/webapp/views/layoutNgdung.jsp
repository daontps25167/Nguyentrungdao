<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<meta charset="UTF-8">
<title>Sneaker</title>
<link rel="stylesheet" href="css/style.css">
</head>
<style>
.fixed-menu {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 999;
}
</style>
<body>
	<header class="fixed-menu">
		<tiles:insertAttribute name="menu" />
	</header>
	<div class="wraper">
		<tiles:insertAttribute name="slide" />
	</div>
	<content> <tiles:insertAttribute name="body" /> </content>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="bi bi-arrow-up text-white"></i>
	</button>
	<div class="lien-he">
		<h3 style="text-align: center; margin-top: 30px"><s:message code="lo.mn.thuonghieu" /></h3>
		<center>
			<img src="images/thuonghieu.jpg" width="50%">
		</center>
		<img src="images/lienhe.png" width="100%">
	</div>
	<footer style="padding-top: 15px;">
		<tiles:insertAttribute name="footer" />
	</footer>
	<script type="text/javascript" src="js/js.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>
	<script>
		window.addEventListener("scroll", function() {
			var menu = document.querySelector("header");
			var menuOffset = menu.offsetTop;

			if (window.pageYOffset >= menuOffset) {
				menu.classList.add("fixed-menu");
			} else {
				menu.classList.remove("fixed-menu");
			}
		});
	</script>
</body>
</html>