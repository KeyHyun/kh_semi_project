package personalstudy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import personalstudy.model.vo.PersonalStudyTask;

public class PersonalStudyDao {

	//개인 스터디(달력:스케줄) - 데이터 불러오기
	public ArrayList<PersonalStudyTask> selectCalendarTask(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PersonalStudyTask> list = new ArrayList<PersonalStudyTask>();
		String query = "select task_no, member_no, task_content, task_startdate, task_enddate, task_color from PERSONAL_STUDYTASK where member_no = ? and task_startdate is not null";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PersonalStudyTask pst = new PersonalStudyTask();
				pst.setMemberNo(rset.getInt("MEMBER_NO"));
				pst.setTaskColor(rset.getString("TASK_COLOR"));
				pst.setTaskContent(rset.getString("TASK_CONTENT"));
				pst.setTaskEndDate(rset.getString("TASK_ENDDATE"));
				pst.setTaskStartDate(rset.getString("TASK_STARTDATE"));
				pst.setTaskNo(rset.getInt("TASK_NO"));
				list.add(pst);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	//개인 스터디(달력:스케줄) - 데이터 삽입
	public int insertCalendar(Connection conn, PersonalStudyTask pst) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into PERSONAL_STUDYTASK values (PERSONAL_STUDYTASK_SEQ.NEXTVAL, ?,?,?,?,?,'n',0)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pst.getMemberNo());
			pstmt.setString(2, pst.getTaskContent());
			pstmt.setString(3, pst.getTaskStartDate());
			pstmt.setString(4, pst.getTaskEndDate());
			pstmt.setString(5, pst.getTaskColor());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//개인 스터디(달력:스케줄) - 1개의 할 일 내용 받기
	public PersonalStudyTask selectCalendarOneTask(Connection conn, int taskNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String qeury = "select task_content, task_startdate, task_enddate, task_color from PERSONAL_STUDYTASK where task_no = ? ";
		PersonalStudyTask pst = null;
		try {
			pstmt = conn.prepareStatement(qeury);
			pstmt.setInt(1, taskNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				pst = new PersonalStudyTask();
				pst.setTaskColor(rset.getString("TASK_COLOR"));
				pst.setTaskContent(rset.getString("TASK_CONTENT"));
				pst.setTaskEndDate(rset.getString("TASK_ENDDATE"));
				pst.setTaskStartDate(rset.getString("TASK_STARTDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return pst;
	}

	//개인 스터디(달력:스케줄) - 할 일 삭제
	public int deleteCalendar(Connection conn, int taskNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from PERSONAL_STUDYTASK where task_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, taskNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//개인 스터디(달력:스케줄) - 기존 할 일 수정
	public int updateCalendar(Connection conn, PersonalStudyTask pst) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update PERSONAL_STUDYTASK set  TASK_CONTENT=?, TASK_STARTDATE=?, TASK_ENDDATE=?,TASK_COLOR=? where task_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pst.getTaskContent());
			pstmt.setString(2, pst.getTaskStartDate());
			pstmt.setString(3, pst.getTaskEndDate());
			pstmt.setString(4, pst.getTaskColor());
			pstmt.setInt(5, pst.getTaskNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
