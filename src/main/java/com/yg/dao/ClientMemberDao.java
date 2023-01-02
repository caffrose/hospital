package com.yg.dao;

import java.util.List;

import com.yg.vo.ClientMemberVo;
import com.yg.vo.mailVo;

public interface ClientMemberDao {
	public void clientRegister(ClientMemberVo vo);
	public ClientMemberVo clientSelect(String id);
	public ClientMemberVo clientSelect_naver(String naver_id);
	int login(String id, String pw);
	int naver_login(String naver_id);
	int kakao_login(String kakao_nickname);
	public ClientMemberVo clientSelect_kakao(String kakao_nickname);
	String findId(String name,String email);
	String findPw(String id, String email);
	public void updatePw(String pw, String id,String email);
	int clientPwCheck(String id, String email);
	String selectName(String id);
	String selectAdmin(String id);
	public void clientUpdate(ClientMemberVo vo);
	public void clientDelete(String id);
	
//추가
	public void insertmail(mailVo vo);
	public List<mailVo> selectmymail(String id);
	public void updatehitcount(int num);
	public mailVo showmaildetail(int num);
	public int newmailcheck(String id);
	
//추추추가
	public int idcheck(String id);
	public int emailcheck(String email);
	
	public String getName(String id);
}
