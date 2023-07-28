<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<div class="container col-md-4 offset-md-4 mt-2 mb-5">
		<form:form action="/admin/sanpham/add" method="POST"
			modelAttribute="product" enctype="multipart/form-data">
			<div class="mb-3 mt-3">
			<label class="form-label fw-bold">ID sản phẩm</label>
			<form:input class="form-control" type="text" path="idSP" placeholder="0" disabled="true" />
			</div>
			<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Tên sản phẩm</label>
			<form:input class="form-control" type="text" path="TenSP" placeholder="Tên Sản phẩm..." />
			</div>
			<div class="mb-3 mt-3">
			<label class="form-label fw-bold mb-2">Chọn ảnh</label>
			<input class="form-control" type="file" name="file" path="idSP">
			</div>
			<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Thương hiệu</label>
			<select class="form-select" name="thuonghieu">
				<option value="">---Chọn thương hiệu---</option>
				<c:forEach var="th" items="${th}">
					<option value="${th.id}">${th.name}</option>
				</c:forEach>
			</select>
			</div>
			<div class="mb-3 mt-3">
			<label class="form-label fw-bold">Loại</label>
			<select class="form-select" name="loai">
				<option value="">---Chọn loại---</option>
				<option value="true">Nam</option>
				<option value="false">Nữ</option>
			</select>
			</div>
			<div class="row mb-3 mt-3">
				<div class="col-md-5">
						  <label class="form-label fw-bold">Số lượng</label>
						    <form:input class="form-control" type="number" path="sl" />
				 </div>
				 <div class="col-md-7">
					 	<label class="form-label fw-bold">Giá</label>
						<form:input class="form-control" type="number" path="gia" placeholder="Giá..." />
				 </div>
			</div>		
			<div class="mt-3 mb-2" style="margin-left: 120px;">
				<button class="btn btn-success">THÊM</button>
				<button class="btn btn-primary" formaction="/admin/sanpham/update?id=${name}">SỬA</button>
				<button class="btn btn-danger" formaction="/admin/sanpham/delete?id=${name}">XÓA</button>
				<a class="btn btn-warning" href="/admin/sanpham">RESET</a>
			</div>
	 	</form:form>
	</div>
	<table class="table table-light mx-auto">
		<thead class="table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">TÊN SẢN PHẨM</th>
				<th scope="col">HÌNH SẢN PHẨM</th>
				<th scope="col">LOẠI</th>
				<th scope="col">THƯƠNG HIỆU</th>
				<th scope="col">SỐ LƯỢNG</th>
				<th scope="col">GIÁ</th>
				<th scope="col">NGÀY TẠO</th>
				<th scope="col">GHI CHÚ</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="sp" items="${sp.content}">
			<tr>
					<th scope="row">${sp.idSP}</th>
					<td>${sp.tenSP}</td>
					<td>${sp.hinhSP}</td>
					<td>${sp.loai}</td>
					<td>${sp.thuonghieu.id}</td>
					<td>${sp.sl}</td>
					<td>${sp.gia}</td>
					<td>${sp.ngaytao}</td>
					<td>${sp.ghichu}</td>
					<td><a href="/admin/sanpham/edit?id=${sp.idSP}"><i class="bi bi-pencil-square text-dark"></i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center">
		<a class="snip1582" href="/admin/sanpham?p=0">First</a> 
		<a class="snip1582" href="/admin/sanpham?p=${sp.number-1}">Previous</a>
		<a class="snip1582" href="/admin/sanpham?p=${sp.number+1}">Next</a> 
		<a class="snip1582" href="/admin/sanpham?p=${sp.totalPages-1}">Last</a>
	</div>



