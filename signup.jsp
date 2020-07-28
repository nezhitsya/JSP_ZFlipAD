<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="join.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
  request.setCharacterEncoding("utf-8");
  String cp = request.getContextPath();
%>
<jsp:useBean id="member" class="join.MemberDTO" scope="page"/>
<jsp:setProperty name="member" property="id"/>
<jsp:setProperty name="member" property="pass"/>
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="gender"/>
<jsp:setProperty name="member" property="email"/>
<jsp:setProperty name="member" property="address"/>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<title>Singup</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<script type="text/javascript">
  function sendIt() {
    var f = document.myForm;
    f.action = "<%=cp%>/login.jsp";
    f.submit();
  }
</script>
</head>
<body>
  <div class="wrapper fadeInDown">
    <div id="formContent">
    <div class="fadeIn first" ><br><br>
      <a href="index.html"><img src="img/logo-dark.png" id="icon" alt="User Icon" /></a><br><br><br>
    </div>
<div class="container">
  <form method="post" action="login.jsp" name="myForm">
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputName">Name</label>
        <input type="text" class="form-control" id="inputAddress" name="name" placeholder="name">
      </div>
      <div class="form-group col-md-6">
        <label for="inputPassword4">Password</label>
        <input type="password" class="form-control" id="inputPassword4" name="pass" placeholder="****">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" name="id" placeholder="email">
    </div>
    <div class="form-group row">
      <div class="col-sm-2">Mail Reception</div>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="gridCheck1">
          <label class="form-check-label" for="gridCheck1">
            메일 수신에 동의합니다.
          </label>
        </div>
      </div>
    </div>
    <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="gender1" value="Female" checked>
          <label class="form-check-label" for="gender1">
            Female
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="gender2" value="Male">
          <label class="form-check-label" for="gender2">
            Male
          </label>
        </div>
      </div>
    </div>
  </fieldset>
    <div class="form-group">
      <label for="inputAddress2">Address</label>
      <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" name="address">
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputCity">City</label>
        <input type="text" class="form-control" id="inputCity">
      </div>
      <div class="form-group col-md-4">
        <label for="inputState">Nation</label>
        <select id="inputState" class="form-control">
          <option selected>Korea</option>
          <option>USA</option>
          <option>Australia</option>
          <option>Brazil</option>
          <option>Turkey</option>
          <option>Spain</option>
          <option>Russia</option>
          <option>Portugal</option>
          <option>Italy</option>
        </select>
      </div>
      <div class="form-group col-md-2">
        <label for="inputZip">Zip</label>
        <input type="text" class="form-control" id="inputZip">
      </div>
    </div>

    <button type="submit" class="btn btn-primary">Sign in</button>
  </form>
</div>
</body>
</html>
