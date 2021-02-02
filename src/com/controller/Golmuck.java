package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.MyBiz;
import com.dto.FoodDto;
import com.dto.MemberDto;
import com.dto.PopularityDto;

@WebServlet("/golmuck.do")
public class Golmuck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Golmuck() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cd = request.getParameter("cd");
		System.out.println("Golmuck cd : " + cd);
		if (cd.equals("cook")) {
			response.sendRedirect("cook.do?cd=cook");
		} else if (cd.equals("total")) {
			response.sendRedirect("total.do?cd=total");
		} else if (cd.equals("nation")) {
			response.sendRedirect("nation.do?cd=nation");
		} else if (cd.equals("mapSearch")) {
			String keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
			dispatch("mapsms.do?cd=mapSearch", request, response);
		} else if (cd.equals("main")) {
			// 세션을 가져옴 없으면 null 반환
			HttpSession session = request.getSession(false);
			MyBiz biz = new MyBiz();
			List<PopularityDto> list1 = biz.selectRankAllAll();
			request.setAttribute("list1", list1);
			
			if (request.getSession(false) == null) {
				dispatch("main.jsp", request, response);
			} else {
				
				if (!(session.getAttribute("rdto") == null)) {
					// 세션이 있다면

					MemberDto mb = (MemberDto) session.getAttribute("rdto");
					int mno = mb.getMno();
					// 인기도 테이블에서 좋아요 누른 목록 반환
					List<PopularityDto> popList = biz.popYN(mno);
					int[] fnolist = new int[popList.size()];
					for (int i = 0; i < popList.size(); i++) {
						// 좋아요 누른 음식 번호들만 저장
						fnolist[i] = popList.get(i).getFno();
					}
					// FOOD 테이블에서 좋아요 음식 가져오기
					List<FoodDto> myList = biz.selectMyList(fnolist);
					request.setAttribute("myList", myList);
					dispatch("main.jsp", request, response);
					// regist에서 submit눌렀을 때
				} else {
					dispatch("main.jsp", request, response);
				}
			}
		} else if (cd.equals("register")) {

			MemberDto dto = new MemberDto();
			String mid = request.getParameter("id");
			String mpw = request.getParameter("pw");
			String mname = request.getParameter("name");
			String phone = request.getParameter("phone");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("chk");
			String residence1 = request.getParameter("residence1");
			String residence2 = request.getParameter("residence2");
			String residence = residence1.concat((" ").concat(residence2));
			dto.setMid(mid);
			dto.setMpw(mpw);
			dto.setMname(mname);
			dto.setPhone(phone);
			dto.setAge(age);
			dto.setGender(gender);
			dto.setResidence(residence);

			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("logRei.do?cd=register");
			dispatch.forward(request, response);

			// regist에서 idchk하는 부분
		} else if (cd.equals("idchk")) {

			String mid = request.getParameter("id");

			System.out.println("golmuck id : " + mid);

			request.setAttribute("mid", mid);
			RequestDispatcher dispatch = request.getRequestDispatcher("logRei.do?cd=idchk");
			dispatch.forward(request, response);

		} else if (cd.equals("login")) {
			String id = request.getParameter("lid");
			String pw = request.getParameter("lpw");

			MemberDto dto = new MemberDto();
			dto.setMid(id);
			dto.setMpw(pw);

			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("logRei.do?cd=login");
			dispatch.forward(request, response);

		} else if (cd.equals("logout")) {
			response.sendRedirect("logRei.do?cd=logout");

		} else if (cd.equals("kakaologin")) {

			int mno = Integer.parseInt(request.getParameter("id").trim());
			String mid = request.getParameter("email").trim();
			String mname = request.getParameter("name").trim();
			String gender = request.getParameter("gender").trim();
			int age = Integer.parseInt(request.getParameter("age").trim().substring(0, 2));
			if (gender.equals("male")) {
				gender = "M";
			} else {
				gender = "F";
			}
			System.out.println(mno);
			System.out.println(mid);
			System.out.println(mname);
			System.out.println(gender);
			System.out.println(age);

			MemberDto kdto = new MemberDto();
			kdto.setMno(mno);
			kdto.setMid(mid);
			kdto.setMname(mname);
			kdto.setGender(gender);
			kdto.setAge(age);

			request.setAttribute("kdto", kdto);
			dispatch("logRei.do?cd=kakaologin", request, response);

		} else if (cd.equals("naverlogin")) {
			int mno = Integer.parseInt(request.getParameter("id").trim());
			String mid = request.getParameter("email").trim();
			String mname = request.getParameter("name").trim();

			MemberDto ndto = new MemberDto();
			ndto.setMno(mno);
			ndto.setMid(mid);
			ndto.setMname(mname);

			System.out.println("mno : " + mno + ", mid : " + mid + ", mname : " + mname);

			request.setAttribute("ndto", ndto);
			dispatch("logRei.do?cd=naverlogin", request, response);
		} else if (cd.equals("oneclick")) {
			int fno = Integer.parseInt(request.getParameter("fno"));
			dispatch("oneclick.do?cd=oneclick&fno=" + fno, request, response);

		} else if (cd.equals("googlelogin")) {
			int mno = Integer.parseInt(request.getParameter("mno").trim());
			String mid = request.getParameter("mid").trim();
			String mname = request.getParameter("mname").trim();
			MemberDto gdto = new MemberDto();
			gdto.setMno(mno);
			gdto.setMid(mid);
			gdto.setMname(mname);

			request.setAttribute("gdto", gdto);
			dispatch("agegender.jsp", request, response);
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
