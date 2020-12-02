package personalstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import personalstudy.model.dao.PersonalStudyDao;
import personalstudy.model.vo.PersonalStudyRoom;
import personalstudy.model.vo.PersonalStudyTask;

public class PersonalStudyService {

	public ArrayList<PersonalStudyTask> selectPersonalTask(int memberNo, int goalList) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<PersonalStudyTask> pst = new PersonalStudyDao().selectPersonalTask(conn,memberNo,goalList);
		JDBCTemplate.close(conn);
		return pst;
	}
	//일일계획-시간저장	12/02 16:08
	public int insertPersonalStudyRoom(int memberNo, String time) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PersonalStudyDao().insertPersonalStudyRoom(conn, memberNo, time);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		System.out.println(result);
		return result;
	}

}
