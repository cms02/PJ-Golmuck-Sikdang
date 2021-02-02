package com.biz;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.dao.LoginDao;
import com.dao.FoodDao;
import com.dao.MemberDao;
import com.dao.PopularityDao;
import com.dto.FoodDto;
import com.dto.MemberDto;
import com.dto.PopularityDto;

public class MyBiz {

	private MemberDao ddao = new MemberDao();
	private PopularityDao pdao = new PopularityDao();
	private FoodDao fdao = new FoodDao();
	private static LoginDao ldao = new LoginDao();

	// -----------------------------------------------------------------------------

	// --------------------------member-----------------------------------------------

	public int insert(MemberDto member) {
		Connection con = getConnection();
		int res = ddao.insert(member, con);
		if (res > 0) {
			commit(con);
		}
		close(con);
		return res;
	}
	public MemberDto selectOne(int mno) {
		Connection con = getConnection();
		MemberDto dto = ddao.selectOne(mno, con);
		close(con);
		return dto;
	}

	// -------------------------------------------------------------------------------

	// -------------------------------popularity--------------------------------------

	// 연령무관성별무관
	public List<PopularityDto> selectRankAllAll() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRankAllAll(con);
		close(con);
		return list;
	}
	// 연령무관남자만
	public List<PopularityDto> selectRankAllM() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRankAllM(con);
		close(con);
		return list;
	}
	// 연령무관여자만
	public List<PopularityDto> selectRankAllF() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRankAllF(con);
		close(con);

		return list;
	}
	// 연령10대성별무관
	public List<PopularityDto> selectRank10All() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank10All(con);
		close(con);
		return list;
	}
	// 연령10대남자만
	public List<PopularityDto> selectRank10M() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank10M(con);
		close(con);
		return list;
	}
	// 연령10대여자만
	public List<PopularityDto> selectRank10F() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank10F(con);
		close(con);
		return list;
	}
	// 연령20대성별무관
	public List<PopularityDto> selectRank20All() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank20All(con);
		close(con);
		return list;
	}
	// 연령20대남자만
	public List<PopularityDto> selectRank20M() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank20M(con);
		close(con);
		return list;
	}
	// 연령20대여자만
	public List<PopularityDto> selectRank20F() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank20F(con);
		close(con);
		return list;
	}
	// 연령30대성별무관
	public List<PopularityDto> selectRank30All() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank30All(con);
		close(con);
		return list;
	}
	// 연령30대남자만
	public List<PopularityDto> selectRank30M() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank30M(con);
		close(con);
		return list;
	}
	// 연령30대여자만
	public List<PopularityDto> selectRank30F() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank30F(con);
		close(con);
		return list;
	}
	// 연령40대이상성별무관
	public List<PopularityDto> selectRank40All() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank40All(con);
		close(con);
		return list;
	}
	// 연령40대이상남자만
	public List<PopularityDto> selectRank40M() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank40M(con);
		close(con);
		return list;
	}
	// 연령40대이상여자만
	public List<PopularityDto> selectRank40F() {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.selectRank40F(con);
		close(con);
		return list;
	}

	// 좋아요
	public int insert(PopularityDto dto) {
		Connection con = getConnection();
		int res = pdao.insert(dto, con);
		if (res > 0) {
			commit(con);
		}
		close(con);
		return res;
	}

	// 좋아요 취소
	public int delete(int fno, int mno) {
		Connection con = getConnection();
		int res = pdao.delete(fno, mno, con);
		if (res > 0) {
			commit(con);
		}
		close(con);
		return res;
	}

	// 좋아요 여부에 따른 화면 출력
	public List<PopularityDto> popYN(int mno) {
		Connection con = getConnection();
		List<PopularityDto> list = pdao.popYN(mno, con);
		close(con);
		return list;
	}

	// ---------------------------------------------------------------------------------

	// ------------------------------food-----------------------------------------------

	// 나라별 음식 페이지 오픈
	public List<FoodDto> selectAll() {
		Connection con = getConnection();
		List<FoodDto> list = fdao.selectAll(con);
		close(con);
		return list;
	}

	// JOIN - 조리법 받아오기
	public List<FoodDto> getcooking() {
		Connection con = getConnection();
		List<FoodDto> list = fdao.getcooking(con);
		close(con);
		return list;
	}

	// 상세 레시피 페이지 오픈
	public FoodDto selectdetil(int fno) {
		Connection con = getConnection();
		FoodDto dto = fdao.selectdetil(fno, con);
		close(con);
		return dto;
	}

	public List<FoodDto> selectMyList(int[] fnolist) {
	      Connection con = getConnection();
	      List<FoodDto> mylist = fdao.selectMyList(fnolist, con);
	      close(con);
	      return mylist;
	   }
	
	// ------------------------------------------------------------------------------

	// ------------------------------login/regist------------------------------------
	// id체크 Biz
	public static MemberDto selectUser(String mid) {
		Connection con = getConnection();
		MemberDto dto = ldao.selectUser(mid, con);

		try {
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public static String idChk(String id) {

		Connection con = getConnection();
		String res = ldao.idChk(id, con);

		try {
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	// 회원 가입 Biz
	public static boolean insertUser(MemberDto dto) {
		Connection con = getConnection();
		boolean valid = false;

		int res = ldao.insertUser(dto, con);

		if (res > 0) {
			commit(con);
			valid = true;
		}

		try {
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return valid;
	}
	public static MemberDto login(String id, String pw) {
		Connection con = getConnection();
		MemberDto dto = ldao.login(id, pw, con);

		try {
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public static int insertSNSUser(MemberDto kdto, String sql) {
		Connection con = getConnection();
		int res = ldao.insertSNSUser(con, kdto, sql);

		try {
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// ------------------------------------------------------------------------------

}