<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

        
<ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Loại</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">THỜI GIAN</a>
  </li>
 
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
      <br>   
        <table class="table table-light mx-auto">
  <thead class="table-dark">
    <tr>
      <th scope="col">THƯƠNG HIỆU</th>
      <th scope="col">TỔNG GIÁ</th>
      <th scope="col">SỐ SẢN PHẨM</th>
      
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${report}">
           <tr>
      <th scope="row">${item.group}</th>
      <td>${item.sum}</td>
      <td>${item.count}</td>
      
    </tr>
    </c:forEach>
   
    
  </tbody>
</table>
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<div class="container col-md-2 offset-md-5 mt-3 mb-3">
        <form action="/report/year" method="post"> 
          <div class="text-center input-group"><select name="date" class="form-select">
          <option>---CHỌN NĂM---</option>
           <c:forEach var="nam" items="${nam}">
               <option value="${nam}">${nam}</option>
           </c:forEach>
         </select>
          <button class="btn btn-secondary">Seach</button>
         </div>
        </form>
        </div>
        <table class="table table-light mx-auto">
  <thead class="table-dark">
    <tr>
      <th scope="col">NGÀY MUA</th>
      <th scope="col">NGƯỜI MUA</th>
      <th scope="col">TỔNG TIỀN</th>
      <th scope="col">TRẠNG THÁI</th>
      
    </tr>
  </thead>
  <tbody>
    <c:forEach var="dh" items="${donhang}">
      <tr>
        <td>${dh.ngaymua}</td>
        <td>${dh.user.fullname}</td>
        <td>${dh.tongtien}</td>
        <td>${dh.trangthai}</td>
      </tr>
    </c:forEach>
   
     
  </tbody>
</table>
  </div>
 
</div>
   	    
   	   
   
    
      
	