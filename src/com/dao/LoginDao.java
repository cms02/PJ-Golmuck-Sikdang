package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.MemberDto;

public class LoginDao {

	public MemberDto login(String id, String pw, Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		String sql = " SELECT * FROM MEMBER WHERE M_ID=? AND M_PW=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			System.out.println("03. query 준비 "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setMno(rs.getInt(1));
				res.setMid(rs.getString(2));
				res.setMpw(rs.getString(3));
				res.setMname(rs.getString(4));
				res.setPhone(rs.getString(5));
				res.setAge(rs.getInt(6));
				res.setGender(rs.getString(7));
				res.setResidence(rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return res;
	}
	

	public MemberDto selectUser(String mid,Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		String sql = "SELECT * FROM MEMBER WHERE M_ID=? "; 
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mid);
			System.out.println("03. query 준비 : "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = new MemberDto(
				rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
				rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return res;
	}


	public String idChk(String mid,Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		String sql = " SELECT * FROM MEMBER WHERE M_ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mid);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res = rs.getString(2);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return res;
	}
	
	
	public int insertUser(MemberDto dto,Connection con) {
		int res = 0;
		PreparedStatement pstm = null;
		String sql = " INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL,?,?,?,?,?,?,?) ";
		
		try {
			System.out.println(dto.toString());
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMid());
			pstm.setString(2, dto.getMpw());
			pstm.setString(3, dto.getMname());
			pstm.setString(4, dto.getPhone());
			pstm.setInt(5, dto.getAge());
			pstm.setString(6, dto.getGender());
			pstm.setString(7, dto.getResidence());

			res = pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return res;
	}



	public MemberDto sidchk(int i, Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto dto = null;
		String sql = " SELECT * FROM MEMBER WHERE M_ID = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, i);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return dto;
	}


	public int insertSNSUser(Connection con, MemberDto kdto, String sql) {
		PreparedStatement pstm  = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, kdto.getMid());
			pstm.setString(2, kdto.getMname());
			pstm.setInt(3, kdto.getAge());
			pstm.setString(4, kdto.getGender());
			
			res = pstm.executeUpdate();
			System.out.println("res : " + res);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return res;
	}
	
}
