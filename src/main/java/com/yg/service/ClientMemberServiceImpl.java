package com.yg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.ClientMemberDao;
import com.yg.vo.ClientMemberVo;
import com.yg.vo.mailVo;

@Service
public class ClientMemberServiceImpl implements ClientMemberService {
	@Autowired
	ClientMemberDao dao;

	@Override
	public void clientRegister(ClientMemberVo vo) {
		dao.clientRegister(vo);
	}

	@Override
	public ClientMemberVo clientSelect(String id) {
		return dao.clientSelect(id);
	}

	@Override
	public int login(String id, String pw) {
		int result = dao.login(id, pw);
		return result;
	}

	@Override
	public int naver_login(String naver_id) {
		int result = dao.naver_login(naver_id);
		return result;
	}

	@Override
	public ClientMemberVo clientSelect_naver(String naver_id) {
		return dao.clientSelect_naver(naver_id);
	}

	@Override
	public ClientMemberVo clientSelect_kakao(String kakao_nickname) {
		return dao.clientSelect_kakao(kakao_nickname);
	}

	@Override
	public int kakao_login(String kakao_nickname) {
		return dao.kakao_login(kakao_nickname);
	}

	@Override
	public String findId(String name, String email) {
		return dao.findId(name, email);
	}

	@Override
	public String findPw(String id, String email) {
		return dao.findPw(id, email);
	}

	@Override
	public void updatePw(String pw, String id, String email) {
		dao.updatePw(pw, id, email);
	}

	@Override
	public int clientPwCheck(String id, String email) {
		return dao.clientPwCheck(id, email);
	}

	@Override
	public String selectName(String id) {
		return dao.selectName(id);
	}

//추가
	@Override
	public List<mailVo> selectmymail(String id) {
		return dao.selectmymail(id);
	}
	
	public void updatehitcount(int num) {
		dao.updatehitcount(num);
	}

	@Override
	public mailVo showmaildetail(int num) {
		return dao.showmaildetail(num);
	}

	@Override
	public int newmailcheck(String id) {
		return dao.newmailcheck(id);
	}

	@Override
	public String selectAdmin(String id) {
		return dao.selectAdmin(id);
	}

	@Override
	public void clientUpdate(ClientMemberVo vo) {
		dao.clientUpdate(vo);
	}

	@Override
	public void clientDelete(String id) {
		dao.clientDelete(id);
	}

	@Override
	public void insertmail(mailVo vo) {
		dao.insertmail(vo);
	}
	@Override
	public int idcheck(String id) {
		int result = dao.idcheck(id);
		return result;
	}

	@Override
	public int emailcheck(String email) {
		int result = dao.emailcheck(email);
		return result;
	}
	
	@Override
	public String getName(String id) {
		return dao.getName(id);
	}
}
