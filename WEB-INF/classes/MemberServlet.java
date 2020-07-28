package join;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import join.MemberDAO;
import join.MemberDTO;

public class MemberServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  protected void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Connection conn = DBCPConn.getConnection();
    MemberDAO dao = new MemberDAO(conn);
    String cp = request.getContextPath();
    String uri = request.getRequestURI();
    String url;

    if(uri.indexOf("created.do")!=-1){
  	  url = "/comments.jsp";
  	  forward(request, response, url);
    }
    else if(uri.indexOf("create_ok.do")!=-1) {
      MemberDTO dto = new MemberDTO();
      dto.setId(request.getParameter("id"));
      dto.setPass(request.getParameter("pass"));
      dto.setName(request.getParameter("name"));
      dto.setGender(request.getParameter("gender"));
      dto.setAddress(request.getParameter("address"));
      dto.setEmail(request.getParameter("email"));
      dao.insertData(dto);
      url = "/login.jsp";
      response.sendRedirect(url);
    }
  }
}
