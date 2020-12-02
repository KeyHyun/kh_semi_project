package personalstudy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import personalstudy.model.vo.PersonalStudyRoom;
import personalstudy.model.vo.PersonalStudyTask;

public class PersonalStudyDao {

	public ArrayList<PersonalStudyTask> selectPersonalTask(Connection conn, int memberNo, int goalList) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from personal_studytask where member_no = ? and task_order = ?";
		ArrayList<PersonalStudyTask> pstl = new ArrayList<PersonalStudyTask>();
		PersonalStudyTask pst = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, goalList);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				pst = new PersonalStudyTask();
				pst.setMemberNo(rset.getInt("member_no"));
				pst.setTaskColor(rset.getString("task_color"));
				pst.setTaskContent(rset.getString("task_content"));
				pst.setTaskEndDate(rset.getString("task_enddate"));
				pst.setTaskNo(rset.getInt("task_no"));
				pst.setTaskOrder(rset.getInt("task_order"));
				pst.setTaskStartDate(rset.getString("task_startdate"));
				pst.setTaskStatus(rset.getString("task_status"));
				pstl.add(pst);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return pstl;
	}
	//일일계획-시간저장	12/02 16:08
	public int insertPersonalStudyRoom(Connection conn, int memberNo, String time) {
		System.out.println("DAO");
		System.out.println(memberNo);
		System.out.println(time);
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into personal_studyRoom values(?,to_char(sysdate,'yyyy-mm-dd'),'goal',to_char(sysdate, 'HH24:MI:SS'),?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, time);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
