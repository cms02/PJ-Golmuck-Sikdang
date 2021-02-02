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

@WebServlet("/nation.do")
public class Nation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Nation() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		MemberDto mb = null;
		String cd = request.getParameter("cd");
		HttpSession session = request.getSession(false);
		MyBiz biz = new MyBiz();
		// 음식 리스트 받아오기(selectAll)
		List<FoodDto> list = biz.selectAll();
		request.setAttribute("list", list);
		if ((request.getSession(false) != null)) {
			mb = (MemberDto) session.getAttribute("rdto");
		}

		// 세션이 없다면 새로 만들지 않고 null 반환
		if (cd.equals("nation")) {

			if (!(request.getSession(false) == null) && !(session.getAttribute("rdto") == null)) {

				List<PopularityDto> res = biz.popYN(mb.getMno());
				request.setAttribute("popList", res);
				// 음식 리스트 받아오기(selectAll)
				// 비회원 노출화면
				dispatch("nation.jsp", request, response);
			} else {
				dispatch("nation.jsp", request, response);
			}
		} else if (cd.equals("heart_true")) {
			// 회원 노출화면
			// 좋아요 여부에 따른 화면 출력(회원번호 통해 음식번호 받아오기)
			mb = (MemberDto) session.getAttribute("rdto");
			List<PopularityDto> res = biz.popYN(mb.getMno());
			request.setAttribute("popList", res);

			for (int i = 0; i < res.size(); i++) {
				System.out.println("좋아요 fno: " + res.get(i).getFno());
			}
			dispatch("nation.jsp", request, response);
			// 좋아요
			System.out.println("좋아요 회원번호: " + mb.getMno());
			System.out.println("좋아요 회원나이: " + mb.getAge());
			System.out.println("좋아요 회원성별: " + mb.getGender());

			int fno = Integer.parseInt(request.getParameter("fno"));
			System.out.println(cd + " 좋아요 클릭!!!!!!! fno:" + fno + "\n");

			PopularityDto dto = new PopularityDto(fno, mb.getMno(), mb.getAge(), mb.getGender());
			biz.insert(dto);

		} else if (cd.equals("heart_false")) {
			// 좋아요 취소
			System.out.println("좋아요취소 회원번호: " + mb.getMno());
			System.out.println("좋아요취소 회원나이: " + mb.getAge());
			System.out.println("좋아요취소 회원성별: " + mb.getGender());

			int fno = Integer.parseInt(request.getParameter("fno"));
			System.out.println(cd + " 좋아요 취소!!!!!!! fno:" + fno + "\n");
			biz.delete(fno, mb.getMno());
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