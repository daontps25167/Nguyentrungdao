<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.container {
  width: 28%;
  margin: auto;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  top: 60px;
  left: 20px;
}

input[type="text"],
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

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

.button {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.button:hover {
  color: white;
  background-color: #45a049;
}

a {
  text-decoration: none;
  color: black;
}

a:hover {
  color: blue;
}
</style>
</head>
<body>
<br><br><br><br><br><br><br>
<div class="container">
  <center>
    <h2 style="color: red;">ĐĂNG NHẬP</h2>
  </center>
  <center>
    <mark style="background-color: #f2f2f2;">${dn}</mark>
  </center>

  <form action="/login" method="POST">
    <label>UserName</label>
    <input type="text" name="UserName" placeholder="UserName...">
    <label>Password</label>
    <input type="password" name="password" placeholder="Password...">
    <a href="/forgotPassword">Quên mật khẩu</a>
    <hr style="margin: 10px 0px;">
    <a class="button btn-secondary" href="/index">HỦY</a>
    <button class="button">ĐĂNG NHẬP</button>
    <button class="button" formaction="/registration">ĐĂNG KÝ</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>