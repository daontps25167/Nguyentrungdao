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
  input[type="email"] {
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
<title>Cập nhật tài khoản</title>
</head>
<body>
 <br><br><br><br><br>
	<div class="container">
   	<center><h2 style="color: red;">CẬP NHẬT TÀI KHOẢN</h2></center>
   	<center><mark style="background-color: #f2f2f2;">${capNhat}</mark></center>
    <form action="/update" method="POST">
      <label>Username</label>
      <input style="margin-top: 10px;" type="text" name="usename" value="${User.getUsername()}" readonly>
        <label>Mật khẩu</label>
        <input style="margin-top: 10px;" type="text" name="password" value="${User.getPassword()}" placeholder="Mật khẩu...">
 		 <label>Email</label>
        <input style="margin-top: 10px;" type="email" name="email" value="${User.getEmail()}" placeholder="Email...">
      	 <label>Fullname</label>
        <input style="margin-top: 10px;" type="text" name="fullname" value="${User.getFullname()}" placeholder="FullName...">
        <label>Số điện thoại</label>
        <input style="margin-top: 10px;" type="text" name="sdt" value="${User.getSdt()}" placeholder="Số điện thoại...">
        <label>Địa chỉ</label>
        <textarea style="margin-top: 10px; padding: 7px; font-size: 16px; border-radius: 4px;" name="diachi" rows="4" cols="60" placeholder="Địa chỉ...">${User.getDiachi()}</textarea>
        <div style="margin-top: 15px;">
        	<a class="button" href="/index">HỦY</a>
	        <button class="button">Cập nhật</button>
	        <button class="button" formaction="/login">Đăng nhập</button>
        </div>
    </form>
   

</div>
</body>
</html>