<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/login.css" rel="stylesheet" id="bootstrap-css"/>
<script type="text/javascript">
  function login() {
    var f = document.myForm;
    f.action = "<%=cp%>/comments.jsp";
    f.submit();
  }
</script>
</head>
<body>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
session.setAttribute("id",id);
session.setAttribute("pass",pass);
session.setAttribute("name",name);
%>
  <div class="wrapper fadeInDown">
    <div id="formContent">
    <div class="fadeIn first" ><br><br>
      <a href="index.html"><img src="img/logo-dark.png" id="icon" alt="User Icon" /></a><br><br><br>
    </div>
  <form method="post" action="member_ok.jsp" name="myForm">
    <div style="font-size:1.2em">
	<label for="id">ID</label><br>
	<input type="email" style="font-size:1em" class="fadeIn second" name="id" id="id" aria-describedby="emailHelp" placeholder="아이디" required /><br>
	<small id="emailHelp" class="form-text text-muted"><font color="gray"> We will never share your email with anyone else.</font> </small><br><br>
<div class="form-group">
	<label for="pass">Password</label><br>
	<input type="password" style="font-size:1em" class="fadeIn third" name="pass" id="pass" placeholder="비밀번호" required />
</div>
<div class="form-group form-check" style="font-size:0.7em">
  <input type="checkbox" class="form-check-input" id="exampleCheck1">
  <label class="form-check-label" for="exampleCheck1">Check me out</label><br><br><br>
</div>
<div style="font-size:0.9em">
	<a href="check.jsp" class="card-link">Forget Password?</a><br><br>
	<input type="submit" class="btn btn-primary" value="Log In" onclick="login();"/>
	<a class="btn btn-secondary" href="signup.jsp" role="button">Sign up</a>
</form>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
</body>
</html>
