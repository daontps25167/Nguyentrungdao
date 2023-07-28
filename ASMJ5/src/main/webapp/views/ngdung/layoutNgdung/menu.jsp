<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
  <div class="container-fluid">
    <a class="navbar-branch" href="/index">
      <img src="images/logo.png" style="margin-left: 50px" height="60" width="210">
    </a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarResponsive">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
      <div>
        <ul class="navbar-nav">
          <li class="nav-item">
            <div class="dropdown">
              <a style="border-color: #EEEEEE; background-color: #EEEEEE; text-decoration: none;" class="dropdown-toggle" data-toggle="dropdown" href="#">
                <s:message code="lo.mn.thuongHieu" />
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <c:forEach var="th" items="${th}">
                  <li>
                    <a class="nav-link" href="/thuonghieu?ThuongHieu=${th.id}">${th.name}</a>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/Nam?loai=1"><s:message code="lo.mn.nam" /></a>
          </li>
          <li class="nav-item" style="padding-right: 8px;">
            <a class="nav-link" href="/Nu?loai=0"><s:message code="lo.mn.nu" /></a>
          </li>
          <li>
            <div class="dropdown fw-bold">
              <c:choose>
                <c:when test="${empty sessionScope.user}">
                  <a style="border-color: #EEEEEE; background-color: #EEEEEE; text-decoration: none;" class="dropdown-toggle" data-toggle="dropdown">
                    <s:message code="lo.mn.loichaoban" />
                  </a>
                </c:when>
                <c:otherwise>
                  <a style="border-color: #EEEEEE; background-color: #EEEEEE; text-decoration: none;" class="dropdown-toggle" data-toggle="dropdown">
                    <s:message code="lo.mn.loichao" />, ${sessionScope.user.username}
                  </a>
                </c:otherwise>
              </c:choose>
              <ul class="dropdown-menu">
                <c:choose>
                  <c:when test="${empty sessionScope.user}">
                    <li><a class="nav-link" href="/login"><s:message code="lo.mn.login" /></a></li>
                    <li><a class="nav-link" href="/registration"><s:message code="lo.mn.register" /></a></li>
                    <li><a class="nav-link" href="/forgotPassword"><s:message code="lo.mn.Forgotpassword" /></a></li>
                  </c:when>
                  <c:otherwise>
                    <c:if test="${sessionScope.user.vaitro == true}">
                      <li><a class="nav-link" href="/admin/sanpham"><s:message code="lo.mn.managementpage" /></a></li>
                    </c:if>
                    <li><a class="nav-link" href="/changePassword"><s:message code="lo.mn.change" /></a></li>
                    <li><a class="nav-link" href="/update"><s:message code="lo.mn.edit" /></a></li>
                    <hr>
                    <li><a class="nav-link" href="/login"><s:message code="lo.mn.logout" /></a></li>
                  </c:otherwise>
                </c:choose>
              </ul>
            </div>
          </li>
          <li class="nav-item"><a class="nav-link" href="?lg=en">English</a></li>
          <li class="nav-item"><a class="nav-link" href="?lg=vi">Tiếng Việt</a></li>
          <li class="nav-item">
            <a class="nav-link" href="/gioHang">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
                <span class="position-absolute top-10 start-80 translate-middle badge rounded-pill bg-danger">${countGio}</span>
              </svg>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>