package questionboard.model.vo;

public class QuestionBoard {
	private int questionNo;
	private String questionTitle;
	private String questionWriteDate;
	private int questionWriterNo;
	private String questionContent;
	private int questionPw;
	private String answerStatus;
	private String answerContent;
	private String answerDate;
	public QuestionBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionBoard(int questionNo, String questionTitle, String questionWriteDate, int questionWriterNo,
			String questionContent, int questionPw, String answerStatus, String answerContent, String answerDate) {
		super();
		this.questionNo = questionNo;
		this.questionTitle = questionTitle;
		this.questionWriteDate = questionWriteDate;
		this.questionWriterNo = questionWriterNo;
		this.questionContent = questionContent;
		this.questionPw = questionPw;
		this.answerStatus = answerStatus;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionWriteDate() {
		return questionWriteDate;
	}
	public void setQuestionWriteDate(String questionWriteDate) {
		this.questionWriteDate = questionWriteDate;
	}
	public int getQuestionWriterNo() {
		return questionWriterNo;
	}
	public void setQuestionWriterNo(int questionWriterNo) {
		this.questionWriterNo = questionWriterNo;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getQuestionPw() {
		return questionPw;
	}
	public void setQuestionPw(int questionPw) {
		this.questionPw = questionPw;
	}
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	
	
}
