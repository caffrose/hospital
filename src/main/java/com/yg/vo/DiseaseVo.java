package com.yg.vo;

public class DiseaseVo {
	private int num;
	private String part;
	private String name;
	private String english;
	private String symptom;
	private String related;
	private String hospital;
	private String image;
	
	public DiseaseVo() {	}
	public DiseaseVo(String part) {	this.part = part; }
	public DiseaseVo(int num, String part, String name, String english, String symptom, String related, String hospital,
			String image) {
		this.num = num;
		this.part = part;
		this.name = name;
		this.english = english;
		this.symptom = symptom;
		this.related = related;
		this.hospital = hospital;
		this.image = image;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getRelated() {
		return related;
	}
	public void setRelated(String related) {
		this.related = related;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
