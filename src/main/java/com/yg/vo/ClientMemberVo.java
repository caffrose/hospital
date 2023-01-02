package com.yg.vo;

public class ClientMemberVo {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String postcode;
	private String address;
	private String detailaddress;
	private String extraaddress;
	private String tel;
	private String schedule;
	private String type;
	private String naver_id;
	private String kakao_nickname;
	
	public ClientMemberVo() {}

	public ClientMemberVo(String id, String pw, String name, String email, String postcode, String address,
			String detailaddress, String extraaddress, String tel, String naver_id,String kakao_nickname) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.tel = tel;
		this.naver_id = naver_id;
		this.kakao_nickname = kakao_nickname;
	}
	
	public ClientMemberVo(String id, String pw, String name, String email, String postcode, String address,
			String detailaddress, String extraaddress, String tel, String schedule, String type, String naver_id,String kakao_nickname) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.tel = tel;
		this.schedule = schedule;
		this.type = type;
		this.naver_id = naver_id;
		this.kakao_nickname = kakao_nickname;
	}

	public ClientMemberVo(String id, String pw) {
		this.id = id;
		this.pw = pw;
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

	public String getExtraaddress() {
		return extraaddress;
	}

	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
	
}	
