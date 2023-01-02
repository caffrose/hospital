package com.yg.vo;

public class countCalendarVo {
	private int num;
	private String part;
	private String startDate;
	private String endDate;
	private int count;
	private int doctorcount;
	
	public countCalendarVo() {}

	public countCalendarVo(String part, String startDate) {
		super();
		this.part = part;
		this.startDate = startDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getDoctorcount() {
		return doctorcount;
	}

	public void setDoctorcount(int doctorcount) {
		this.doctorcount = doctorcount;
	}
	
	
}
