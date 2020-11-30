package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import alarm.model.dao.AlarmDao;
import alarm.model.vo.Alarm;
import common.JDBCTemplate;
import groupstudy.model.dao.GroupStudyDao;
import groupstudy.model.vo.GroupList;
import member.model.dao.MemberDao;
import member.model.vo.AlarmPageData;
import member.model.vo.GroupPageData;
import member.model.vo.MailSend;
import member.model.vo.Member;

public class MemberService {
	
	// 마이페이지 -> 알림리스트 -> 페이징
	public AlarmPageData selectAlarmList(int alPage, int member_no, int glPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		AlarmDao dao = new AlarmDao();
		
		int totalCnt = dao.totalCount(conn,member_no); // 총 게시물의 수를 DB에서 가져옴.
		
		int numPerPage = 5; // 한 페이지 당 나타낼 게시글의 개수
		
		int totalPage = 0; // 총 나타내야 할 페이지 인덱스의 개수 
		
		if(totalCnt%numPerPage == 0 ) 
		{
			totalPage = totalCnt/numPerPage;
			// 나누어 떨어지면 나눈 값 
		}
		else {
			totalPage = totalCnt/numPerPage+1;
			// 나누어 떨어지지않고 게시글이 남는다면 인덱스 +1 
		}

		int start = (alPage-1)*numPerPage + 1; // 조회할 게시물들의 시작번호 
		int end = alPage*numPerPage; // 조회할 게시물들의 마지막번호
		System.out.println(start+","+end);
		ArrayList<Alarm> list = dao.selectList(conn,member_no,start,end); // 게시글 리스트를 받아옴.
		
		//페이지 네비게이션 작성 시작
		int pageNaviSize = 5; // 보여주는 페이지 인덱스 5개로 지정 
		
		String pageNavi = ""; // 페이지 네비 태그 작성용 (innerHTML)
		
		//페이지네비 시작번호 구하기 
		// reqPage : 1 ~ 5 -> 1 , reqPage : 6 ~ 10 -> 6 
		int pageNo = ((alPage-1)/pageNaviSize)*pageNaviSize+1;
		
		// Prev 버튼 : 페이지 시작번호가 1이 아닌경우에만 생성 
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/myPage?memberNo="+member_no+"&glPage="+glPage+"&alPage="+(pageNo-1)+"'>이전</a>";
		}
		// Page Navi 숫자 
		for(int i=0;i<pageNaviSize;i++)
		{
			if(alPage == pageNo) // 페이지 네비가 현재 요청페이지인경우 (a 태그 필요 X)
			{
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}
			else {
				pageNavi += "<a class='btn' href='/myPage?memberNo="+member_no+"&glPage="+glPage+"&alPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
			
		}
		// Next 버튼 
		if(pageNo <= totalPage)
		{
			pageNavi += "<a class='btn' href='/myPage?memberNo="+member_no+"&glPage="+glPage+"&alPage="+pageNo+"'>다음</a>";
		}
		
		AlarmPageData apd = new AlarmPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		
		return apd;
	}
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

	public int updateMember(Member updateMember) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn,updateMember);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteMember(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(conn,memberNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public GroupPageData selectGroupList(int alPage, int memberNo, int glPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		GroupStudyDao dao = new GroupStudyDao();
		
		int totalCnt = dao.totalCount(conn,memberNo); // 총 게시물의 수를 DB에서 가져옴.
		
		int numPerPage = 5; // 한 페이지 당 나타낼 게시글의 개수
		
		int totalPage = 0; // 총 나타내야 할 페이지 인덱스의 개수 
		
		if(totalCnt%numPerPage == 0 ) 
		{
			totalPage = totalCnt/numPerPage;
			// 나누어 떨어지면 나눈 값 
		}
		else {
			totalPage = totalCnt/numPerPage+1;
			// 나누어 떨어지지않고 게시글이 남는다면 인덱스 +1 
		}

		int start = (glPage-1)*numPerPage + 1; // 조회할 게시물들의 시작번호 
		int end = glPage*numPerPage; // 조회할 게시물들의 마지막번호
		System.out.println(start+","+end);
		ArrayList<GroupList> list = dao.selectList(conn,memberNo,start,end); // 게시글 리스트를 받아옴.
		
		//페이지 네비게이션 작성 시작
		int pageNaviSize = 5; // 보여주는 페이지 인덱스 5개로 지정 
		
		String pageNavi = ""; // 페이지 네비 태그 작성용 (innerHTML)
		
		//페이지네비 시작번호 구하기 
		// reqPage : 1 ~ 5 -> 1 , reqPage : 6 ~ 10 -> 6 
		int pageNo = ((glPage-1)/pageNaviSize)*pageNaviSize+1;
		
		// Prev 버튼 : 페이지 시작번호가 1이 아닌경우에만 생성 
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/myPage?memberNo="+memberNo+"&glPage="+(pageNo-1)+"&alPage="+alPage+"'>이전</a>";
		}
		// Page Navi 숫자 
		for(int i=0;i<pageNaviSize;i++)
		{
			if(glPage == pageNo) // 페이지 네비가 현재 요청페이지인경우 (a 태그 필요 X)
			{
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}
			else {
				pageNavi += "<a class='btn' href='/myPage?memberNo="+memberNo+"&glPage="+pageNo+"&alPage="+alPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
	}
		// Next 버튼 
		if(pageNo <= totalPage)
		{
			pageNavi += "<a class='btn' href='/myPage?memberNo="+memberNo+"&glPage="+pageNo+"&alPage="+alPage+"'>다음</a>";
		}
		
		GroupPageData gpd = new GroupPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return gpd;
}
	public ArrayList<Member> searchSendMember(ArrayList<Alarm> al) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> ml = new ArrayList<Member>();
		Member m = null;
		for(int i=0;i<al.size();i++) {
			m = new Member();
			m = new MemberDao().searchSendMember(conn,al.get(i).getSendMemberNo());
			ml.add(m);
		}
		JDBCTemplate.close(conn);
		return ml;
	}
}
