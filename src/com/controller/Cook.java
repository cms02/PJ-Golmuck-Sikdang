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

@WebServlet("/cook.do")
public class Cook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Cook() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String cd = request.getParameter("cd");

		MyBiz biz = new MyBiz();
		System.out.println("cd= " + cd);

		if (cd.equals("cook")) {
			//세션을 가져올때 없다면  null 반환
			HttpSession session = request.getSession(false);
			
			if ((session.getAttribute("rdto") == null || !request.isRequestedSessionIdValid())) {
				// 비회원 노출화면

				// 음식 리스트 받아오기(selectAll)
				List<FoodDto> list = biz.selectAll();

				// System.out.println(list);

				request.setAttribute("list", list);
				dispatch("cook.jsp", request, response);

			} else {
				// 회원 노출화면
				MemberDto mb = (MemberDto) session.getAttribute("rdto");
				// 일반회원

				// 음식 리스트 받아오기(selectAll)
				List<FoodDto> list = biz.selectAll();
				request.setAttribute("list", list);

				// 좋아요 여부에 따른 화면 출력(회원번호 통해 음식번호 받아오기)
				List<PopularityDto> res = biz.popYN(mb.getMno());
				request.setAttribute("popList", res);

				for (int i = 0; i < res.size(); i++) {
					System.out.println("좋아요 fno: " + res.get(i).getFno());
				}
				dispatch("cook.jsp", request, response);
			}
		} else if (cd.equals("detail")) {
			int fno = Integer.parseInt(request.getParameter("fno"));
			System.out.println("fno: " + fno);
			FoodDto dto = biz.selectdetil(fno);

			String[] recipe = dto.getRecipe().split("\\n");
			String[] jaeryo = dto.getIngredients().split("\\n");

			request.setAttribute("jaeryo", jaeryo);
			request.setAttribute("dto", dto);
			request.setAttribute("recipe", recipe);
			dispatch("recipedetail.jsp", request, response);
		}

		/// 7 - 70
		// 8 - 67
		// 9 - 64
		// 10 - 61
		// 11 - 59

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
