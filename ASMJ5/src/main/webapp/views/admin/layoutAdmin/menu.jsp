<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
			<div class="container-fluid">
				<a class="navbar-branch" href="/index">
					<img src="/images/logo.png" style="margin-left: 50px"height="60" width="210">
				</a>
					<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarResponsive">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
					<ul class="navbar-nav">
						
						<li class="nav-item">
							<a class="nav-link " href="/admin/sanpham">SẢN PHẨM</a>
						</li>
						<li class="nav-item">
							<a class="nav-link " href="/admin/thuonghieu">THƯƠNG HIỆU</a>
						</li>
						<li class="nav-item">
							<a class="nav-link " href="/admin/user">NGƯỜI DÙNG</a>
						</li>
						<li class="nav-item" style="padding-right: 10px;">
							<a class="nav-link " href="/admin/thongke">THỐNG KÊ</a>
						</li>
						
						<li>
							<div class="dropdown fw-bold">
    							<c:choose>
				             <c:when test="${empty sessionScope.user}">
				                <a style="border-color: #EEEEEE; background-color: #EEEEEE;text-decoration:none;" class="dropdown-toggle"  data-toggle="dropdown">Xin chào, Bạn</a>
				             </c:when>
				             <c:otherwise>
				                 <a style="border-color: #EEEEEE; background-color: #EEEEEE;text-decoration:none;" class="dropdown-toggle"  data-toggle="dropdown">Xin chào, ${sessionScope.user.username}</a>
				             </c:otherwise>
				          </c:choose>
    					<ul class="dropdown-menu">
    					 <c:choose>
    					<c:when test="${empty sessionScope.user}">
    					      <li><a class="nav-link " href="/login">Đăng nhập</a></li>
      						<li><a class="nav-link " href="/registration">Đăng ký</a></li>
     						<li><a class="nav-link " href="/forgotPassword">Quên mật khẩu</a></li>
    					</c:when>
    					<c:otherwise>
    					    <li><a class="nav-link " href="/changePassword">Đổi mật khẩu</a></li>
    					    <li><a class="nav-link " href="/update">Cập nhật tài khoản</a></li>
    					    <hr>
    					    <li><a class="nav-link " href="/login">Đăng xuất</a></li>
    					</c:otherwise>
    					</c:choose>	
   						</ul>
  </div>		
							
						</li>

						
						<li class="nav-item">
            <a class="nav-link" href="/gioHang">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
              </svg>
            </a>
          </li>
					</ul>
				</div>
			</div>
		</nav>