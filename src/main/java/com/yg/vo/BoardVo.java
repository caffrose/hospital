package com.yg.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String file;
	private MultipartFile multipart;
	private String writedate;
	public BoardVo() {}
	
	public BoardVo(int bno, String title, String content) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
	}

	public BoardVo(String title, String content, MultipartFile multipart) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.multipart = multipart;
	}
	public BoardVo(String title, String content, String writer, String file, MultipartFile multipart) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.file = file;
		this.multipart = multipart;
	}
	
	public BoardVo(int bno, String title, String content, String writer, String file) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.file = file;
	}
	public BoardVo(String title, String content, String writer, String file) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.file = file;
	}
	
	public BoardVo(int bno, String title, String content, String writer, String file, MultipartFile multipart,String writedate) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.file = file;
		this.multipart = multipart;
		this.writedate = writedate;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public MultipartFile getMultipart() {
		return multipart;
	}
	public void setMultipart(MultipartFile multipart) {
		this.multipart = multipart;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	

}
