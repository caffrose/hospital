package com.yg.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void doctor_approve(String id) {
		sqlSession.update("com.yg.mapper.AdminMapper.doctor_approve",id);
	}
	

}
