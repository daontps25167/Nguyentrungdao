<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

	<p style="color: #FF6600;font-size:larger;"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
            <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
              </svg> Địa Chỉ Nhận Hàng</p>
              <table class="table table table-condensed">
                <tr>
                   <td><b>${user.getFullname()} ${user.getSdt()}</b></td>
                   <td>${user.getDiachi()}</td>
                   
                   <td></td>
                </tr>
              </table>
             
	 <table id="cart" class="table table table-condensed"> 
	  <thead> 
	   <tr> 
	    <th style="width:50%">Tên sản phẩm</th> 
	    <th style="width:15%">Giá</th> 
	    <th style="width:10%">Số lượng</th> 
	    <td></td>
	    <th style="width:15%" class="text-center">Thành tiền</th> 
	     
	   </tr> 
	  </thead> 
	  <tbody>
	     <c:forEach var="item" items="${ctDonhang}">
	  <tr> 
	   <td data-th="Product"> 
	    <div class="row"> 
	     <div class="col-sm-2"><img src="../images/${item.getIdsp().getHinhSP()}" alt="Sản phẩm 1" class="img-responsive" width="50">
	     
	     </div> 
	     <div class="col-sm-10"> 
	     ${item.getIdsp().getTenSP()}
	     </div> 
	    </div> 
	   </td> 
	   <td data-th="Price">${item.getIdsp().getGia()} VNĐ</td> 
	   <td data-th="Quantity">${item.getSl()}
	   </td> 
	     <td></td>
	   <td data-th="Subtotal" class="text-center">${item.getThanhtien()}
	  
	   </td> 
	    
	  </tr> 
	 </c:forEach> 
	
	  </tbody>
		 <tfoot> 
	 
	   <tr> 
	    <td colspan="2"></td> 
	    
	    
	    <td colspan="3">Tổng tiền hàng: ${tongtien} VNĐ<br>
	     
	    </td> 
		   <td></td>
	   
	   </tr> 
	  </tfoot> 
	 </table>
	