<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

		<p></p>
		<h3 style="text-align: center"><s:message code="lo.mn.Genuineshoes" /></h3>
					<p style="text-align: center"><s:message code="lo.mn.camket" /></p>
						<img src="images/Capture.png" width="100%" height="200px">;
		<section>
				<div class="container">
				
						
						<div class="row">
						<c:forEach var="item" items="${sp.content}">
						     <div class="col-md-3 col-sm-12 mb-4">
								<div class="card">
									<a href="/sp?id=${item.getIdSP()}"><img class="card-img-top" src="images/${item.getHinhSP()}" style="height:300px; margin-left: 25px;"></a>
									<p style="text-align: center">${item.getTenSP()}</p>
									<p style="text-align: center;color:red;"><strong>${gia} VNĐ</strong></p>
									<form action="" method="post">
									<center><button class="btn btn-primary mb-4" formaction="themVaoGioNam?id=${item.getIdSP()}"><s:message code="lo.mn.addCart" /></button></form></center>
								</div>
							</div>
						</c:forEach>
							
							</div>
					
				
					<div class="text-center">
       <a class="snip1582" href="/Nam?p">First</a>
    
     
         <a class="snip1582" href="/Nam?p=${sp.number-1}">Previous</a>
    
    
            <a class="snip1582" href="/Nam?p=${sp.number+1}">Next</a>
            <a class="snip1582" href="/Nam?p=${sp.totalPages-1}">Last</a>
    
</div>
				</div>				
			</section>	
		
				