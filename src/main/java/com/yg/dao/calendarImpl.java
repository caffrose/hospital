package com.yg.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.vo.DoctorMemberVo;
import com.yg.vo.calendarVo;
import com.yg.vo.countCalendarVo;

@Repository
public class calendarImpl implements calendar {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(calendarVo vo) {

		sqlSession.insert("com.yg.mapper.Mapper.insertCalendar",vo);

	}

	@Override
	public List<calendarVo> showEvents(int doctorNum) {
		return sqlSession.selectList("com.yg.mapper.Mapper.showCalendar", doctorNum);
		
	}
	
	@Override
	   public List<DoctorMemberVo> showdoctor(String[] time,String startDate, String gethospital) {
	      List<DoctorMemberVo> list=null;
	      String dow=time[0];
	      String month=time[1];
	      String day=time[2];
	      String time22=time[4];
	      String dowtime =dow+"_"+time22;
	      
	      String[] department =gethospital.split(", ");
	      List<String> depart= new ArrayList<String>();
	      for(int i=0;i<department.length;i++) {
	         depart.add(department[i]);
	      }
	      
	      Map<String, Object> map= new HashMap<String, Object>();
	      map.put("dowtime", dowtime);
	      map.put("depart", depart);
	      
	      list =sqlSession.selectList("com.yg.mapper.Mapper.selectdoctor",map);
	      
	      DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	      Date date=null;
	      try {
	         date = dateFormat.parse(startDate);
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }//You will get date object relative to server/client timezone wherever it is parsed
	      DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //If you need time just put specific format for time like 'HH:mm:ss'
	      String startDay = formatter.format(date);
	      List<Integer> dno=sqlSession.selectList("com.yg.mapper.Mapper.selectdoctor2", startDay);
	      
	      for(int i=0;i<list.size();i++) {
	         for(int j=0;j<dno.size();j++) {
	            if(list.get(i).getDoctor_id()==dno.get(j)) {
	               list.remove(i);
	               if(i!=0) i--;
	            }
	         }
	      }
	      
	      return list;
	   }
	
	@Override
	public List<DoctorMemberVo> showdoctorbydptime(String gethospital, String dow, String time) {
		String dowtime=dow+"_"+time;
		
		List<DoctorMemberVo> list=null;
		
		String[] department =gethospital.split(", ");
		List<String> depart= new ArrayList<String>();
		for(int i=0;i<department.length;i++) {
			depart.add(department[i]);
		}
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("depart", depart);
		map.put("dowtime", dowtime);
		
		list =sqlSession.selectList("com.yg.mapper.Mapper.selectdoctor",map);
		return list;
		
	}

	@Override
	public int countCalendar() {
		return sqlSession.selectOne("com.yg.mapper.Mapper.countCalendar");
	}

	@Override
	public int checkCalendar(calendarVo vo) {
		return sqlSession.selectOne("com.yg.mapper.Mapper.checkCalendar",vo);
	}

	@Override
	public void deleteCalendar(int cNum) {
		sqlSession.delete("com.yg.mapper.Mapper.deleteCalendar",cNum);
		
	}
	
	
	@Override
	public List<calendarVo> findDoctor(String startDate, String endDate) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		return sqlSession.selectList("com.yg.mapper.Mapper.findDoctor",map);
	}
	
	

	@Override
	public int eventDoctor(String startDate, String endDate) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		return sqlSession.selectOne("com.yg.mapper.Mapper.eventDoctor",map);
	}
	
	

	@Override
	public int allDoctor() {
		return sqlSession.selectOne("com.yg.mapper.Mapper.allDoctor");
	}

	@Override
	   public List<countCalendarVo> showEventsAll(String gethospital) {
	      String[] department =gethospital.split(", ");
	      List<String> depart= new ArrayList<String>();
	      for(int i=0;i<department.length;i++) {
	         depart.add(department[i]);
	      }
	      
	      Map<String, Object> map= new HashMap<String, Object>();
	      map.put("depart", depart);
	      return sqlSession.selectList("com.yg.mapper.Mapper.showCalendarAll",map);
	      
	   }

	@Override
	public void insertCountCalendar(countCalendarVo vo) {
		sqlSession.insert("com.yg.mapper.Mapper.insertCountCalendar",vo);
		
	}

	@Override
	public int ifCountCalendar(String part,String startDate) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startDate",startDate);
		map.put("part",part);
		return sqlSession.selectOne("com.yg.mapper.Mapper.ifCountCalendar",map);
	}

	@Override
	public void updateCount(String part, String startDate) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startDate",startDate);
		map.put("part",part);
		sqlSession.update("com.yg.mapper.Mapper.updateCount",map);
		
	}

	@Override	
	public int getdoctorNum(String id) {
		System.out.println("id : "+id);
		return sqlSession.selectOne("com.yg.mapper.Mapper.getdoctorNum",id);
	}

	@Override
	public List<calendarVo> showdoctorevent(int doctorNum) {
		return sqlSession.selectList("com.yg.mapper.Mapper.showdoctorevent",doctorNum);
	}

	@Override
	public calendarVo showpatientinfotodoctor(String startFormat, String endFormat, int doctorNum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startDate", startFormat);
		map.put("endDate", endFormat);
		map.put("doctorNum", doctorNum);
		return sqlSession.selectOne("com.yg.mapper.Mapper.showpatientinfotodoctor",map);
	}

	@Override
	   public void blockdoctortime(calendarVo vo) {
	      sqlSession.insert("com.yg.mapper.Mapper.blockdoctortime",vo);
	   }
	
	@Override
	public void deletecount(String start, int doctorNum) {
		String part=sqlSession.selectOne("com.yg.mapper.Mapper.getdoctorpart",doctorNum);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startDate", start);
		map.put("part", part);
		int count=sqlSession.selectOne("com.yg.mapper.Mapper.getcount",map);
		if(count==1) {
			sqlSession.delete("com.yg.mapper.Mapper.deletecount",map);
		} else {
			sqlSession.update("com.yg.mapper.Mapper.updatecountfordelete",map);
		}
	}
	

	@Override
	public List<calendarVo> clientreportfinish(String id) {
		return sqlSession.selectList("com.yg.mapper.Mapper.clientreportfinish",id);
	}
	
	@Override
	public List<calendarVo> clientreportnotfinish(String id) {
		return sqlSession.selectList("com.yg.mapper.Mapper.clientreportnotfinish",id);
	}

	@Override
	public void insertstarpoint(String doctor_id, double starpoint, String startDate) {
		double dstarpoint=sqlSession.selectOne("com.yg.mapper.Mapper.selectstarpoint",doctor_id);
		int starpointcount=sqlSession.selectOne("com.yg.mapper.Mapper.selectstarpointcount",doctor_id);
		double sum=dstarpoint*starpointcount;
		sum+=starpoint;
		starpointcount+=1;
		double result=sum/(starpointcount);
		result=Math.round(result*10)/10.0;
		
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("doctor_id", doctor_id);
		map.put("starpoint", result);
		map.put("starpointcount", starpointcount);
		map.put("startDate", startDate);
		sqlSession.update("com.yg.mapper.Mapper.insertstarpoint",map);
		sqlSession.update("com.yg.mapper.Mapper.updatecalendarfinish",map);
		
	}
	@Override
	public void updateFinish(int cnum) {
		sqlSession.update("com.yg.mapper.Mapper.updateFinish", cnum);
	}
}
