package com.yg.service;

import java.util.List;

import com.yg.vo.BoardVo;

public interface BoardService {
	public void write(BoardVo vo);
	public void update(BoardVo vo);
	BoardVo selectOne(int bno);
	public List<BoardVo> selectAll();
	int selectBno(String title, String content);
	public void delete(int bno);
	public void updateExfile(BoardVo vo);
	int selectBoardSize();
	public List<BoardVo> selectBoardPaging(int sizeOfPage, int startNum);
}
