package join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import join.MemberDTO;

public class MemberDAO {
  private Connection conn;

  public MemberDAO(Connection conn) {
    this.conn = conn;
  }

  public int insertData(MemberDTO dto) {
    int result = 0;
    PreparedStatement pstmt = null;
    String sql;
    try {
      sql = "insert into member(id,pass,name,";
      sql += "gender,address,email) values(?,?,?,?,?,?)";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getPass());
      pstmt.setString(3, dto.getName());
      pstmt.setString(4, dto.getGender());
      pstmt.setString(5, dto.getAddress());
      pstmt.setString(6, dto.getEmail());

      result = pstmt.executeUpdate();
      pstmt.close();
    } catch(Exception e) {
      System.out.println(e.toString());
    }
    return result;
  }

  public MemberDTO getReadData(String id) {
    MemberDTO dto = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;
    try {
      sql = "select id,pass,name,gender,address,email";
      sql += "from member where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()) {
        dto = new MemberDTO();
        dto.setId(rs.getString("id"));
        dto.setPass(rs.getString("pass"));
        dto.setName(rs.getString("name"));
        dto.setGender(rs.getString("gender"));
        dto.setAddress(rs.getString("address"));
        dto.setEmail(rs.getString("Email"));
      }
      rs.close();
      pstmt.close();
    } catch(Exception e) {
      System.out.println(e.toString());
    }
    return dto;
  }

  public int updateData(MemberDTO dto){
	  int result = 0;
	  PreparedStatement pstmt = null;
	  String sql;
	  try {
		  sql = "update member set id=?, pass=?, emial=? ";
		  sql+= "where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
	    pstmt.setString(2, dto.getPass());
		  pstmt.setString(3, dto.getEmail());
      result = pstmt.executeUpdate();
      pstmt.close();
    } catch (Exception e) {
      System.out.println(e.toString());
    }
    return result;
  }
}
