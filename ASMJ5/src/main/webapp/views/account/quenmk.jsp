<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.container {
  max-width: 400px;
  margin: auto;
  border-radius: 5px;
  background-color: #fff;
  padding: 20px;
  margin-top: 120px;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
}

.container h2 {
  text-align: center;
  color: red;
  margin-bottom: 20px;
}

.container p {
  text-align: center;
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  font-weight: bold;
}

.form-control {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.input-group {
  margin-bottom: 20px;
}

.input-group input[type="email"] {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.input-group-append button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

.btn-primary {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
  transition: background-color 0.3s ease;
}

.btn-primary:hover {
  background-color: #45a049;
}

.btn-secondary {
  background-color: #f2f2f2;
  color: black;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
  transition: background-color 0.3s ease;
}

.btn-secondary:hover {
  color: white;
  background-color: #333;
}

.link {
  text-decoration: none;
  color: black;
}

.link:hover {
  text-decoration: none;
  color: orange;
}
</style>
</head>
<body>
  <div class="container">
    <h2>QUÊN MẬT KHẨU</h2>
    <p>${tbforgotPassword}</p>
    <form action="/forgotPassword" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="username">Tên người dùng</label>
        <input type="text" name="UserName" id="username" class="form-control mt-3" placeholder="Tên người dùng..." value="${username}">
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <div class="input-group">
          <input type="email" name="email" id="email" class="form-control mt-3" placeholder="Email..." value="${email}" aria-label="Recipient's username" aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary mt-3" type="button" id="button-addon2">Gửi</button>
          </div>
      </div>
      <div class="form-group">
        <label for="ma">Nhập mã OTP</label>
        <input type="text" name="ma" id="ma" class="form-control mt-3" placeholder="Nhập mã OTP...">
      </div>
      <a href="/index" class="btn btn-secondary">HỦY</a>
      <button type="submit" class="btn btn-primary mt-3">Lấy lại mật khẩu</button>
    </form>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>