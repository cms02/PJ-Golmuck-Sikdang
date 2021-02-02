package com.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.PopularityDto;

public class PopularityDao {

   //나이무관성별무관
      public List<PopularityDto> selectRankAllAll(Connection con) {
         
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO) \"COUNT\", \r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID  AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. AllAll query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      
      
      
      //나이무관남자만

      public List<PopularityDto> selectRankAllM(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(M_GENDER ) DESC ) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_GENDER ='M'\r\n" + 
               "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. AllM query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      
      //나이무관여자만
      public List<PopularityDto> selectRankAllF(Connection con) {
          PreparedStatement pstm = null;
          ResultSet rs = null;
          List<PopularityDto> res = new ArrayList<PopularityDto>();
          
          String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
                "FROM (SELECT F_NO  , COUNT(F_NO) \"COUNT\",\r\n" + 
                "ROW_NUMBER() OVER(ORDER BY COUNT(M_GENDER ) DESC ) \"RANK\"\r\n" + 
                "FROM POPULARITY P\r\n" + 
                "WHERE M_GENDER ='F'\r\n" + 
                "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
                "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
                "ORDER BY \"RANK\" ASC";
          
          try {
             pstm=con.prepareStatement(sql);
             System.out.println("03. AllF query 준비: " + sql);
             
             rs=pstm.executeQuery();
             System.out.println("04.query 실행 및 리턴");
             
             while(rs.next()) {
            	 PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
                res.add(tmp);
             }
          } catch (SQLException e) {
             System.out.println("3/4단계 오류");
             e.printStackTrace();
          } finally {
             close(rs);
             close(pstm);
          }

          return res;
       }
      
      //나이10대성별무관
      public List<PopularityDto> selectRank10All(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
                "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
                "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
                "FROM POPULARITY P\r\n" + 
                "WHERE M_AGE>=10 AND M_AGE <20\r\n" + 
                "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
                "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
                "ORDER BY \"RANK\" ASC";
               
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 10All query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }
         return res;
      }
      
      //나이10대남자만
      
      public List<PopularityDto> selectRank10M(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  ,  COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=10 AND M_AGE <20 AND M_GENDER ='M'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 10M query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이10대여자만
      
      
      public List<PopularityDto> selectRank10F(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
                "FROM (SELECT F_NO  ,  COUNT(F_NO ) \"COUNT\",\r\n" + 
                "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
                "FROM POPULARITY P\r\n" + 
                "WHERE M_AGE>=10 AND M_AGE <20 AND M_GENDER ='F'\r\n" + 
                "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
                "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
                "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 10F query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이20대성별무관
      
      public List<PopularityDto> selectRank20All(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=20 AND M_AGE <30\r\n" + 
               "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 20All query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이20대남자만
      public List<PopularityDto> selectRank20M(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=20 AND M_AGE <30 AND M_GENDER ='M'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 20M query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이20대여자만
      
      public List<PopularityDto> selectRank20F(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR , NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=20 AND M_AGE <30 AND M_GENDER ='F'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 20F query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이30대성별무관
      public List<PopularityDto> selectRank30All(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=30 AND M_AGE <40\r\n" + 
               "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 30All query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이30대남자만
      public List<PopularityDto> selectRank30M(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=30 AND M_AGE <40 AND M_GENDER ='M'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 30M query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이30대여자만
      public List<PopularityDto> selectRank30F(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
                "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
                "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
                "FROM POPULARITY P\r\n" + 
                "WHERE M_AGE>=30 AND M_AGE <40 AND M_GENDER ='F'\r\n" + 
                "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
                "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
                "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 30F query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이40대이상성별무관
      public List<PopularityDto> selectRank40All(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=40\r\n" + 
               "GROUP BY F_NO) A, FOOD ,NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 40All query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      //나이40대이상남자만
      public List<PopularityDto> selectRank40M(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR,NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=40 AND M_GENDER ='M'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 40M query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }
      
      //나이40대이상여자만
      public List<PopularityDto> selectRank40F(Connection con) {
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         
         String sql ="SELECT A.*,F_NAME,IMGDIR , NATION,A.COUNT\r\n" + 
               "FROM (SELECT F_NO  , COUNT(F_NO ) \"COUNT\",\r\n" + 
               "ROW_NUMBER() OVER(ORDER BY COUNT(F_NO ) DESC) \"RANK\"\r\n" + 
               "FROM POPULARITY P\r\n" + 
               "WHERE M_AGE>=40 AND M_GENDER ='F'\r\n" + 
               "GROUP BY F_NO) A, FOOD , NATION\r\n" + 
               "WHERE A.F_NO=FOOD.F_NO AND FOOD.NATION_ID =NATION.NATION_ID AND \"RANK\"<11\r\n" + 
               "ORDER BY \"RANK\" ASC";
         
         try {
            pstm=con.prepareStatement(sql);
            System.out.println("03. 40F query 준비: " + sql);
            
            rs=pstm.executeQuery();
            System.out.println("04.query 실행 및 리턴");
            
            while(rs.next()) {
            	PopularityDto tmp = new PopularityDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
               res.add(tmp);
            }
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }

         return res;
      }

      
      // 좋아요
      public int insert(PopularityDto dto,Connection con) {
         
         PreparedStatement pstm = null;
         int res = 0;
         String sql = "INSERT INTO POPULARITY VALUES(?,?,?,?)";
         
         try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, dto.getFno());
            pstm.setInt(2, dto.getMno());
            pstm.setInt(3, dto.getMage());
            pstm.setString(4, dto.getMgender());
            System.out.println("3. 쿼리준비: "+sql);
            
            res = pstm.executeUpdate();
            System.out.println("4. 쿼리실행 및 리턴");
            
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(pstm);
         }
         
         return res;
      }
      
      
      // 좋아요 취소
      public int delete(int fno, int mno,Connection con) {
         
         PreparedStatement pstm = null;
         int res = 0;
         String sql = "DELETE FROM POPULARITY WHERE F_NO=? AND M_NO=?";
         
         try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, fno);
            pstm.setInt(2, mno);
            System.out.println("3. 쿼리준비: "+sql);
            
            res = pstm.executeUpdate();
            System.out.println("4. 쿼리실행 및 리턴");
            
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(pstm);
         }
         return res;
      }

      
      // 좋아요 여부 확인
      public List<PopularityDto> popYN(int mno,Connection con) {
         
         PreparedStatement pstm = null;
         ResultSet rs = null;
         List<PopularityDto> res = new ArrayList<PopularityDto>();
         String sql = "SELECT * FROM POPULARITY WHERE M_NO=?";
         
         try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, mno);
            System.out.println("3. 쿼리준비: "+sql);
            
            rs = pstm.executeQuery();
            System.out.println("4. 쿼리실행 및 리턴");
            
            while(rs.next()) {
               PopularityDto tmp = new PopularityDto();
               tmp.setFno(rs.getInt(1));
               tmp.setMno(rs.getInt(2));
               tmp.setMage(rs.getInt(3));
               tmp.setMgender(rs.getString(4));
               
               res.add(tmp);
            }
            
         } catch (SQLException e) {
            System.out.println("3/4단계 오류");
            e.printStackTrace();
         } finally {
            close(rs);
            close(pstm);
         }
         
         /*
         회원이 로그인 했을 때 해당 회원번호(mno)로 select해서 fno 반환받기
         이미 인기도 테이블에 있는 음식이면 채운하트, 아니면 빈하트 표시
         fno 반환 여러개 받으니까 list에 넣고 fno(int값)꺼내와서 if문으로 처리
         값은 여기서 꺼내올까 ? 컨트롤러에서 꺼내올까 ? 
         */
         
         return res;
      }

}