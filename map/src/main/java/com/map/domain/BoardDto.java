package com.map.domain;

import java.util.Date;

public class BoardDto {
	/*	
	CREATE TABLE TBL_BOARD(
			BNO NUMBER(10, 0),
			WRITER VARCHAR2(50) NOT NULL,
			TITLE VARCHAR2(200) NOT NULL,
			CONTENT VARCHAR2(2000) NOT NULL,
			REGDATE DATE DEFAULT SYSDATE,
			UPDATEDATE DATE DEFAULT SYSDATE
		);
	 */
	
	private int bno;
	private String writer;
	private String receiver;
	private String title;
	private String content;
	private Date regdate;
	private Date updateDate;
	
	
	
	public BoardDto() {
		super();
	}



	public BoardDto(int bno, String writer, String title, String content, Date regdate, Date updateDate) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.receiver = receiver;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.updateDate = updateDate;
		
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}

	


	public String getReceiver() {
		return receiver;
	}



	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
