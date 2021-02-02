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

@WebServlet("/mypage.do")
public class MyPage extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public MyPage() {
      super();
   }

   protected void doGet(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      HttpSession session = request.getSession(false);
      MyBiz biz = new MyBiz();
      if (session.getAttribute("rdto") == null
            || !request.isRequestedSessionIdValid()) {
         response.sendRedirect("golmuck.do?cd=main");
      } else {
         // 로그인한 객체 담기
         MemberDto mb = (MemberDto) session.getAttribute("rdto");

         String cd = request.getParameter("cd");
         if (cd.equals("mypage")) {
            // 좋아요를 누른 테이블 불러오기
            int mno = mb.getMno();
            List<PopularityDto> popList = biz.popYN(mno);
            // 좋아요 누른 음식 번호를 배열로 저장
            int[] fnolist = new int[popList.size()];
            for (int i = 0; i < popList.size(); i++) {
               fnolist[i] = popList.get(i).getFno();
            }
            List<FoodDto> myList = biz.selectMyList(fnolist);
            // 좋아요누른 음식번호가 담긴 배열을 전달하면서 메소드 실행
            request.setAttribute("myList", myList);
            dispatch("myPage.jsp", request, response);
         }
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