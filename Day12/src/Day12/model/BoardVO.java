package Day12.model;

// VO (Value Object) - 값을 객체로 처리하겠다는 의미
// 테이블 하나당 VO 하나인 경우도 있고 통합하는 경우도 있음 + 데이터 은닉 (private)
public class BoardVO {
	private int idx;
	private String name;
	private String pass;
	private String subject;
	private String contents;
	private String regdate;
	private int readcnt;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	
	
}
