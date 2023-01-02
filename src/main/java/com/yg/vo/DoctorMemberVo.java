package com.yg.vo;

import org.springframework.web.multipart.MultipartFile;

public class DoctorMemberVo {
	private int doctor_id;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String postcode;
	private String address;
	private String detailaddress;
	private String extraaddress;
	private String hospitalname;
	private String field;
	private String tel;
	private String license;
	private String time;
	private String doctorimg;
	private String naver_id;
	private String kakao_nickname;
	private String approve;
	private double starpoint;
	private int starpointcount;
	private MultipartFile multipart;
	private String url;
	private String chaturl;
	
	public DoctorMemberVo() {	}
	public DoctorMemberVo(String id, String pw, String name, String email, String postcode, String address,
			String detailaddress, String extraaddress, String hospitalname, String field, 
			String tel, String naver_id,String kakao_nickname, MultipartFile multipart) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.hospitalname = hospitalname;
		this.field = field;
		this.tel = tel;
		this.naver_id = naver_id;
		this.multipart = multipart;
		this.kakao_nickname = kakao_nickname;
	}
	
	public DoctorMemberVo(String id, String pw, String name, String email, String postcode, String address,
			String detailaddress, String extraaddress, String hospitalname, String field, String tel, String license,
			String naver_id, String kakao_nickname, MultipartFile multipart) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.hospitalname = hospitalname;
		this.field = field;
		this.tel = tel;
		this.license = license;
		this.naver_id = naver_id;
		this.kakao_nickname = kakao_nickname;
		this.multipart = multipart;
	}
	public DoctorMemberVo(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public MultipartFile getMultipart() {
		return multipart;
	}
	public void setMultipart(MultipartFile multipart) {
		this.multipart = multipart;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public String getNaver_id() {
		return naver_id;
	}
	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}
	public String getKakao_nickname() {
		return kakao_nickname;
	}
	public void setKakao_nickname(String kakao_nickname) {
		this.kakao_nickname = kakao_nickname;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDoctorimg() {
		return doctorimg;
	}
	public void setDoctorimg(String doctorimg) {
		this.doctorimg = doctorimg;
	}
	public double getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}
	public int getStarpointcount() {
		return starpointcount;
	}
	public void setStarpointcount(int starpointcount) {
		this.starpointcount = starpointcount;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getChaturl() {
		return chaturl;
	}
	public void setChaturl(String chaturl) {
		this.chaturl = chaturl;
	}
	
	
	
}
