<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

    <div class="container col-md-4 offset-md-4 mt-2 mb-5">
   		<form:form action="/admin/thuonghieu/add" method="POST" modelAttribute="thuonghieu">
   			<div class="mb-3 mt-3">
				<label class="form-label fw-bold">ID</label><br>
					<form:input class="form-control" type="text" path="id"  />
				</div>
			<div class="mb-1 mt-3">
				<label class="form-label fw-bold">Tên thương hiệu</label><br>
				<form:input class="form-control" type="text" path="name"/><br>
			</div>
			<div class="mb-2"> 		
				<button class="btn btn-success">THÊM</button>
				<button class="btn btn-primary" class="btn btn-primary" formaction="/admin/thuonghieu/update?idTh=${name}">SỬA</button>
				<button class="btn btn-danger" formaction="/admin/thuonghieu/delete?idTh=${name}">XÓA</button>
				<a class="btn btn-warning" href="/admin/thuonghieu">RESET</a>
			</div>
		</form:form>
   	</div>
   	<div class="container">
		<table class="table table-light mx-auto">
		  <thead class="table-dark">
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">TÊN THƯƠNG HIỆU</th>
			       <th scope="col"></th>
			    </tr>
		  </thead>
		  <tbody>
			    <c:forEach var="sp" items="${sp.content}">
			    <tr>
			      <th scope="row">${sp.id}</th>
			      <td>${sp.name}</td>
			    
			      <td><a href="/admin/thuonghieu/edit?id=${sp.id}"><i class="bi bi-pencil-square text-dark"></i></a></td>
			    </tr>
			    </c:forEach>
		  </tbody>
		</table>
	</div>
    <center>
       <a class="snip1582" href="/admin/thuonghieu?p=0">First</a>
       <a class="snip1582" href="/admin/thuonghieu?p=${sp.number-1}">Previous</a>
       <a class="snip1582" href="/admin/thuonghieu?p=${sp.number+1}">Next</a>
       <a class="snip1582" href="/admin/thuonghieu?p=${sp.totalPages-1}">Last</a>
	</center>
    
      
	