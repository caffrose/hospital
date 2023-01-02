package com.yg.vo;

public class DescriptionVo {
	private int dnum;
	private String part;
	private String symptom;
	private String description;
	
	public DescriptionVo() {}
	public DescriptionVo(String part, String symptom, String description) {
		super();
		this.part = part;
		this.symptom = symptom;
		this.description = description;
	}
	public DescriptionVo(int dnum, String part, String symptom, String description) {
		super();
		this.dnum = dnum;
		this.part = part;
		this.symptom = symptom;
		this.description = description;
	}
	
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "DescriptionVo [dnum=" + dnum + ", part=" + part + ", symptom=" + symptom + ", description="
				+ description + "]";
	}
}
