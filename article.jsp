<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String cp = request.getContextPath();
%>
<%@page import="join.BoardDAO"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<nav class="navbar navbar-expand-lg">
      <a href="index.html"><img src="img/logo-dark.png" id="icon" alt="User Icon" /></a><br><br><br>
    </div>
  </nav>

  <link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="/js/bootstrap.min.js"></script>
<script src="/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%
      // 1. JDBC 드라이버 로딩
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/post";
            String dbUser = "root";
            String dbPass = "1120";
            String query = "select * from member";

            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

            // 3. Statement 생성
            stmt = conn.createStatement();

            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);

            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>
<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h4>Comments</h4>
			<ul class="timeline">
				<li>
					<a><h3></h3><br></a>
					<a class="float-right"><%= rs.getString("created") %></a>
          작성자
            <%= rs.getString("name") %>
          조회수
            <%= rs.getString("hitcount") %>
            <br><br><br><br>

          <h4><%= rs.getString("content") %>
				</li>
			</ul>
		</div>
	</div>
</div>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}

            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
</nav>
