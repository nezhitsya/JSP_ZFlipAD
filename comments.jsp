<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="join.BoardDAO"%>
<%@page import="join.DBCPConn"%>
<%@page import="java.sql.Connection"%>
<%
  request.setCharacterEncoding("utf-8");
  String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="join.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
  Connection conn = DBCPConn.getConnection();
  // BoardDAO dao = new BoardDAO(conn);
  // int maxNum = dao.getMaxNum();
  // dto.setNum(maxNum+1);
  // dao.insertData(dto);
  // DBCPConn.close();
  // response.sendRedirect(article.jsp);
  //dto.setContent(dto.getContent().replaceAll("\n","<br/>"));
%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Comments</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/aos/aos.css" rel="stylesheet">
  <link href="assets/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="assets/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/style.css" rel="stylesheet">

  <script type="text/javascript">
    function sendIt() {
      var f = document.myForm;
      f.action = "<%=cp%>/article.jsp";
      f.submit();
    }
  </script>

</head>

<body>

  <!-- ======= Navbar ======= -->
  <div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li><a href="index.html">Home</a></li>
            <li class="active"><a href="comments.jsp">Comments</a></li>
            <li><a href=login.jsp>Log in</a></li>
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          <div class="tweet d-flex">
            <span class="icofont-twitter text-white mt-2 mr-3"></span>
            <div>
              <p><em>Change the shape of the future. You may notice a crease at the center of the main screen, which is a natural characteristic of the screen. <br></a></em></p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-none d-md-block">
          <h3>Hi There</h3>
          <p>Join us and leave a review. <br> </a></p>
        </div>
      </div>

    </div>
  </div>

  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">Galaxy Z Flip.</a>

      <a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar">
        <span></span>
      </a>

    </div>
  </nav>
  <br><br>
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=dto.getNum()%></td>
        <td><%=dto.getSubject()%></td>
        <td><%=dto.getName()%></td>
        <td><%=dto.getCreated()%></td>
        <td><%=dto.getHitcount()%></td>
      </tr>
    </tbody>
  </table>
  <hr/>
  <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
</div>

  <main id="main">

    <section class="section pb-5">
      <div class="container">

        <div class="row mb-5 align-items-end">
          <div class="col-md-6" data-aos="fade-up">
            <h2>Comments</h2>
            <p class="mb-0">구매 후 평점을 남겨주세요.
            </p>
          </div>

        </div>

        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0" data-aos="fade-up">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">

              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="name">Name</label>
                  <input type="text" name="name" class="form-control" id="name" value="<%=session.getAttribute("name") %>"/>
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <label for="name">Email</label>
                  <input type="email" class="form-control" name="id" id="email" value="<%=session.getAttribute("id") %>"/>
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group">
                  <label for="name">Subject</label>
                  <input type="text" class="form-control" name="subject" id="subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group">
                  <label for="name">Message</label>
                  <textarea class="form-control" name="content" cols="30" rows="10" data-rule="required" data-msg="Please write something for us"></textarea>
                  <div class="validate"></div>
                </div>

                <label for="customRange3">Satisfaction</label>
                <input type="range" class="custom-range" min="0" max="5" step="0.5" id="customRange3">

                <div class="col-md-12 mb-3">
                  <div class="loading">Loading</div>
                  <div class="error-message">Try again!!</div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                </div>

                <div class="col-md-6 form-group">
                  <input type="submit" class="readmore d-block w-100" onclick="sendIt();" value="Submit">
                </div>
              </div>

            </form>

          </div>

          <div class="col-md-4 ml-auto order-2" data-aos="fade-up">
            <ul class="list-unstyled">
              <li class="mb-3">
                <strong class="d-block mb-1">Address</strong>
                <span>경기도 수원시 영통구 매탄동 삼성로 129</span>
              </li>
              <li class="mb-3">
                <strong class="d-block mb-1">Phone</strong>
                <span>080-022-3000</span>
              </li>
              <li class="mb-3">
                <strong class="d-block mb-1">Email</strong>
                <span>ds.recruit@samsung.com</span>
              </li>
            </ul>
          </div>

        </div>

      </div>

    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright Dayeong</p>
          <div class="credits">
            <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
          -->
            Designed by 다영</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-twitter"></span></a>
          <a href="#"><span class="icofont-facebook"></span></a>
          <a href="#"><span class="icofont-dribbble"></span></a>
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/php-email-form/validate.js"></script>
  <script src="assets/aos/aos.js"></script>
  <script src="assets/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/js/comments.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
