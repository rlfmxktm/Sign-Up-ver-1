package jdbc_test;
import java.sql.*;

import javax.swing.JOptionPane;

public class jdbcTest {
   public static void main(String[] args) throws ClassNotFoundException, SQLException {
      String driver = "org.mariadb.jdbc.Driver";
      String url = "jdbc:mysql://localhost:3306/testdb3";
      
      try {
      Class.forName(driver);
      Connection conn = DriverManager.getConnection(url,"java","java");      
      Statement stmt = conn.createStatement();
      String findId = JOptionPane.showInputDialog("아이디검색");
      String sql = "SELECT * FROM member WHERE id='"+findId+"'";

      
      
      //String delsql = "DELETE FROM member WHERE id='tiger'";
      //stmt.executeQuery(delsql);
      
      //String updatesql = "UPDATE member SET level=5 WHERE id='tiger'";
      //stmt.executeQuery(updatesql);
      
      //String insertsql = "INSERT INTO member(id,name,level) VALUES('tiger','호랑이',3)";
      //stmt.executeQuery(insertsql);

    
      
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next()) {
         String no = rs.getString(1);
         String name = rs.getString(2);
         int l = rs.getInt(3);
         System.out.println(no+" "+name+" "+l);
      }
      conn.close();
      }catch(Exception e) {
         System.out.println("접속안됨.");
         //e.printStackTrace();
      }
   }
}