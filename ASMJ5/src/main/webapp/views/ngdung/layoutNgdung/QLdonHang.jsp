<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	    <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="all" data-toggle="tab" href="#All" role="tab" aria-controls="all" aria-selected="true">Tất cả</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="dangGiao" data-toggle="tab" href="#DangGiao" role="tab" aria-controls="dangGiao" aria-selected="false">Đang giao</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="daGiao" data-toggle="tab" href="#DaGiao" role="tab" aria-controls="daGiao" aria-selected="false">Đã giao</a>
  </li>
   <li class="nav-item" role="presentation">
    <a class="nav-link" id="daHuy" data-toggle="tab" href="#DaHuy" role="tab" aria-controls="daHuy" aria-selected="false">Đã hủy</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="All" role="tabpanel" aria-labelledby="all">
        
             
	 <table id="cart" class="table table table-condensed"> 
	   
	  
	   <c:forEach var="dh" items="${donhangALL}">
	         	  <tr> 
	   <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-2">${dh.getFullname()}&ensp; &ensp; &ensp; &ensp; &ensp; &ensp;</div> 
	     <div class="col-sm-10"> 
	     ${dh.getDiachi()}<br>
	     
	     </div> 
	    </div> 
	   </td> 
	   <td data-th="Price">${dh.getNgaymua()}</td> 
	   
	     <td colspan="2" style="color:green;">${dh.getTrangthai()}</td>
	   <td data-th="Subtotal" class="text-center">Tổng số tiền: <span style="color:#FF0000">${dh.getTongtien()}</span></td> 
	   <td>
	     <form action="" method="post">
	           <button formaction="/CTdonHang?id=${dh.getIddonhang()}" class="btn btn-danger">Chi tiết</button>
	            <c:if test="${dh.getTrangthai() =='Đã đặt'}">
	             <button formaction="/QLdonHang?active=1&id=${dh.getIddonhang()}" class="btn btn-danger">HỦY</button>
	        </c:if>
	        <c:if test="${dh.getTrangthai() =='Đã hủy' or dh.getTrangthai() =='Đang giao' or dh.getTrangthai() =='Đã giao'}">
	        <button type="button" class="btn btn-secondary" disabled>HỦY</button>
	            <!-- <button class="btn btn-danger">HỦY</button> -->
	        </c:if>
	     
	        
	      
	     </form>
	   </td>
	   <td></td>
	  </tr> 
	  <tr>
	    <td colspan="5"></td>
	  </tr>
	   </c:forEach>

	
	   
	  
	   
	 </table>
	
  </div>
  <div class="tab-pane fade" id="DangGiao" role="tabpanel" aria-labelledby="dangGiao">
           <table id="cart" class="table table table-condensed"> 
	       <c:forEach var="dh" items="${donhangDangGiao}">
	         	  <tr> 
	   <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-2">${dh.getUser().getFullname()}
	     </a>
	     </div> 
	     <div class="col-sm-10"> 
	     ${dh.getUser().getDiachi()}<br>
	     
	     </div> 
	    </div> 
	   </td> 
	   <td data-th="Price">${dh.getNgaymua()}</td> 
	   
	     <td colspan="2" style="color:green;">${dh.getTrangthai()}</td>
	   <td data-th="Subtotal" class="text-center">Tổng số tiền: <span style="color:#FF0000">${dh.getTongtien()}</span></td> 
	   <td>
	     <form action="" method="post">
	       <c:if test="${dh.getTrangthai() =='Đã đặt'}">
	             <button class="btn btn-danger">HỦY</button>
	        </c:if>
	        <c:if test="${dh.getTrangthai() =='Đã hủy' or dh.getTrangthai() =='Đang giao' or dh.getTrangthai() =='Đã giao'}">
	        <button type="button" class="btn btn-secondary" disabled>HỦY</button>
	            <!-- <button class="btn btn-danger">HỦY</button> -->
	        </c:if>
	     </form>
	   </td>
	   <td></td>
	  </tr> 
	  <tr>
	    <td colspan="5"></td>
	  </tr>
	   </c:forEach>
	  
	 </table>
  </div>
  
    <div class="tab-pane fade" id="DaGiao" role="tabpanel" aria-labelledby="daGiao">
           <table id="cart" class="table table table-condensed"> 
	       <c:forEach var="dh" items="${donhangDaNhan}">
	         	  <tr> 
	   <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-2">${dh.getUser().getFullname()}
	     </a>
	     </div> 
	     <div class="col-sm-10"> 
	     ${dh.getUser().getDiachi()}<br>
	     
	     </div> 
	    </div> 
	   </td> 
	   <td data-th="Price">${dh.getNgaymua()}</td> 
	   
	     <td colspan="2" style="color:green;">${dh.getTrangthai()}</td>
	   <td data-th="Subtotal" class="text-center">Tổng số tiền: <span style="color:#FF0000">${dh.getTongtien()}</span></td> 
	   <td>
	     <form action="" method="post">
	      <c:if test="${dh.getTrangthai() =='Đã đặt'}">
	             <button class="btn btn-danger">HỦY</button>
	        </c:if>
	        <c:if test="${dh.getTrangthai() =='Đã hủy' or dh.getTrangthai() =='Đang giao' or dh.getTrangthai() =='Đã giao'}">
	        <button type="button" class="btn btn-secondary" disabled>HỦY</button>
	            <!-- <button class="btn btn-danger">HỦY</button> -->
	        </c:if>
	     </form>
	   </td>
	   <td></td>
	  </tr> 
	  <tr>
	    <td colspan="5"></td>
	  </tr>
	   </c:forEach>
	  
	 </table>
  </div>
  <div class="tab-pane fade" id="DaHuy" role="tabpanel" aria-labelledby="daHuy">
        <table id="cart" class="table table table-condensed"> 
	   
	  
	   
	 <c:forEach var="dh" items="${donhangDaHuy}">
	         	  <tr> 
	   <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-2">${dh.getUser().getFullname()}
	     </a>
	     </div> 
	     <div class="col-sm-10"> 
	     ${dh.getUser().getDiachi()}<br>
	     
	     </div> 
	    </div> 
	   </td> 
	   <td data-th="Price">${dh.getNgaymua()}</td> 
	   
	     <td colspan="2" style="color:green;">${dh.getTrangthai()}</td>
	   <td data-th="Subtotal" class="text-center">Tổng số tiền: <span style="color:#FF0000">${dh.getTongtien()}</span></td> 
	   <td>
	     <form action="" method="post">
	      <c:if test="${dh.getTrangthai() =='Đã đặt'}">
	             <button class="btn btn-danger">HỦY</button>
	        </c:if>
	        <c:if test="${dh.getTrangthai() =='Đã hủy' or dh.getTrangthai() =='Đang giao' or dh.getTrangthai() =='Đã giao'}">
	        <button type="button" class="btn btn-secondary" disabled>HỦY</button>
	            <!-- <button class="btn btn-danger">HỦY</button> -->
	        </c:if>
	     </form>
	   </td>
	   <td></td>
	  </tr> 
	  <tr>
	    <td colspan="5"></td>
	  </tr>
	   </c:forEach>
	 </table>
  </div>
</div>
	