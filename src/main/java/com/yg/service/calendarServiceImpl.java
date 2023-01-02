package com.yg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.calendar;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.calendarVo;
import com.yg.vo.countCalendarVo;

@Service
public class calendarServiceImpl implements calendarService {
	@Autowired
	calendar dao;
	
	@Override
	public void insert(calendarVo vo) {
		dao.insert(vo);

	}

	@Override
	public List<DoctorMemberVo> showdoctor(String[] time,String startDate, String gethospital){
		List<DoctorMemberVo> list=null;
		list=dao.showdoctor(time,startDate,gethospital);
		return list;
	}
	
	@Override
	public List<DoctorMemberVo> showdoctorbydptime(String gethospital, String dow, String time) {
		List<DoctorMemberVo> list2=null;
		list2=dao.showdoctorbydptime(gethospital, dow, time);
		return list2;
	}
	
	@Override
	public List<calendarVo> showEvents(int doctorNum) {
		return dao.showEvents(doctorNum);
		
	}

	@Override
	public int allEvents() {
		return dao.countCalendar();
	}

	@Override
	public int checkCalendar(calendarVo vo) {
		return dao.checkCalendar(vo);
	}

	@Override
	public void deleteCalendar(int cNum) {
		dao.deleteCalendar(cNum);
		
	}
	
	
	@Override
	public List<calendarVo> findDoctor(String startDate, String endDate) {
		return dao.findDoctor(startDate, endDate);
	}

	
	@Override
	public int eventDoctor(String startDate, String endDate) {
		return dao.eventDoctor(startDate, endDate);
	}
	
	
	@Override
	public int allDoctor() {
		return dao.allDoctor();
	}

	//?��?��
	@Override
	public List<countCalendarVo> showEventsAll(String gethospital) {
		return dao.showEventsAll(gethospital);
		
	}

	@Override
	public void insertCountCalendar(countCalendarVo vo) {
		dao.insertCountCalendar(vo);
		
	}

	@Override
	public int ifCountCalendar(String part, String startDate) {
		return dao.ifCountCalendar(part, startDate);
	}

	@Override
	public void updateCount(String part, String startDate) {
		dao.updateCount(part, startDate);
		
	}
	

	@Override	
	public int getdoctorNum(String id) {
		return dao.getdoctorNum(id);
	}

	@Override
	public List<calendarVo> showdoctorevent(int doctorNum) {
		return dao.showdoctorevent(doctorNum);
	}

	@Override
	public calendarVo showpatientinfotodoctor(String startFormat, String endFormat, int doctorNum) {
		return dao.showpatientinfotodoctor(startFormat, endFormat, doctorNum);
	}
	
	@Override
	   public void blockdoctortime(calendarVo vo) {
	      dao.blockdoctortime(vo);
	   }

	@Override
	public void deletecount(String start, int doctorNum) {
		dao.deletecount(start,doctorNum);
	}
	
//추가
	@Override
	public List<calendarVo> clientreportfinish(String id) {
		return dao.clientreportfinish(id);
	}
	
	@Override
	public List<calendarVo> clientreportnotfinish(String id) {
		return dao.clientreportnotfinish(id);
	}

	@Override
	public void insertstarpoint(String doctor_id, double starpoint, String startDate) {
		dao.insertstarpoint(doctor_id, starpoint,startDate);
	}
	@Override
	public void updateFinish(int cnum) {
		dao.updateFinish(cnum);
	}
}
