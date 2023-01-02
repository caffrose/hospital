package com.yg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.vo.BoardVo;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.FieldVo;

@Repository
public class DoctorMemberDaoImpl implements DoctorMemberDao{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void DoctorRegister(DoctorMemberVo vo) {
		sqlSession.insert("com.yg.mapper.DoctorMapper.register",vo);
	}

	@Override
	public DoctorMemberVo DoctorSelect(String id) {
		DoctorMemberVo vo = sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectdoctor",id);
		return vo;
	}
	@Override
	public int login(String id, String pw) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("pw", pw);
		int result = sqlSession.selectOne("com.yg.mapper.DoctorMapper.doctorLogin",hMap);
		return result;
	}

	@Override
	public int naver_login(String naver_id) {
		int result = sqlSession.selectOne("com.yg.mapper.DoctorMapper.doctorNaverLogin",naver_id);
		return result;
	}
	@Override
	public DoctorMemberVo doctorSelect_naver(String naver_id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectdoctor_naver",naver_id);
	}
	@Override
	public DoctorMemberVo doctorSelect_kakao(String kakao_nickname) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectdoctor_kakao",kakao_nickname);
	}

	@Override
	public int kakao_login(String kakao_nickname) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.doctorkakaoLogin",kakao_nickname);
	}
	@Override
	public String findId(String name, String email) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("email",email);
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.findId",map);
	}
	@Override
	public String findPw(String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.findPw",map);
	}

	@Override
	public void updatePw(String pw, String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("pw", pw);
		map.put("id", id);
		map.put("email", email);
		sqlSession.update("com.yg.mapper.DoctorMapper.updatePw",map);
	}

	@Override
	public int doctorPwCheck(String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.doctorPwCheck",map);
	}

	@Override
	public String selectName(String id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectName",id);
	}
	
	@Override
	public List<DoctorMemberVo> getRank() {
		return sqlSession.selectList("com.yg.mapper.DoctorMapper.getRank");
	}
	
//추가
	@Override
	public String[] updatedoctortime(String id) {
		String time=sqlSession.selectOne("com.yg.mapper.DoctorMapper.updatedoctortime",id);
		String[] list=time.split("___");
		return list;
	}

	@Override
	public List<String> gettime() {
		return sqlSession.selectList("com.yg.mapper.DoctorMapper.gettime");
	}

	@Override
	public void updatedoctortime2(String time, String id) {
		Map<String, String> map= new HashMap<String, String>();
		map.put("time", time);
		map.put("id", id);
		sqlSession.update("com.yg.mapper.DoctorMapper.updatedoctortime2",map);
	}

	@Override
	public DoctorMemberVo selectdoctorinfo(String id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectdoctorinfo",id);
	}

	@Override
	public void updatedoctorinfo(String address, String tel, String id) {
		Map<String, String> map= new HashMap<String, String>();
		map.put("address", address);
		map.put("tel", tel);
		map.put("id", id);
		sqlSession.update("com.yg.mapper.DoctorMapper.updatedoctorinfo",map);
	}
	
	@Override
	public String selectApprove(String id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.approve",id);
	}

	@Override
	public List<DoctorMemberVo> selectAll() {
		return sqlSession.selectList("com.yg.mapper.DoctorMapper.selectAll");
	}

	@Override
	public void doctorDelete(String id) {
		sqlSession.delete("com.yg.mapper.DoctorMapper.doctorDelete",id);
	}
	
	@Override
	public String getUrl(String id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.getUrl", id);
	}

	@Override
	public void updateUrl(String url, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("url", url);
		map.put("id", id);
		sqlSession.update("com.yg.mapper.DoctorMapper.updateVideoUrl", map);		
	}

	@Override
	public String getChatUrl(String id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.getChatUrl", id);
	}

	@Override
	public void updateChatUrl(String url, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("url", url);
		map.put("id", id);
		sqlSession.update("com.yg.mapper.DoctorMapper.updateChatUrl", map);
	}
	
	@Override
	public int selectDoctorSize() {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.selectDoctorSize");
	}

	@Override
	public List<DoctorMemberVo> getRankAll(int sizeOfPage, int startNum) {
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("sizeOfPage", sizeOfPage);
		map.put("startNum", startNum);
		return sqlSession.selectList("com.yg.mapper.DoctorMapper.getRankAll",map);
	}
	
	@Override
	public DoctorMemberVo getDoctorName(int doctor_id) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.getDoctorName", doctor_id);
	}

	@Override
	public List<DoctorMemberVo> doctorlistByField(String field) {
		return sqlSession.selectList("com.yg.mapper.DoctorMapper.doctorlistByField", field);
	}

	@Override
	public FieldVo fieldDescription(String field) {
		return sqlSession.selectOne("com.yg.mapper.DoctorMapper.fieldDescription", field);
	}
	
	@Override
	public int idcheck(String id) {
		int result = sqlSession.selectOne("com.yg.mapper.DoctorMapper.idcheck", id);
		return result;
	}

	@Override
	public int emailcheck(String email) {
		int result = sqlSession.selectOne("com.yg.mapper.DoctorMapper.emailcheck", email);
		return result;
	}
}
