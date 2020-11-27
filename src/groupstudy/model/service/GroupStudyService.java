package groupstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.vo.GroupStudyPageData;
import groupstudy.model.vo.GroupStudyRoom;

public class GroupStudyService {

//	public GroupStudyPageData selectList(int reqPage) {
//		Connection conn = JDBCTemplate.getConnection();
//		GroupStudyDao dao = new GroupStudyDao();	//총 게시물 수를 구하는 DAO
//		int totalCount = dao.totalCount(conn);		//한 페이지당 게시물 수
//		int numPerPage = 12;					//한 페이지당 게시물 수
//		int totalPage = 0;						//전체 페이지 수
//		if(totalCount%numPerPage ==0) {			//나머지가 0인경우
//			totalPage = totalCount/numPerPage;
//		}else {
//			totalPage = totalCount/numPerPage+1;
//		}
//		System.out.println("totalcount : "+totalCount);
//		//reqPage=1 -> start : 1, end = 10
//		//reqPage=2 -> start : 11, end = 20
//		//reqPage=3 -> start : 21, end = 30
//		int start = (reqPage-1)*numPerPage+1; //해당 페이지 게시물의 시작번호
//		int end = reqPage*numPerPage;
//		System.out.println("시작번호 : "+start+" / 끝번호 : "+end);
//		ArrayList<GroupStudyRoom> list = dao.selectList(conn,start,end);
//		//페이지 네비게이션 작성
//		int pageNaviSize = 5;					//페이지 네비게이션 길이 지정
//		String pageNavi = "";					//페이지 네비 태그 작성용
//		//페이지 시작번호 구하기 
//		int pageNo = reqPage-2;
//		if (reqPage <= 3) {
//			pageNo = 1;
//		} else if (pageNo > totalPage - 4) {
//			pageNo = totalPage - 4;
//		}
//
//		// 7. 이전버튼
//		if (reqPage > 3) {
//			pageNavi += "<li class='page-item'><a class='page-link' href='/groupStudyList?reqPage=" + (pageNo - 1)
//					+ "'><<</a></li>";
//		}
//		//페이지 네비 숫자
//		for (int i = 0; i < pageNaviSize; i++) {
//			if (reqPage == pageNo) {
//				pageNavi += "<li class='page-item'><a class='page-link' href='#' style='background-color:#6ED078'>"
//						+ pageNo + "</a></li>";
//			} else {
//				pageNavi += "<li class='page-item'><a class='page-link' href='/groupStudyList?reqPage=" + (pageNo)
//						+ "'>" + pageNo + "</a></li>";
//			}
//			pageNo++;
//
//			if (pageNo > totalPage) {
//				break;
//			}
//		}
//		//다음 버튼
//		if(reqPage != totalPage) {
//			pageNavi += "<a class'btn' href='/groupStudyList?reqPage="+(reqPage+1)+"'>다음</a>";
//		}
//		GroupStudyPageData gspd = new GroupStudyPageData(list, pageNavi);
//		System.out.println(gspd.getPageNavi());
//		
//		JDBCTemplate.close(conn);
//		return gspd;
//	}
	
	public GroupStudyPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		GroupStudyDao dao = new GroupStudyDao();	//총 게시물 수를 구하는 DAO
		int totalCount = dao.totalCount(conn);		//한 페이지당 게시물 수
		int numPerPage = 12;					//한 페이지당 게시물 수
		int totalPage = 0;						//전체 페이지 수
		if(totalCount%numPerPage ==0) {			//나머지가 0인경우
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		System.out.println("totalcount : "+totalCount);
		//reqPage=1 -> start : 1, end = 10
		//reqPage=2 -> start : 11, end = 20
		//reqPage=3 -> start : 21, end = 30
		int start = ((reqPage-1)*numPerPage)+1; //해당 페이지 게시물의 시작번호
		int end = reqPage*numPerPage;
		System.out.println("시작번호 : "+start+" / 끝번호 : "+end);
		ArrayList<GroupStudyRoom> list = dao.selectList(conn,start,end);
		//페이지 네비게이션 작성
		int pageNaviSize = 5;					//페이지 네비게이션 길이 지정
		String pageNavi = "";					//페이지 네비 태그 작성용
		//페이지 시작번호 구하기 
		int pageNo = reqPage-2;
		//이전버튼 : 현재 페이지가 1일때만 이전버튼 X
		if(reqPage > 1) {
			pageNavi += "<a class='btn' href='/groupStudyList?reqPage="+(reqPage-1)+"'>이전</a>";
		}
		if(reqPage <= 3) {
			pageNo = 1;
		}
		//페이지 네비 숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) { //페이지 네비가 현재 요청페이지인 경우(a태그가 필요없다. 새로고침을 원하는게 아니라면)
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {	//클릭한 페이지가 현재페이지와 다를 경우 페이지 이동시켜줘야하니까 span 말고 a태그를 써서 클릭한 숫자 페이지로 이동시킴
				if(pageNo == 0) {
					pageNavi += "<a class='btn' href='/groupStudyList?reqPage="+pageNo+"'>"+pageNo+"</a>";
				}else {					
					pageNavi += "<a class='btn' href='/groupStudyList?reqPage="+pageNo+"'>"+pageNo+"</a>";
				}
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음 버튼
		if(reqPage != totalPage) {
			pageNavi += "<a class'btn' href='/groupStudyList?reqPage="+(reqPage+1)+"'>다음</a>";
		}
		GroupStudyPageData gspd = new GroupStudyPageData(list, pageNavi);
		
		JDBCTemplate.close(conn);
		return gspd;
	}

}
