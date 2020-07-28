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
import join.BoardDAO;
import join.BoardDTO;

protected void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
  RequestDispatcher dispatcher = request.getRequestDispatcher(url);
  dispatcher.forward(request, response);
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doPost(request, response);
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  requst.setChatacterEncoding("utf-8");
  String cp = request.getContextPath();
  Connection conn = DBCPConn.getConnection();
  BoardDAO dao = new BoardDAO(conn);
  MyUtil myutil = new MyUtil();
  String uri = request.getRequestURI();
  String url;
  if(uri.indexOf("created.do")!=-1) {
    url = "/comments.jsp";
    forward(request, response, url);
  } else if(uri.indexOf("created_ok.do")!=-1) {
    BoardDTO dto = new BoardDTO();
    int maxNum = dao.getMaxNum();
    dto.setNum(maxNum+1);
    dto.setSubject(request.getParameter("subject"));
    dto.setName(request.getParameter("name"));
    dto.setSubject(request.getParameter("subject"));
    dto.setDate(Date());
    dto.setContent(request.getParameter("content"));
    dao.insertData(dto);
    url = cp+"/join/list.do";
    response.sendRedirect(url);
  }
  else if(uri.indexOf("list.do")!=-1) {
    String pageNum = request.getParameter("pageNum");
    int currentPage = 1;
    if(pageNum!=null) {
      currentPage = integer.parseInt(pageNum);
    }
  }
  int numPerPage = 10;
  int totalPage = myUtil.getPageCount(numPerPage, dataCount);
  if(currentPage>totalPage)
    currentPage = totalPage;
  int start = (currentPage-1)*numPerPage+1;
  int end = currentPage*numPerPage;
  List<BoardDTO> lists = dao.getLists(start, end);
  String param = "";
  if(uri.indexOf("article.do")!=-1) {
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    dao.updateHitCount(num);
    BoardDTO dto = dao.getReadData(num);
    int lineSu = dto.getContent().split("\n").length;
    dto.setContent(dto.getContent().replaceAll("\n","<br/>"));
    request.setAttribute("dto", dto);
    request.setAttribute("params", param);
    request.setAttribute("lineSu", lineSu);
    url = "/article.jsp";
    forward(request, response, url);
  }
}
