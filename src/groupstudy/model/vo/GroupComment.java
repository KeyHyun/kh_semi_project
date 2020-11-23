package groupstudy.model.vo;

public class GroupComment {
	private int commentNo;
	private int groupNo;
	private String commentContent;
	private String commentTime;
	private int memberNo;
	private String filename;
	private String filepath;
	public GroupComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GroupComment(int commentNo, int groupNo, String commentContent, String commentTime, int memberNo,
			String filename, String filepath) {
		super();
		this.commentNo = commentNo;
		this.groupNo = groupNo;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.memberNo = memberNo;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	
}
