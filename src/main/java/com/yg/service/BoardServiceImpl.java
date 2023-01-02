package com.yg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.BoardDaoImpl;
import com.yg.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDaoImpl bDao;
	
	@Override
	public void write(BoardVo vo) {
		bDao.write(vo);
	}

	@Override
	public void update(BoardVo vo) {
		bDao.update(vo);
	}

	@Override
	public BoardVo selectOne(int bno) {
		return bDao.selectOne(bno);
	}

	@Override
	public List<BoardVo> selectAll() {
		return bDao.selectAll();
	}

	@Override
	public int selectBno(String title, String content) {
		return bDao.selectBno(title, content);
	}

	@Override
	public void delete(int bno) {
		bDao.delete(bno);
	}

	@Override
	public void updateExfile(BoardVo vo) {
		bDao.updateExfile(vo);
		
	}

	@Override
	public int selectBoardSize() {
		return bDao.selectBoardSize();
	}

	@Override
	public List<BoardVo> selectBoardPaging(int sizeOfPage, int startNum) {
		return bDao.selectBoardPaging(sizeOfPage, startNum);
	}
	

}
