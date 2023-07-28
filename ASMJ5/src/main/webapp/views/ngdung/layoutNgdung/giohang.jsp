<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

	<div class="container"> 
	 <table id="cart" class="table table-hover table-condensed"> 
	  <thead> 
	   <tr> 
	    <th style="width:50%">Tên sản phẩm</th> 
	    <th style="width:15%">Giá</th> 
	    <th style="width:10%">Số lượng</th> 
	    <th style="width:15%" class="text-center">Thành tiền</th> 
	    <th style="width:10%"> </th> 
	    <th style="width:10%"> </th> 
	    <th style="width:10%"> </th> 
	    <th style="width:10%"> </th> 
	   </tr> 
	  </thead> 
	     
	  <tbody>
	  <c:forEach var="gio" items="${gio}">
	  <tr> 
	    
	          <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-4"><img src="../images/${gio.getProduct().getHinhSP()}" alt="Sản phẩm 1" class="img-responsive" width="150">
	     </div> 
	     <div class="col-sm-8"> 
	      <span>${gio.getProduct().getTenSP()}</span><br>
	     </div> 
	    </div> 
	   </td>
	    <td data-th="Price">${gio.getProduct().getGia()}</td> 
	    <form action="capnhatgioHang" method="post">
	   <td data-th="Quantity">
	       
	           <input name="sl" class="form-control text-center" value="${gio.getSl()}" type="number">
	           
	   
	  
	   </td> 
	   <td data-th="Subtotal" class="text-center">${gio.getThanhtien()}</td> 
	   <td colspan="4"  class="actions" data-th="">
	        <button class="btn btn-danger" style="margin-left:-15px;"  formaction="/xoagioHang?id=${gio.getIdgiohang()}">Xóa</button>
	        <button class="btn btn-secondary" style="float:right;"  formaction="/capnhatgioHang?id=${gio.getIdgiohang()}">Cập nhật</button>
	   
	   </td>
	   </form>
	  </tr> 
	   </c:forEach>
	  </tbody>
		 
		 <tfoot> 
	 
	   <tr> 
	    <td><a href="/index" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
	    </td> 
	    <td colspan="2" class="hidden-xs"></td> 
	    
	    <td colspan="2" class="hidden-xs text-center"><strong>Tổng tiền: <b style="color: red;"> ${tongtien}</b></strong>
	    
	         <a href="/datHang" class="btn btn-primary" >Kiểm tra đơn hàng</a>
	
	    </td> 
		   <td></td>
	   
	   </tr> 
	  </tfoot> 
	 </table>
	</div>
	