package com.yg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.AdminDaoImpl;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDaoImpl aDao;
	
	@Override
	public void doctor_approve(String id) {
		aDao.doctor_approve(id);
	}
	

}
