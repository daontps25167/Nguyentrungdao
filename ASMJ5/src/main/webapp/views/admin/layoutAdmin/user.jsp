<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container col-md-4 offset-md-4 mt-2 mb-5">
	<form:form action="/admin/user/add" method="POST" modelAttribute="account">
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Username</label>
			<form:input class="form-control" type="text" path="Username" placeholder="UserName..." />
			<form:errors path="Username" element="span" />
		</div>
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Fullname</label>
			<form:input class="form-control" type="text" path="Fullname" placeholder="Nhập fullname..." />
			<form:errors path="Fullname" element="span" />
		</div>
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Password</label>
			<form:input class="form-control p-3" type="password" path="Password" placeholder="Password" />
			<form:errors path="Password" element="span" />
		</div>
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Phone</label>
			<form:input class="form-control" path="Sdt" type="text" placeholder="SĐT..." />
			<form:errors path="Sdt" element="span" />
		</div>
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Email</label>
			<form:input class="form-control p-3" type="email" path="Email" placeholder="Email" />
			<form:errors path="Email" element="span" />
		</div>
		<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Địa chỉ</label>
			<form:textarea class="form-control" path="diachi" rows="4" cols="50" placeholder="Nhập địa chỉ"></form:textarea>
			<form:errors path="diachi" element="span" />
		</div>
		<div class="mb-3 mt-3">
		<label class="form-label fw-bold">Vai trò</label><br>
			<div class="form-check form-check-inline">
				<form:radiobutton class="form-check-input" path="vaitro" value="true"/>
				<label class="form-check-label">Quản lý</label>
			</div>
			<div class="form-check form-check-inline">
				<form:radiobutton class="form-check-input" path="vaitro" value="false" />
				<label class="form-check-label">Người dùng</label>
			</div>
		</div>
		<div class="mb-3 mt-3">
		<label class="form-label fw-bold">Trạng thái</label><br>
			<div class="form-check form-check-inline">
				<form:radiobutton class="form-check-input"  path="trangthai" value="true"/>
				<label class="form-check-label">Hoạt động</label>
			</div>
			<div class="form-check form-check-inline">
				<form:radiobutton class="form-check-input" path="trangthai" value="false" />
				<label class="form-check-label">Không hoạt động</label>
			</div>
		</div>
		<div class="mb-2">
			<button class="btn btn-success" formaction="/admin/user/add">THÊM</button>
			<button class="btn btn-primary" formaction="/admin/user/update?id=${name}">SỬA</button>
			<button class="btn btn-danger" formaction="/admin/user/clear">LÀM MỚI</button>
		</div>
		${dk}
	</form:form>
</div>
<table class="table table-light mx-auto mb-0">
	<thead class="table-dark">
		<tr>
			<th scope="col">USERNAME</th>
			<th scope="col">HỌ VÀ TÊN</th>
			<th scope="col">PASSWORD</th>

			<th scope="col">SỐ ĐIỆN THOẠI</th>
			<th scope="col">EMAIL</th>
			<th scope="col">ĐỊA CHỈ</th>
			<th scope="col">VAI TRÒ</th>
			<th scope="col">Trạng Thái</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${users}">
			<tr>
				<th scope="row">${item.username}</th>
				<td>${item.fullname}</td>
				<td>${item.password}</td>

				<td>${item.sdt}</td>
				<td>${item.email}</td>
				<td>${item.diachi}</td>
				<td>${item.vaitro}</td>
				<td>${item.trangthai}</td>
				<td><a href="/admin/user/edit?id=${item.username}"><i class="bi bi-pencil-square text-dark"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="text-center mt-2 mb-3">
		<a class="snip1582" href="/admin/sanpham?p=0">First</a> 
		<a class="snip1582" href="/admin/sanpham?p=${sp.number-1}">Previous</a>
		<a class="snip1582" href="/admin/sanpham?p=${sp.number+1}">Next</a> 
		<a class="snip1582" href="/admin/sanpham?p=${sp.totalPages-1}">Last</a>
</div>



