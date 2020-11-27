package groupstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import common.JDBCTemplate;
import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.vo.Category;
import groupstudy.model.vo.GroupManagePage;
import groupstudy.model.vo.GroupStudyPageData;
import groupstudy.model.vo.GroupStudyRoom;
import groupstudy.model.vo.GroupStudyRoomAddCategory;

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

	public ArrayList<Integer> selectGroupNo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Integer> groupNoList = new GroupStudyDao().selectGroupNo(conn, memberNo);
		JDBCTemplate.close(conn);
		return groupNoList;
	}
	//groupList.jsp에 출력용 group이랑 category랑 짝이 맞아야해서 객체 새로 생성함
	public ArrayList<GroupStudyRoomAddCategory> selectGroupStudyOne(ArrayList<Integer> groupNoList) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<GroupStudyRoomAddCategory> gsrCateList = new ArrayList<GroupStudyRoomAddCategory>();
		//반복문으로 groupNoList의 각각의 값으로 GroupStudyRoom과 Category를 가져와서 한쌍으로 List에 저장
		for(Integer groupNo : groupNoList) {
			GroupStudyRoomAddCategory gsrAddc = new GroupStudyRoomAddCategory();
			gsrAddc.setGsr(new GroupStudyDao().selectGroupStudyOne(conn, groupNo));
			gsrAddc.setCategory(new GroupStudyDao().selectCategory(conn, gsrAddc.getGsr().getCategoryNo()));//categoryNo을 넘겨줌
			gsrCateList.add(gsrAddc);
		}
		JDBCTemplate.close(conn);
		return gsrCateList;
	}

	public GroupStudyRoom selectGroupStudyOne(int groupNo) {
		Connection conn = JDBCTemplate.getConnection();
		GroupStudyRoom gsr = new GroupStudyDao().selectGroupStudyOne(conn, groupNo);
		JDBCTemplate.close(conn);
		return gsr;
	}

	public Category selectCategory(int categoryNo) {
		Connection conn = JDBCTemplate.getConnection();
		Category category = new GroupStudyDao().selectCategory(conn, categoryNo);
		JDBCTemplate.close(conn);
		return category;
	}
	
	//groupNo으로 선택한그룹스터디에 참여중인 인원수 가져오기
	public int selectMemberNo(int groupNo) {
		Connection conn = JDBCTemplate.getConnection();
		int memberCnt = new GroupStudyDao().selectMemberNo(conn, groupNo);
		JDBCTemplate.close(conn);
		return memberCnt;
	}

	public int insertApplyGroupMember(int memberNo, int groupNo, String applyContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GroupStudyDao().insertApplyGroupMember(conn,memberNo,groupNo,applyContent);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<String> categorySelAjax(String sel1) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<String> categoryList = new GroupStudyDao().categorySelAjax(conn,sel1);
		JDBCTemplate.close(conn);
		return categoryList;
	}

	public int createRoomCntCheck(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int roomCnt = new GroupStudyDao().createRoomCntCheck(conn,memberNo);
		JDBCTemplate.close(conn);
		return roomCnt;
	}

	public int selectCategoryNo(String category1, String category2) {
		Connection conn = JDBCTemplate.getConnection();
		int categoryNo = new GroupStudyDao().selectCategoryNo(conn,category1,category2);
		JDBCTemplate.close(conn);
		return categoryNo;
	}
	
	//groupStudyRoom, groupStudyMember(방장) 2개 한번에 insert
	public int insertGroupStudyRoom(GroupStudyRoom gsr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GroupStudyDao().insertGroupStudyRoom(conn,gsr);
		if(result>0) {
			//groupStudyMember 테이블에도 방장을 insert함(groupMangerNo을 가지고 제일 최근에 만들어진 groupNo으로 insert)
			int lastGroupNo = new GroupStudyDao().selectManagerGroupNo(conn, gsr.getGroupManagerNo());//최근 groupNo구하기
			int result2 = new GroupStudyDao().insertGroupStudyMember(conn, gsr.getGroupManagerNo(), lastGroupNo);//방장도 groupStudyMember에 저장
			if(result2>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//관리자 페이지 - 그룹스터디 no으로 참여중인 멤버 수 찾기
	public HashMap<Integer, Integer> seleteAllGroupMemberCount() {
		Connection conn = JDBCTemplate.getConnection();
		HashMap<Integer, Integer> memberCount = new GroupStudyDao().seleteAllGroupMemberCount(conn);
		JDBCTemplate.close(conn);
		return memberCount;
	}

	//관리자 페이지 - 그룹스터디 샂게
	public boolean deleteAllMember(String num) {
		Connection conn = JDBCTemplate.getConnection();
		System.out.println(num);
		StringTokenizer sT1 = new StringTokenizer(num, "/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			int groupNo = Integer.parseInt(sT1.nextToken());
			int result1 = new GroupStudyDao().deleteGroupStudy(conn, groupNo);
			if(result1==0) {
				result = false;
				break;
			}
			if(result) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
		}
		return result;
	}

	//관리자페이지 - 그룹스터디 페이징 조회
	public GroupManagePage seleteList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		//1. 전체 글 수 검색
		int totalCount = new GroupStudyDao().totalCount2(conn);

		//2. 총 페이지 수
		int numPerPage = 10;
		int totalPage = 0;
		if(totalCount/numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//3. 게시글 시작번호와 끝번호
		int start = (reqPage-1)*numPerPage + 1;
		int end = reqPage*numPerPage;
		
		//4. 페이지 범위에 있는 게시글 리스트를 불러옴 + 그룹스터디 각 인원수도 계산
		ArrayList<GroupStudyRoom> list = new GroupStudyDao().selectList2(conn, start, end);
		HashMap<Integer, Integer> memberCount = new GroupStudyDao().seleteAllGroupMemberCount(conn);
		
		//5. 페이지 네비게이션 생성
		int pageNaviSize = 5;
		String pageNavi = "";
		
		//6. 페이지 번호
		int pageNo = reqPage-2;
		if(reqPage <= 3) {
			pageNo = 1;
		}else if(pageNo > totalPage-4) {
			pageNo = totalPage-4;
		}
		
		//7. 이전버튼
		if(reqPage > 3) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/groupStudyListManager?reqPage="+(pageNo-1)+"'><<</a></li>";
		}
		
		//8. 네비게이션 숫자
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi += "<li class='page-item'><a class='page-link' href='#' style='background-color:#6ED078'>"+pageNo+"</a></li>";
				pageNavi += "<li class='reqPage' style='display:none'>"+reqPage+"</li>";
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/groupStudyListManager?reqPage="+(pageNo)+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		//9. 다음버튼
		System.out.println(pageNo +": pageNo");
		System.out.println(reqPage +": reqPage");
		System.out.println(totalPage + ": totalPage");
		if(reqPage <= totalPage-3) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/groupStudyListManager?reqPage="+pageNo+"'>>></a></li>";
		}

		//10. 리스트+태그텍스트+멤버 카운트를 객체에 넣어줌
		GroupManagePage gmp = new GroupManagePage(list, pageNavi, memberCount);
		JDBCTemplate.close(conn);
		return gmp;
	}
}
