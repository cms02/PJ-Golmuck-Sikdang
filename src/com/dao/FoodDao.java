package com.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.FoodDto;
public class FoodDao {

   // 전체출력
   public List<FoodDto> selectAll(Connection con) {
      
      PreparedStatement pstm = null;
      ResultSet rs = null;
      List<FoodDto> res = new ArrayList<FoodDto>();
      String sql = "SELECT * FROM FOOD ORDER BY F_NO ASC";
      
      try {
         pstm = con.prepareStatement(sql);
         System.out.println("3. 쿼리준비: "+sql);
         
         rs = pstm.executeQuery();
         System.out.println("4. 쿼리실행");
         
         while(rs.next()) {
            FoodDto tmp = new FoodDto();
            tmp.setFno(rs.getInt(1));
            tmp.setFname(rs.getString(2));
            tmp.setNationid(rs.getString(3));
            tmp.setCookingid(rs.getString(4));
            tmp.setRecipe(rs.getString(5));
            tmp.setIngredients(rs.getString(6));
            tmp.setImgdir(rs.getString(7));
            
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

   public FoodDto selectdetil(int fno,Connection con) {
      PreparedStatement pstm = null;
      ResultSet rs = null;

      FoodDto res = new FoodDto();

      String sql = "SELECT * FROM FOOD WHERE F_NO = ?";

      try {
         pstm = con.prepareStatement(sql);
         pstm.setInt(1, fno);
         System.out.println("03.query 준비: " + sql);

         rs = pstm.executeQuery();
         System.out.println("04 쿼리 실행 및 리턴 ");

         while (rs.next()) {

            res.setFno(rs.getInt(1));
            res.setFname(rs.getString(2));
            res.setNationid(rs.getString(3));
            res.setCookingid(rs.getString(4));
            res.setRecipe(rs.getString(5));
            res.setIngredients(rs.getString(6));
            res.setImgdir(rs.getString(7));

         }

      } catch (SQLException e) {
         System.out.println("3/4 단계 실패");
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstm);
      }

      return res;
   }

   // JOIN - 조리법 받아오기
   public List<FoodDto> getcooking(Connection con) {
      
      PreparedStatement pstm = null;
      ResultSet rs = null;
      List<FoodDto> res = new ArrayList<FoodDto>();
      String sql = "SELECT F_NO, F_NAME, COOKING FROM FOOD JOIN COOKING USING (COOKING_ID)";
      
      try {
         pstm = con.prepareStatement(sql);
         System.out.println("3. 쿼리준비: "+sql);
         
         rs = pstm.executeQuery();
         System.out.println("4. 쿼리실행 및 리턴");
         
         while(rs.next()) {
            FoodDto tmp = new FoodDto();
            tmp.setFno(rs.getInt(1));
            tmp.setFname(rs.getString(2));
            tmp.setCooking(rs.getString(3));
            
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
   
   public List<FoodDto> selectMyList(int[] fnolist, Connection con) {
         List<FoodDto> mylist = new ArrayList<>();
         PreparedStatement pstm = null;
         ResultSet rs = null;
         String sql = " SELECT * FROM FOOD WHERE F_NO=? ";
         try {
            pstm = con.prepareStatement(sql);
            for (int i = 0; i < fnolist.length; i++) {

               pstm.setInt(1, fnolist[i]);
               rs = pstm.executeQuery();
               rs.next();
               FoodDto dto = new FoodDto(rs.getInt(1), rs.getString(2),
                     rs.getString(3), rs.getString(4), rs.getString(5),
                     rs.getString(6), rs.getString(7));
               mylist.add(dto);

            }
         } catch (SQLException e) {
            e.printStackTrace();
         }finally{
        	 close(rs);
        	 close(pstm);
         }

         return mylist;
      }
   
   
   
   
}