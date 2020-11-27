package groupstudy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupstudy.model.service.GroupStudyService;
import groupstudy.model.vo.GroupStudyRoom;

/**
 * Servlet implementation class InsertGroupStudyRoomServlet
 */
@WebServlet(name = "InsertGroupStudyRoom", urlPatterns = { "/insertGroupStudyRoom" })
public class InsertGroupStudyRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGroupStudyRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//categoryNo먼저 받아오기
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		
		int categoryNo = 0;
		
		categoryNo = new GroupStudyService().selectCategoryNo(category1, category2);
		
		if(categoryNo>0) {//가져온 categoryNo을 포함해서 스터디그룹방 생성(insert)
			GroupStudyRoom gsr = new GroupStudyRoom();
			gsr.setCategoryNo(categoryNo);
			gsr.setGroupContent(request.getParameter("groupContent"));
			gsr.setGroupEndDate(request.getParameter("groupEndDate"));
			gsr.setGroupExplan(request.getParameter("groupExplan"));
			gsr.setGroupManagerNo(Integer.parseInt(request.getParameter("groupManagerNo")));
			gsr.setGroupPersonnel(Integer.parseInt(request.getParameter("groupPersonnel")));
			gsr.setGroupRule(request.getParameter("groupRule"));
			gsr.setGroupStartDate(request.getParameter("groupStartDate"));
			gsr.setGroupTitle(request.getParameter("groupTitle"));
			//db에 저장
			int result = new GroupStudyService().insertGroupStudyRoom(gsr);//하나의 conn으로 처리해야함 insert2개가 중간에 잘못될경우 rollback
			
			if(result>0) {	//insert성공
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				request.setAttribute("msg", "그룹스터디 생성을 완료했습니다");
				request.setAttribute("loc", "/views/groupStudy/groupStudyList.jsp");//스터디찾기 메인으로
				rd.forward(request, response);
			}else {			//insert실패
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				request.setAttribute("msg", "그룹스터디 생성에 실패했습니다.[insert error]");
				request.setAttribute("loc", "/views/groupStudy/groupStudyList.jsp");//스터디찾기 메인으로?
				rd.forward(request, response);
			}
		}else {//categoryNo이 없을경우 에러
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "그룹스터디 생성에 실패했습니다.[not found categoryNo]");
			request.setAttribute("loc", "/views/groupStudy/groupStudyList.jsp");//스터디찾기 메인으로?
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
