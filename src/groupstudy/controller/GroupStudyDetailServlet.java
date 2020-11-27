package groupstudy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupstudy.model.service.GroupStudyService;
import groupstudy.model.vo.Category;
import groupstudy.model.vo.GroupStudyMember;
import groupstudy.model.vo.GroupStudyRoom;

/**
 * Servlet implementation class GroupStudyDetailServlet
 */
@WebServlet(name = "GroupStudyDetail", urlPatterns = { "/groupStudyDetail" })
public class GroupStudyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupStudyDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		GroupStudyRoom gsr = new GroupStudyService().selectGroupStudyOne(groupNo);
		
		if(gsr==null) {//gsr을 가져오는데 실패했을 경우
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "선택하신 스터디정보를 불러오는데 실패했습니다");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}else {//gsr을 가져오는데 성공했을 경우
			int memberCnt = new GroupStudyService().selectMemberNo(groupNo);
			Category category = new GroupStudyService().selectCategory(gsr.getCategoryNo());//상단쯤에 카테고리도 써줘야함
			//스터디상세보기 페이지로 이동
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/studysearch/groupStudyDetail.jsp");
			request.setAttribute("memberCnt", memberCnt);
			request.setAttribute("gsr", gsr);
			request.setAttribute("category", category);
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
