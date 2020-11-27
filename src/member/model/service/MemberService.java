package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.StringTokenizer;

import common.JDBCTemplate;
import groupstudy.model.vo.GroupList;
import member.model.dao.MemberDao;
import member.model.vo.MailSend;
import member.model.vo.Member;
import member.model.vo.MemberManagePage;

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

	public Member selectOneMember(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().selectOneMember(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public ArrayList<GroupList> searchMyStudy(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<GroupList> gl = new MemberDao().searchMyStudy(conn,memberNo);
		
		JDBCTemplate.close(conn);
		
		return gl;
	}

	//관리자페이지에서 사용자 삭제
	public boolean deleteAllUser(String num) {
		Connection conn = JDBCTemplate.getConnection();
		StringTokenizer sT1 = new StringTokenizer(num, "/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			int memberNo = Integer.parseInt(sT1.nextToken());
			int result1 = new MemberDao().deleteUser(conn, memberNo);
			if(result1==0) {
				result = false;
				break;
			}
			if(result) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
		}
		return result;
	}

	//관리자 페이지 - 사용자 레벨 변경
	public int changeLevel(int memberLevel, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().changeLevel(conn, memberLevel,memberNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	//관리자 페이지 - 사용자 리스트 페이징 조회
	public MemberManagePage selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		//1. 전체 글 수를 검색
		int totalCount = new MemberDao().totalCount(conn);
				
		//2. 총 페이지 수
		int numPerPage = 10;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//3. 게시글 시작번호화 끝 번호
		int start = (reqPage-1)*numPerPage + 1;
		int end = reqPage*numPerPage;
		
		//4.페이지 범위에 있는 게시글 리스트를 불러옴
		ArrayList<Member> list = new MemberDao().selectList(conn, start, end);
		
		//5.페이지 네비게이션 생성
		int pageNaviSize = 5;
		String pageNavi = "";
		
		//6.페이징 번호
		int pageNo = reqPage-2;
		if(reqPage <=3) {
			pageNo = 1;
		}else if(pageNo > totalPage-4){
			pageNo = totalPage-4;
		}
		
		//7. 이전버튼
		if(reqPage > 3) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/memberList?reqPage="+(pageNo-1)+"'><<</a></li>";
		}
		
		//8. 네비게이션 숫자
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi += "<li class='page-item'><a class='page-link' href='#' style='background-color:#6ED078'>"+pageNo+"</a></li>";
				pageNavi += "<li class='reqPage' style='display:none'>"+reqPage+"</li>";
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/memberList?reqPage="+(pageNo)+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		//9. 다음버튼
		if(pageNo <= totalPage-3) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/memberList?reqPage="+pageNo+"'>>></a></li>";
		}
		
		//10. 리스트와 태그 텍스트를 객체에 넣어줌
		MemberManagePage mmp = new MemberManagePage(list, pageNavi);
		JDBCTemplate.close(conn);
		return mmp;
	}
}
