package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.biz.MyBiz;
import com.dto.FoodDto;

@WebServlet("/oneclick.do")
public class OneClick extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OneClick() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cd = request.getParameter("cd");
		MyBiz biz = new MyBiz();
		if (cd.equals("oneclick")) {
			int fno = Integer.parseInt(request.getParameter("fno"));
			FoodDto dto = biz.selectdetil(fno);
			request.setAttribute("dto", dto);
			dispatch("selectOne.jsp", request, response);
		}
	}

	private void dispatch(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
