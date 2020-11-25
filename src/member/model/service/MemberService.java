package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.MailSend;
import member.model.vo.Member;

public class MemberService {

	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Boolean selectOneMember(String memberId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		Boolean b = new MemberDao().selectOneMember(conn, memberId);
		
		JDBCTemplate.close(conn);
		
		return b;
	}

	public Member selectOneMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member loginMember = new MemberDao().selectOneMember(conn, m);
		
		JDBCTemplate.close(conn);
		
		return loginMember;
	}

	public String findMemberId(String searchName, String searchEmail) {
		
		Connection conn = JDBCTemplate.getConnection();
		String s_id = new MemberDao().findMemberId(conn, searchName, searchEmail);
		
		JDBCTemplate.close(conn);
		return s_id;
	}

	public static String randomPassword (int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H',
				'I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r',
				's','t','u','v','w','x','y','z'};
		
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<length;i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();
	}
	
	public int findMemberPw(String searchId, String searchMail) {

		Connection conn = JDBCTemplate.getConnection();
		String n_pw = randomPassword(10); // 임시 비밀번호 생성
		int result = new MemberDao().findMemberPw(conn, searchId, searchMail,n_pw);
		if(result>0) {
			JDBCTemplate.commit(conn);
			String mailCode = new MailSend().mailSend(searchMail,n_pw);
			System.out.println("서비스 : "+mailCode);
		}
		else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		
		return result;
	}

}
