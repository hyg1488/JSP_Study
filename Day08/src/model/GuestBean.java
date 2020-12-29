package model;

public class GuestBean {	// bean 파일은 html form 태그 내의 name 과 변수 명이 같아야 한다. 
	private String name;
	private String subject;
	private String contents;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
	
}
