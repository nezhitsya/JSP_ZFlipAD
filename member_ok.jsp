<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("email");
	String pass = request.getParameter("password");

  String idid = (String)session.getAttribute("id");
  String passw =(String)session.getAttribute("pass");

	if(id.equals(idid) && pass.equals(passw)){
		session.setAttribute("id",id);
		response.sendRedirect("comments.jsp");
	}else if(id.equals(idid)){
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
	}else if(pass.equals(passw)){
		out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
	}else{
		out.println("<script>alert('아이디와 비밀번호가 틀렸습니다.'); history.back();</script>");
	}
%>
