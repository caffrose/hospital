package com.yg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.DoctorMemberDaoImpl;
import com.yg.vo.BoardVo;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.FieldVo;

@Service
public class DoctorMemberServiceImpl implements DoctorMemberService{
	@Autowired
	DoctorMemberDaoImpl dDao;
	
	@Override
	public void DoctorRegister(DoctorMemberVo vo) {
		dDao.DoctorRegister(vo);
	}

	@Override
	public DoctorMemberVo DoctorSelect(String id) {
		DoctorMemberVo vo = dDao.DoctorSelect(id);
		return vo;
	}
	@Override
	public int login(String id, String pw) {
		int result = dDao.login(id, pw);
		return result;
	}

	@Override
	public int naver_login(String naver_id) {
		int result = dDao.naver_login(naver_id);
		return result;
	}

	@Override
	public DoctorMemberVo doctorSelect_naver(String naver_id) {
		DoctorMemberVo vo = dDao.doctorSelect_naver(naver_id);
		return vo;
	}

	@Override
	public DoctorMemberVo doctorSelect_kakao(String kakao_nickname) {
		return dDao.doctorSelect_kakao(kakao_nickname);
	}

	@Override
	public int kakao_login(String kakao_nickname) {
		return dDao.kakao_login(kakao_nickname);
	}

	@Override
	public String findId(String name, String email) {
		return dDao.findId(name, email);
	}

	@Override
	public String fidnPw(String id, String email) {
		return dDao.findPw(id, email);
	}

	@Override
	public void updatePw(String pw, String id, String email) {
		dDao.updatePw(pw, id, email);
	}

	@Override
	public int doctorPwCheck(String id, String email) {
		return dDao.doctorPwCheck(id, email);
	}

	@Override
	public String selectName(String id) {
		return dDao.selectName(id);
	}

	@Override
	public List<DoctorMemberVo> getRank(){
		return dDao.getRank();
	}

//추가
	@Override
	public String[] updatedoctortime(String id) {
		return dDao.updatedoctortime(id);
	}

	@Override
	public List<String> gettime() {
		return dDao.gettime();
	}

	@Override
	public void updatedoctortime2(String time, String id) {
		dDao.updatedoctortime2(time, id);
	}

	@Override
	public DoctorMemberVo selectdoctorinfo(String id) {
		return dDao.selectdoctorinfo(id);
	}

	@Override
	public void updatedoctorinfo(String address, String tel, String id) {
		dDao.updatedoctorinfo(address,tel,id);
	}
	
	@Override
	public String selectApprove(String id) {
		return dDao.selectApprove(id);
	}

	@Override
	public List<DoctorMemberVo> selectAll() {
		return dDao.selectAll();
	}

	@Override
	public void doctorDelete(String id) {
		dDao.doctorDelete(id);
	}
	
	@Override
	public String getUrl(String id) {
		return dDao.getUrl(id);
	}

	@Override
	public void updateUrl(String url, String id) {
		dDao.updateUrl(url, id);
		
	}

	@Override
	public String getChatUrl(String id) {
		return dDao.getChatUrl(id);
	}

	@Override
	public void updateChatUrl(String url, String id) {
		dDao.updateChatUrl(url, id);
	}
	
	@Override
	public int selectDoctorSize() {
		return dDao.selectDoctorSize();
	}

	@Override
	public List<DoctorMemberVo> getRankAll(int sizeOfPage, int startNum) {
		return dDao.getRankAll(sizeOfPage, startNum);
	}
	
	@Override
	public DoctorMemberVo getDoctorName(int doctor_id) {
		return dDao.getDoctorName(doctor_id);
	}

	@Override
	public List<DoctorMemberVo> doctorlistByField(String field) {
		return dDao.doctorlistByField(field);
	}

	@Override
	public FieldVo fieldDescription(String field) {
		return dDao.fieldDescription(field);
	}
	
	@Override
	public int idcheck(String id) {
		int result = dDao.idcheck(id);
		return result;
	}

	@Override
	public int emailcheck(String email) {
		int result = dDao.emailcheck(email);
		return result;
	}
}
