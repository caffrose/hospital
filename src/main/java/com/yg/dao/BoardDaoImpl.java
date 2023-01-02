package com.yg.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void write(BoardVo vo) {
		sqlSession.insert("com.yg.mapper.BoardMapper.insert",vo);
	}

	@Override
	public void update(BoardVo vo) {
		sqlSession.update("com.yg.mapper.BoardMapper.update",vo);
	}

	@Override
	public BoardVo selectOne(int bno) {
		return sqlSession.selectOne("com.yg.mapper.BoardMapper.selectOne",bno);
	}

	@Override
	public List<BoardVo> selectAll() {
		return sqlSession.selectList("com.yg.mapper.BoardMapper.selectAll");
	}

	@Override
	public int selectBno(String title, String content) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);
		return sqlSession.selectOne("com.yg.mapper.BoardMapper.selectBno",map);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("com.yg.mapper.BoardMapper.delete",bno);
		
	}

	@Override
	public void updateExfile(BoardVo vo) {
		sqlSession.update("com.yg.mapper.BoardMapper.updateExfile",vo);
		
	}

	@Override
	public int selectBoardSize() {
		return sqlSession.selectOne("com.yg.mapper.BoardMapper.selectBoardSize");
	}

	@Override
	public List<BoardVo> selectBoardPaging(int sizeOfPage, int startNum) {
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("sizeOfPage", sizeOfPage);
		map.put("startNum", startNum);
		return sqlSession.selectList("com.yg.mapper.BoardMapper.selectBoardPaging",map);
	}
	
	

}
