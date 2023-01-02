package com.yg.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.vo.ClientMemberVo;
import com.yg.vo.mailVo;

@Repository
public class ClientMemberDaoImpl implements ClientMemberDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void clientRegister(ClientMemberVo vo) {
		sqlSession.insert("com.yg.mapper.MemberMapper.register", vo);
	}

	@Override
	public ClientMemberVo clientSelect(String id) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.selectclient", id);
	}

	@Override
	public int login(String id, String pw) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("pw", pw);
		int result = sqlSession.selectOne("com.yg.mapper.MemberMapper.memberLogin",hMap);
		return result;
	}

	@Override
	public int naver_login(String naver_id) {
		int result = sqlSession.selectOne("com.yg.mapper.MemberMapper.memberNaverLogin",naver_id);
		return result;
	}

	@Override
	public ClientMemberVo clientSelect_naver(String naver_id) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.selectclient_naver",naver_id);
	}
	@Override
	public ClientMemberVo clientSelect_kakao(String kakao_nickname) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.selectclient_kakao",kakao_nickname);
	}

	@Override
	public int kakao_login(String kakao_nickname) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.memberkakaoLogin",kakao_nickname);
	}

	@Override
	public String findId(String name, String email) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("email",email);
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.findId",map);
	}

	@Override
	public String findPw(String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.findPw",map);
	}

	@Override
	public void updatePw(String pw, String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("pw", pw);
		map.put("id", id);
		map.put("email", email);
		sqlSession.update("com.yg.mapper.MemberMapper.updatePw",map);
	}

	@Override
	public int clientPwCheck(String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.clientPwCheck",map);
	}

	@Override
	public String selectName(String id) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.selectName",id);
	}
	
	@Override
	public List<mailVo> selectmymail(String id) {
		return sqlSession.selectList("com.yg.mapper.MemberMapper.selectmymail",id);
	}

	@Override
	public void updatehitcount(int num) {
		sqlSession.update("com.yg.mapper.MemberMapper.updatehitcount",num);
	}

	@Override
	public mailVo showmaildetail(int num) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.showmaildetail",num);
	}

	@Override
	public int newmailcheck(String id) {
		List<Integer> list=sqlSession.selectList("com.yg.mapper.MemberMapper.newmailcheck",id);
		int count=0;
		for(int i=0;i<list.size();i++) {
			if(list.get(i)==0)
				count++;
		}
		return count;
	}
	
	@Override
	public String selectAdmin(String id) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.selectAdmin",id);
	}

	@Override
	public void clientUpdate(ClientMemberVo vo) {
		sqlSession.update("com.yg.mapper.MemberMapper.clientUpdate",vo);
		
	}

	@Override
	public void clientDelete(String id) {
		sqlSession.delete("com.yg.mapper.MemberMapper.clientDelete",id);
	}
	@Override
	public void insertmail(mailVo vo) {
		sqlSession.insert("com.yg.mapper.MemberMapper.insertmail",vo);
	}
	@Override
	public int idcheck(String id) {
		int result = sqlSession.selectOne("com.yg.mapper.MemberMapper.idcheck", id);
		return result;
	}

	@Override
	public int emailcheck(String email) {
		int result = sqlSession.selectOne("com.yg.mapper.MemberMapper.emailcheck", email);
		return result;
	}
	
	@Override
	public String getName(String id) {
		return sqlSession.selectOne("com.yg.mapper.MemberMapper.getName", id);
	}
}
