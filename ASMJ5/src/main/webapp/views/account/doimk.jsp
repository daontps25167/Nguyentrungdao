<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.container {
    width: 30%;
    margin: auto;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
  	top:60px;
    left :80px;
}
    input[type="text"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}
  input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
 
input[type=submit]:hover {
    background-color: #45a049;
}
.button{
background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
}
.button:hover {
	 background-color: #45a049;
	 color: white;
}
</style>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
</head>
<body>
<br><br><br><br><br>
	<div class="container">
   	<center><h2 style="color: red;">ĐỔI MẬT KHẨU</h2></center>
   	<center><mark>${doiPass}</mark></center>
    <form action="/changePassword" method="post">
      <label>Username</label>
      <input style="margin-top: 10px;" type="text" name="usename" value="${username}" readonly>
        <label>Mật khẩu cũ</label>
        <input style="margin-top: 10px;" type="password" name="passwordCu" value="${passCu}" placeholder="Mật khẩu cũ...">
 		 <label>Mật khẩu mới</label>
        <input style="margin-top: 10px;" type="password" name="passwordMoi"value="${passMoi}" placeholder="Mật khẩu mới...">
      	 <label>Xác nhận mật khẩu</label>
        <input style="margin-top: 10px;" type="password" name="passwordXN"value="${passXN}" placeholder="Xác nhận mật khẩu...">
       	<div style="margin-top: 15px;">
       		<a  class="button" href="/index">HỦY</a>
        	<button class="button">Đổi mật khẩu</button>
       	</div>
    </form>
</div>
</body>
</html>