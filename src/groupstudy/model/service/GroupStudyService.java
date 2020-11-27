package groupstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.vo.Category;
import groupstudy.model.vo.GroupStudyMember;
import groupstudy.model.vo.GroupStudyRoom;
import groupstudy.model.vo.GroupStudyRoomAddCategory;

public class GroupStudyService {

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
}
