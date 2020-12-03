package alarm.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import alarm.model.vo.Alarm;
import common.JDBCTemplate;

public class AlarmDao {

	public ArrayList<Alarm> searchMyAlarm(Connection conn, int memberNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String query = "select * from alarm where member_no = ?";
		ResultSet rset = null;
		ArrayList<Alarm> al = new ArrayList<Alarm>();
		Alarm a = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				a = new Alarm();
				a.setAlarmContent(rset.getString("alarm_content"));
				a.setAlarmNo(rset.getInt("alarm_no"));
				a.setAlarmStatus(rset.getString("alarm_status"));
				a.setAlarmSubject(rset.getInt("alarm_subject"));
				a.setMemberNo(rset.getInt("member_no"));
				a.setGroupNo(rset.getInt("group_no"));
				al.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return al;
	}

	public int deleteAlarm(Connection conn, int a_no) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from alarm where alarm_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, a_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int totalCount(Connection conn, int member_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from alarm where member_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, member_no);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				result = rset.getInt("cnt");
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

	public ArrayList<Alarm> selectList(Connection conn, int member_no, int start, int end) {
		
		ArrayList<Alarm> list = new ArrayList<Alarm>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Alarm alarm = null;
		String query = "select * from (select rownum as rnum, n.* from(select * from alarm where member_no = ? order by 1 desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, member_no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				alarm = new Alarm();
				alarm.setrNum(rset.getInt("rnum"));
				alarm.setAlarmContent(rset.getString("alarm_content"));
				alarm.setAlarmNo(rset.getInt("alarm_no"));
				alarm.setMemberNo(rset.getInt("member_no"));
				alarm.setGroupNo(rset.getInt("group_no"));
				alarm.setAlarmStatus(rset.getString("alarm_status"));
				alarm.setAlarmSubject(rset.getInt("alarm_subject"));
				list.add(alarm);
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

	public int updateReadStatus(Connection conn, int alN) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update alarm set alarm_status = ? where alarm_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "o");
			pstmt.setInt(2, alN);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectGroupNo(Connection conn, int alNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select group_no from alarm where alarm_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, alNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("group_no");
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

	public ArrayList<Alarm> searchMyPopAlarm(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from alarm where member_no=? and rownum<=5 and alarm_status='x' order by 1 desc";
		ArrayList<Alarm> al = new ArrayList<Alarm>();
		Alarm a = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				a = new Alarm();
				a.setAlarmNo(rset.getInt("alarm_no"));
				a.setSendMemberNo(rset.getInt("send_member_no"));
				a.setAlarmSubject(rset.getInt("alarm_subject"));
				a.setGroupNo(rset.getInt("group_no"));
				al.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return al;
	}

	public int insertApplyAlarm(Connection conn, int groupNo, int memberNo, String applyContent, int managerNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into alarm values(alarm_seq.nextval,?,?,?,'x',?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, applyContent);
			pstmt.setInt(2, managerNo);
			pstmt.setInt(3, groupNo);
			pstmt.setInt(4,2);
			pstmt.setInt(5, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateStatus(Connection conn, int alarmNum, String stat) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update alarm set alarm_status = ? where alarm_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, stat);
			pstmt.setInt(2, alarmNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updatePopAlarm(Connection conn, int alvalues) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update alarm set alarm_status = ? where alarm_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "o");
			pstmt.setInt(2, alvalues);
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
