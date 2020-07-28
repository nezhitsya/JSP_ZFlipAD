package join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import join.MemberDTO;

public class BoardDAO {
  private Connection conn;
  private BoardDAO(Connection conn) {
    this.conn = conn;
  }

  public int getMaxNum() {
    int maxNum = 0;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;

    try {
      sql = "select nvl(max(num), 0) from board";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        maxNum = rs.getInt(1);
      }
      rs.close();
      pstmt.close();
    } catch(Exception e) {
      System.out.println(e.toString());
    }
    return maxNum;
  }

  public int insertData(BoardDTO dto) {
    int result = 0;
    PreparedStatement pstmt = null;
    String sql;
    try {
      sql = "insert into board(num, name, id, subject, content, hitcount, created)";
      sql += "values(?,?,?,?,?,0,sysdate)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, dto.getNum());
      pstmt.setString(2, dto.getName());
      pstmt.setString(3, dto.getId());
      pstmt.setString(4, dto.getSubject());
      pstmt.setString(5, dto.getContent());
      result = pstmt.executeUpdate();
      pstmt.close();
    } catch(Exception e) {
      System.out.println(e.toString());
    }
    return result;
  }

  public int updateHitCount(int num) {
    int result = 0;
    PreparedStatement pstmt = null;
    String sql;
    try {
      sql = "update board set hitcount = hitcount+1";
      sql += "where num=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,num);
      result = pstmt.executeUpdate();
      pstmt.close();
    } catch(Exception e) {
      System.out.println(e.toString());
    }
    return result;
  }
}
