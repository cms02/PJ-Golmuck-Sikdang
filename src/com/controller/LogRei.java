package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.biz.MyBiz;
import com.dto.MemberDto;

@WebServlet("/logRei.do")
public class LogRei extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogRei() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cd = request.getParameter("cd").trim();

		if (cd.equals("login")) {
			MemberDto dto = (MemberDto) request.getAttribute("dto");
			System.out.println("id : " + dto.getMid());
			System.out.println("pw : " + dto.getMpw());
			String id = dto.getMid();
			String pw = dto.getMpw();

			MemberDto chkdto = MyBiz.login(id, pw);
			// chkdto가 있는 경우 실행하겠다

			if (chkdto.getMid() != null) {
				// 로그인 성공
				HttpSession session = request.getSession(true);
				System.out.println("로그인 성공");
				System.out.println(chkdto.getMname());
				session.setAttribute("rdto", chkdto);
				PrintWriter out = response.getWriter();
				out.println(
						"<script type='text/javascript'> window.opener.location= 'golmuck.do?cd=main'; self.close(); </script>");

			} else {
				System.out.println("로그인 실패");
				PrintWriter out = response.getWriter();
				out.println(
						"<script> alert('로그인 실패하셨습니다. 다시입력해주세요.'); location.href='login_regist_form.jsp'; document.getElementById('iid').focus(); </script>");
			}

		} else if (cd.equals("logout")) {

			request.getSession().invalidate();
			response.sendRedirect("golmuck.do?cd=main");
			// regist부분에서 submit 눌렀을 때
		} else if (cd.equals("register")) {
			MemberDto dto = (MemberDto) request.getAttribute("dto");

			String mid = dto.getMid();
			// 기존 고객있는지 재확인
			MemberDto origindto = MyBiz.selectUser(mid);

			if (origindto == null) {

				// db 삽입
				boolean insertchk = MyBiz.insertUser(dto);

				if (insertchk) {
					PrintWriter out = response.getWriter();
					out.println("<script> alert('가입 축하합니다.'); location.href='login_regist_form.jsp';</script>");
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script> alert('가입 실패.'); location.href='login_regist_form.jsp'; </script>");
				}
			}

			// id중복여부 체크부분
		} else if (cd.equals("idchk")) {

			String id = (String) request.getAttribute("mid");

			String res = MyBiz.idChk(id);

			boolean idnotused = true;

			if (res != null) {
				idnotused = false;
			}

			System.out.println("res : " + res);
			System.out.println("idnotused : " + idnotused);

			JSONObject obj = new JSONObject();
			obj.put("idnotused", idnotused);

			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());

			System.out.println("json의 key : value 값  = " + obj.toJSONString());

		} else if (cd.equals("kakaologin")) {
			
			MemberDto kdto = (MemberDto) request.getAttribute("kdto");
			String sql = " INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL,?,'@#$DGCRFHT^%H&',?,'010-1234-1234',?,?,'어딘가') ";

			// kdto안에 id가 존재할 경우(sns계정이 있는 경우)
			if (kdto.getMid() != null) {

				String idres = MyBiz.idChk(kdto.getMid());

				// 기존 테이블에 있는 회원인 경우
				if (idres != null) {
					kdto = MyBiz.selectUser(kdto.getMid());
					System.out.println("sns로그인 성공");
					HttpSession session = request.getSession(true);
					session.setAttribute("rdto", kdto);
					PrintWriter out = response.getWriter();
					out.println(
							"<script type='text/javascript'> window.opener.location='golmuck.do?cd=main'; self.close(); </script>");

					// 기존 테이블에 없는 회원
				} else {

					int res = MyBiz.insertSNSUser(kdto, sql);

					if (res > 0) {
						HttpSession session = request.getSession(true);
						kdto = MyBiz.selectUser(kdto.getMid());
						System.out.println(kdto.getMid() + " : insert 성공 ");
						System.out.println("sns로그인 성공");
						session.setAttribute("rdto", kdto);
						PrintWriter out = response.getWriter();
						out.println(
								"<script type='text/javascript'> window.opener.location= 'golmuck.do?cd=main'; self.close(); </script>");
					} else {
						response.sendRedirect("login_regist_form.jsp");
					}
				}

				// 존재하지않을 경우(계정이 존재하지 않을 경우)
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert(계정이 존재하지않습니다. 다시 확인해주십시요); location.href='login_regist_form.jsp';</script>");
			}

		} else if (cd.equals("naverlogin")) {
			
			MemberDto ndto = (MemberDto) request.getAttribute("ndto");
			String sql = " INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL,?,'ABCD',?,'010-1234-1234',20,'M','어딘가') ";
			if (ndto.getMid() != null) {

				String idres = MyBiz.idChk(ndto.getMid());

				// 기존 테이블에 있는 회원인 경우
				if (idres != null) {
					HttpSession session = request.getSession(true);
					session.setAttribute("rdto", ndto);
					System.out.println("sns로그인 성공");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'> location.href= 'golmuck.do?cd=main'; </script>");

					// 기존 테이블에 없는 회원
				} else {
					int res = MyBiz.insertSNSUser(ndto, sql);

					if (res > 0) {
						HttpSession session = request.getSession(true);
						session.setAttribute("rdto", ndto);
						System.out.println(ndto.getMid() + " insert 성공 ");
						System.out.println("sns로그인 성공");
						PrintWriter out = response.getWriter();
						out.println("<script type='text/javascript'>location.href='golmuck.do?cd=main';</script>");
					} else {
						System.out.println(ndto.getMid() + " insert 실패 ");
						PrintWriter out = response.getWriter();
						out.println("<script type='text/javascript'> location.href= 'golmuck.do?cd=main'; </script>");
					}
				}

				// 존재하지않을 경우(계정이 존재하지 않을 경우)
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert(계정이 존재하지않습니다. 다시 확인해주십시요); location.href='login_regist_form.jsp';</script>");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
