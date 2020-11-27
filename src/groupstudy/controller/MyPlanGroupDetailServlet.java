package groupstudy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.service.GroupStudyService;
import groupstudy.model.vo.GroupStudyRoom;

/**
 * Servlet implementation class MyPlanGroupDetailServlet
 */
@WebServlet(name = "MyPlanGroupDetail", urlPatterns = { "/myPlanGroupDetail" })
public class MyPlanGroupDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPlanGroupDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		
		//groupList.jsp에서 선택한 그룹스터디의 상세페이지를 보여주기위한 정보
		GroupStudyRoom gsr = new GroupStudyService().selectGroupStudyOne(groupNo);
		//인원수 가져오기
		int memberCnt = new GroupStudyService().selectMemberNo(groupNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/myplan/myPlanGroupDetail.jsp");
		
		request.setAttribute("gsr", gsr);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("memberCnt", memberCnt);
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
