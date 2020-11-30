package alarm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import alarm.model.dao.AlarmDao;
import alarm.model.vo.Alarm;
import common.JDBCTemplate;
import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.vo.GroupApplyData;
import member.model.dao.MemberDao;

public class AlarmService {

	public ArrayList<Alarm> searchMyAlarm(int memberNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Alarm> al = new AlarmDao().searchMyAlarm(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return al;
	}

	public int deleteAlarm(int a_no) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AlarmDao().deleteAlarm(conn,a_no);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReadStatus(int alN) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AlarmDao().updateReadStatus(conn, alN);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public GroupApplyData getApplyInform(int alNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		 // 알람 넘버로 그룹 넘버 조회 
		int groupNum = new AlarmDao().selectGroupNo(conn,alNo);
		 // 알람넘버, 그룹넘버로 참여신청한 멤버의 no 조회
		int applyMemberNo = new MemberDao().selectOneMember(conn, groupNum,alNo);
		// 모달창에 들어갈 정보 조회 (그룹 신청 form)
		GroupApplyData gad = new GroupStudyDao().getApplyInfo(conn,groupNum,applyMemberNo);
		gad.setApplyMemberNo(applyMemberNo);
		
		return gad;
	}

	public ArrayList<Alarm> searchMyPopAlarm(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Alarm> al = new AlarmDao().searchMyPopAlarm(conn,memberNo);
		
		JDBCTemplate.close(conn);
		return al;
	}

}
