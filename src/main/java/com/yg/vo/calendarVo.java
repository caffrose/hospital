package com.yg.vo;

public class calendarVo {
	private int cNum;
	private int doctorNum;
	private String title;
	private String startDate;
	private String endDate;
	private String mid;
	private String related;
	private String diseaseName;
	private int finish;
	private int starpoint;
	private String type;
	
	public calendarVo() {}

	public calendarVo(String startDate, String endDate,int doctorNum, String mid) {
		super();
		this.doctorNum=doctorNum;
		this.startDate = startDate;
		this.endDate = endDate;
		this.mid=mid;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	
	
	public int getDoctorNum() {
		return doctorNum;
	}

	public void setDoctorNum(int doctorNum) {
		this.doctorNum = doctorNum;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getRelated() {
		return related;
	}

	public void setRelated(String related) {
		this.related = related;
	}

	public String getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}

	public int getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	};
	
	
	
	
	
	
}
