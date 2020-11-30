package groupstudy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import common.JDBCTemplate;
import groupstudy.model.vo.Category;
import groupstudy.model.vo.GroupStudyRoom;
import sun.security.action.GetIntegerAction;

public class GroupStudyDao {
	
	public ArrayList<GroupStudyRoom> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GroupStudyRoom> list = new ArrayList<GroupStudyRoom>();
		String query = "select * from (select rownum as rnum, n.* from (select * from group_studyRoom order by 1 desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				GroupStudyRoom gsr = new GroupStudyRoom();
				gsr.setrNum(rset.getInt("rNum"));
				gsr.setGroupNo(rset.getInt("group_no"));
				gsr.setGroupTitle(rset.getString("group_title"));
				gsr.setGroupExplan(rset.getString("group_explan"));
				gsr.setCategoryNo(rset.getInt("category_no"));
				//이 메소드는 그룹스터디 리스트를 보여주는 것이므로 보여줄 데이터만 가져온다.
				list.add(gsr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from group_studyRoom";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
				//별칭으로 해둔 cnt의 값을 넘겨준다.(총 게시물 수)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Integer> selectGroupNo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select group_no from GROUP_STUDYMEMBER where member_no=?";
		ArrayList<Integer> groupNoList = new ArrayList<Integer>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				groupNoList.add(rset.getInt("group_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return groupNoList;
	}

	public GroupStudyRoom selectGroupStudyOne(Connection conn, int groupNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from group_studyRoom where group_no=?";
		GroupStudyRoom gsr = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				gsr = new GroupStudyRoom();
				gsr.setGroupNo(rset.getInt("group_no"));
				gsr.setGroupTitle(rset.getString("group_title"));
				gsr.setGroupManagerNo(rset.getInt("group_manager_no"));
				gsr.setGroupRule(rset.getString("group_rule"));
				gsr.setGroupPersonnel(rset.getInt("group_personnel"));
				gsr.setGroupExplan(rset.getString("group_explan"));
				gsr.setGroupContent(rset.getString("group_content"));
				gsr.setGroupStartDate(rset.getString("group_startdate"));
				gsr.setGroupEndDate(rset.getString("group_enddate"));
				gsr.setCategoryNo(rset.getInt("category_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return gsr;
	}

	public Category selectCategory(Connection conn, int categoryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from category where category_no=?";
		Category category = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				category = new Category();
				category.setCategoryNo(rset.getInt("category_no"));
				category.setCategory1(rset.getString("category1"));
				category.setCategory2(rset.getString("category2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return category;
	}

	//인원수 가져오는 메소드
	public int selectMemberNo(Connection conn, int groupNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) cnt from GROUP_STUDYMEMBER where group_no=?";
		int memberCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				memberCnt = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return memberCnt;
	}

	public int insertApplyGroupMember(Connection conn, int memberNo, int groupNo, String applyContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into group_apply values(group_apply_seq.nextval,?,?,?,'미승인')";//처음 요청한거니까 미승인으로 들어감
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupNo);
			pstmt.setInt(2, memberNo);
			pstmt.setString(3, applyContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<String> categorySelAjax(Connection conn, String sel1) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> categoryList = new ArrayList<String>();
		String query = "select category2 from category where category1=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sel1);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				categoryList.add(rset.getString("category2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return categoryList;
	}

	public int createRoomCntCheck(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int roomCnt = 0;
		String query = "select count(*) cnt from GROUP_STUDYROOM where group_manager_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				roomCnt = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return roomCnt;
	}

	public int selectCategoryNo(Connection conn, String category1, String category2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int categoryNo = 0;
		String query = "select category_no from category where category1=? and category2=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				categoryNo = rset.getInt("category_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return categoryNo;
	}
	//그룹스터디 생성 insert
	public int insertGroupStudyRoom(Connection conn, GroupStudyRoom gsr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into GROUP_STUDYROOM values(GROUP_STUDYROOM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, gsr.getGroupTitle());
			pstmt.setInt(2, gsr.getGroupManagerNo());
			pstmt.setString(3, gsr.getGroupRule());
			pstmt.setInt(4, gsr.getGroupPersonnel());
			pstmt.setString(5, gsr.getGroupExplan());
			pstmt.setString(6, gsr.getGroupContent());
			pstmt.setString(7, gsr.getGroupStartDate());
			pstmt.setString(8, gsr.getGroupEndDate());
			pstmt.setInt(9, gsr.getCategoryNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//방생성 시 방장의 가장최근 groupNo을 구함 이후 바로 groupStudyMember에 방장도 insert하기 위함
	public int selectManagerGroupNo(Connection conn, int groupManagerNo) {
		PreparedStatement pstmt = null;
		int lastGroupNo = 0;
		ResultSet rset = null;
		String query = "select group_no from (select rownum rnum, group_no from GROUP_STUDYROOM where group_manager_no=? order by group_no desc) where rnum=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupManagerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				lastGroupNo = rset.getInt("group_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return lastGroupNo;
	}

	//최근 groupNo과 방장의No으로 groupStudyMember에 insert
	public int insertGroupStudyMember(Connection conn, int groupManagerNo, int lastGroupNo) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		String query = "insert into GROUP_STUDYMEMBER values(GROUP_STUDYMEMBER_SEQ.NEXTVAL,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupManagerNo);
			pstmt.setInt(2, lastGroupNo);
			result2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result2;
	}
	
	//관리자 페이지 - 각 그룹스터디 안에 몇 명있는지 계산
	public HashMap<Integer, Integer> seleteAllGroupMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<Integer, Integer> memberCount = new HashMap<Integer, Integer>();
		String query = "select GROUP_NO, count(*)+1 memberCount from GROUP_STUDYMEMBER group by GROUP_NO";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				memberCount.put(rset.getInt("GROUP_NO"), rset.getInt("memberCount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return memberCount;
	}

	//관리자 페이지 - 그룹스터디 삭제
	public int deleteGroupStudy(Connection conn, int groupNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from GROUP_STUDYROOM where GROUP_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//관리자 페이지 - 그룹스터디 총 수
	public int totalCount2(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) totalCount from GROUP_STUDYROOM";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("totalCount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return totalCount;
	}

	//관리자 페이지 - 그룹스터디 페이징 
	public ArrayList<GroupStudyRoom> selectList2(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GroupStudyRoom> list = new ArrayList<GroupStudyRoom>();
		String query = "select * from (select rownum as rnum, n.* from(select * from group_studyroom order by 1 desc) n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,  start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				GroupStudyRoom gsr = new GroupStudyRoom();
				gsr.setGroupNo(rset.getInt("group_no"));
				gsr.setGroupManagerNo(rset.getInt("GROUP_MANAGER_NO"));
				gsr.setGroupTitle(rset.getString("GROUP_TITle"));
				gsr.setGroupStartDate(rset.getString("GROUP_STARTDATE"));
				gsr.setGroupEndDate(rset.getString("GROUP_ENDDATE"));
				gsr.setGroupPersonnel(rset.getInt("GROUP_PERSONNEL"));
				list.add(gsr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	//관리자페이지 - 그룹스터디 삭제 할 때 그룹스터디 이미지 한번에 받기위함
	public String deleteFilepath(Connection conn, int groupNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String filepath = "";
		String query = "select filepath from group_studyroom where group_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				filepath = rset.getString("filepath");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return filepath;
	}
}
