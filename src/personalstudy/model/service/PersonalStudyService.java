package personalstudy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import personalstudy.model.dao.PersonalStudyDao;
import personalstudy.model.vo.PersonalStudyTask;

public class PersonalStudyService {

	public ArrayList<PersonalStudyTask> selectPersonalTask(int memberNo, int goalList) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<PersonalStudyTask> pst = new PersonalStudyDao().selectPersonalTask(conn,memberNo,goalList);
		JDBCTemplate.close(conn);
		return pst;
	}

}
