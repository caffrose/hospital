package com.yg.dao;

import java.util.List;

import com.yg.vo.DoctorMemberVo;
import com.yg.vo.calendarVo;
import com.yg.vo.countCalendarVo;

public interface calendar {
	public void insert(calendarVo vo);
	public List<calendarVo> showEvents(int doctorNum);
	public int countCalendar();
	public int checkCalendar(calendarVo vo);
	public void deleteCalendar(int cNum);
	public List<calendarVo> findDoctor(String startDate, String endDate);
	public int eventDoctor(String startDate, String endDate);
	public int allDoctor();
	public List<DoctorMemberVo> showdoctor(String[] time,String startDate, String gethospital);
	public List<DoctorMemberVo> showdoctorbydptime(String gethospital, String dow, String time);
	public List<countCalendarVo> showEventsAll(String gethospital);
	
	public void insertCountCalendar(countCalendarVo vo);
	public int ifCountCalendar(String part, String startDate);
	public void updateCount(String part, String startDate);
	
	public int getdoctorNum(String id);
	public List<calendarVo> showdoctorevent(int doctorNum);
	public calendarVo showpatientinfotodoctor(String startFormat, String endFormat, int doctorNum);
	public void blockdoctortime(calendarVo vo);
	public void deletecount(String start,int doctorNum);
	
	//추가
	public List<calendarVo> clientreportfinish(String id);
	public List<calendarVo> clientreportnotfinish(String id);
	public void insertstarpoint(String doctor_id, double starpoint, String startDate);
	
//추추추추가
	public void updateFinish(int cnum);
}
