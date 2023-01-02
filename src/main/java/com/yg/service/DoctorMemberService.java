package com.yg.service;

import java.util.List;

import com.yg.vo.BoardVo;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.FieldVo;

public interface DoctorMemberService {
	public void DoctorRegister(DoctorMemberVo vo);
	public DoctorMemberVo DoctorSelect(String id);
	public DoctorMemberVo doctorSelect_naver(String naver_id);
	int login(String id, String pw);
	int naver_login(String naver_id);
	int kakao_login(String kakao_nickname);
	public DoctorMemberVo doctorSelect_kakao(String kakao_nickname);
	String findId(String name,String email);
	String fidnPw(String id, String email);
	public void updatePw(String pw, String id,String email);
	int doctorPwCheck(String id, String email);
	String selectName(String id);
	String selectApprove(String id);
	List<DoctorMemberVo> selectAll();
	public void doctorDelete(String id);
	
	public List<DoctorMemberVo> getRank();
	int selectDoctorSize();
	public List<DoctorMemberVo> getRankAll(int sizeOfPage, int startNum);
	

	public String[] updatedoctortime(String id);
	public List<String> gettime();
	public void updatedoctortime2(String time, String id);
	public DoctorMemberVo selectdoctorinfo(String id);
	public void updatedoctorinfo(String address, String tel, String id);
	
//추가됨
	public String getUrl(String id);
	public void updateUrl(String url, String id);
	public String getChatUrl(String id);
	public void updateChatUrl(String url, String id);
	
//또 추가됨
	public DoctorMemberVo getDoctorName(int doctor_id);
	public List<DoctorMemberVo> doctorlistByField(String field);
	public FieldVo fieldDescription(String field);
	
//추추추가
	public int idcheck(String id);
	public int emailcheck(String email);

}
