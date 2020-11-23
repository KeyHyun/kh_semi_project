package alarm.model.vo;

public class Alarm {
	private int alarmNo;
	private String alarmContent;
	private int memberNo;
	private int groupNo;
	private String alarmStatus;
	private int alarmSubject;
	public Alarm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Alarm(int alarmNo, String alarmContent, int memberNo, int groupNo, String alarmStatus, int alarmSubject) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContent = alarmContent;
		this.memberNo = memberNo;
		this.groupNo = groupNo;
		this.alarmStatus = alarmStatus;
		this.alarmSubject = alarmSubject;
	}
	public int getAlarmNo() {
		return alarmNo;
	}
	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getAlarmStatus() {
		return alarmStatus;
	}
	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}
	public int getAlarmSubject() {
		return alarmSubject;
	}
	public void setAlarmSubject(int alarmSubject) {
		this.alarmSubject = alarmSubject;
	}
	
	
}
