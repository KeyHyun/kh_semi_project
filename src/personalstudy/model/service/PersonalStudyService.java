package personalstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import personalstudy.model.dao.PersonalStudyDao;
import personalstudy.model.vo.PersonalStudyTask;

public class PersonalStudyService {

	//개인 스터디(달력:스케줄) - 데이터 불러오기
	public ArrayList<PersonalStudyTask> selectCalendarTask(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<PersonalStudyTask> list = new PersonalStudyDao().selectCalendarTask(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}

	//개인 스터디(달력:스케줄) - 데이터 삽입
	public int insertCalendar(PersonalStudyTask pst) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PersonalStudyDao().insertCalendar(conn, pst);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	//개인 스터디(달력:스케줄) - 1개의 할 일 내용 받기
	public PersonalStudyTask selectCalendarOntTask(int taskNo) {
		Connection conn = JDBCTemplate.getConnection();
		PersonalStudyTask pst = new PersonalStudyDao().selectCalendarOneTask(conn, taskNo);
		JDBCTemplate.close(conn);
		return pst;
	}
	
	//개인 스터디(달력:스케줄) - 할 일 삭제
	public int deleteCalendar(int taskNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PersonalStudyDao().deleteCalendar(conn, taskNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	//개인 스터디(달력:스케줄) - 기존 할 일 수정
	public int updateCalendar(PersonalStudyTask pst) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PersonalStudyDao().updateCalendar(conn, pst);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
