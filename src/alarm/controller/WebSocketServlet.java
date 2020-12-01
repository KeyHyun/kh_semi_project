package alarm.controller;

import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import alarm.model.service.AlarmService;
import alarm.model.vo.Alarm;
import member.model.service.MemberService;
import member.model.vo.Member;
// WebSocket의 호스트 주소 설정
@ServerEndpoint("/webSocket")
public class WebSocketServlet {
  // WebSocket으로 브라우저가 접속하면 요청되는 함수	
  @OnOpen
  public void handleOpen() {
    // 콘솔에 접속 로그를 출력한다.
    System.out.println("client is now connected...");
  }
  // WebSocket으로 메시지가 오면 요청되는 함수
  @OnMessage
  public String handleMessage(String message) {

    int memberNo = Integer.parseInt(message);
    ArrayList<Alarm> al = new ArrayList<Alarm>();
    al = new AlarmService().searchMyPopAlarm(memberNo); // 보낸 멤버넘버, 알람종류, 그룹넘버 조회
    ArrayList<Member> ml = new MemberService().searchSendMember(al); // 보낸사람 이름 프사
    String returnHTML = "";
    for(int i=0; i<al.size();i++)
    {
    	if(al.get(i).getAlarmSubject()==3) {
    		 returnHTML += "<li><div><img src="+ml.get(i).getFilepath()+"></div><div>"+ml.get(i).getMemberName()+"님이 메세지를 보냈습니다.<br><a href='myPlanGroupDetail?groupNo="+al.get(i).getGroupNo()+"'>그룹 스터디 페이지로 이동하기 ></a></div><div><img src='/img/delete.png'></div></li>";	
    	}
    	else if(al.get(i).getAlarmSubject()==2) {
    		returnHTML += "<li><div><img src="+ml.get(i).getFilepath()+"></div><div>"+ml.get(i).getMemberName()+"님에게서 그룹 참여신청이 도착했습니다.<br><a href='/myPage?memberNo="+memberNo+"&alPage=1&glPage=1#glNavi'>신청내역 확인하기 ></a></div><div><img src='/img/delete.png'></div></li>";
    	}
    	else if(al.get(i).getAlarmSubject() ==1) {
    		returnHTML += "<li><div><img src='/img/my.png'></div><div>공지사항이 등록되었습니다.<br><a href='/noticeList?reqPage=1'>공지사항으로 이동하기 ></a></div><div><img src='/img/delete.png'></div></li>";
    	}
    	else {
    		System.out.println("알람 서브젝트 오류");
    	}
    	 
    }
   
    return returnHTML;
  }
  // WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
  @OnClose
  public void handleClose() {
    // 콘솔에 접속 끊김 로그를 출력한다.
    System.out.println("client is now disconnected...");
  }
  // WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
  @OnError
  public void handleError(Throwable t) {
    // 콘솔에 에러를 표시한다.
    t.printStackTrace();
  }
}