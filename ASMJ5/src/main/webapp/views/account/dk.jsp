<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Đăng ký</title>
<style>
.container {
  width: 40%;
  margin: auto;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  margin-bottom: 20px;
  margin-top: 20px;
}

input[type="text"],
input[type="password"],
textarea {
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
  text-decoration: none;
}

.button:hover {
  background-color: #45a049;
  color: white;
}

[id$=".errors"],
p {
  color: red;
  font-style: italic;
  border-radius: 5px;
  padding: 2px;
  margin: 2px;
  display: inline-block;
}
</style>
</head>
<body>
<div class="container">
  <p>${dk }</p>
  <center>
    <h2 style="color: red;">ĐĂNG KÝ</h2>
  </center>

  <form:form action="/registration" method="post" enctype="multipart/form-data" modelAttribute="account">
    <form:errors path="Username" element="span" /><br>
    <p>${user}</p>
    <form:input type="text" path="Username" placeholder="UserName..." />
    <br>
    <form:errors path="Password" element="span" />
    <form:input type="password" path="Password" placeholder="Password..." />
    <p>${loiPass}</p>
    <form:input type="password" path="" value="${passNL}" name="password2" placeholder="Nhập lại Password..." />

    <form:errors path="Fullname" element="span" /><br>
    <form:input type="text" path="Fullname" placeholder="Nhập fullname..." />
    <p>${email}</p>
    <p>${otp}</p>
    <form:errors path="Email" element="span" /><br>
    <div class="input-group mb-3">
      <form:input path="Email" type="email" class="form-control" placeholder="Email..." aria-label="Recipient's username" aria-describedby="button-addon2" />
      <button formaction="/DKsendOTP" class="btn btn-outline-secondary" id="button-addon2">Gửi</button>
    </div>

    <p>${maXN}</p>
    <form:input path="" name="maXN" type="text" placeholder="Mã xác nhận..." />
    <p>${sdt}</p>
    <form:errors path="Sdt" element="span" /><br>
    <form:input path="Sdt" type="text" placeholder="SĐT..." />
    <form:errors path="diachi" element="span" /><br>
    <form:textarea path="diachi" rows="5" cols="95" placeholder="Địa chỉ..."></form:textarea>

    <div class="mt-3">
      <a class="button" href="/index">HỦY</a>
      <button class="button">ĐĂNG KÝ</button>
      <button class="button" formaction="/login">ĐĂNG NHẬP</button>
    </div>
  </form:form>
</div>
</body>
</html>