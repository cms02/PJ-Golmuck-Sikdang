package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.MemberDto;

import static common.JDBCTemplate.*;

public class MemberDao{
	
	//INSERT MEMBER
	public int insert(MemberDto member, Connection con) {
		int res = 0;
		PreparedStatement pstm = null;
		String sql = " INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL,?,?,?,?,?,?,?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, member.getMid());
			pstm.setString(2, member.getMpw());
			pstm.setString(3, member.getMname());
			pstm.setString(4, member.getPhone());
			pstm.setInt(5, member.getAge());
			pstm.setString(6, member.getGender());
			pstm.setString(7, member.getResidence());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insert member 부분 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return res;
	}
	
	//SELECTONE MEMBER
	public MemberDto selectOne(int mno,Connection con) {
		MemberDto dto = new MemberDto();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM WHERE MNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, mno);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDto(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8)
						);
			}
		} catch (SQLException e) {
			System.out.println("member selectOne 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return dto;
	}

	
	
	
}
