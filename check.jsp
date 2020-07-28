<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/login.css" rel="stylesheet" id="bootstrap-css">
  <% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
  <div class="wrapper fadeInDown">
    <div id="formContent">
    <div class="fadeIn first" ><br><br>
      <a href="index.html"><img src="img/logo-dark.png" id="icon" alt="User Icon" /></a><br><br><br>
    </div>
    <div style="font-size:1.2em">
	<label for="id">아이디는  <%=session.getAttribute("id") %> 입니다.<br><br></label>

<div class="form-group">
	<label for="pass">비밀번호는 <%=session.getAttribute("pass") %> 입니다.<br></label><br>
</div>
	<a class="btn btn-primary" href="login.jsp" role="button">확인</a>
</form>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
</body>
</html>
