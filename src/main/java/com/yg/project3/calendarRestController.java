package com.yg.project3;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yg.service.ClientMemberService;
import com.yg.service.DiseaseService;
import com.yg.service.DoctorMemberService;
import com.yg.service.calendarService;
import com.yg.vo.DescriptionVo;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.calendarVo;
import com.yg.vo.countCalendarVo;
import com.yg.vo.mailVo;

@RestController
@RequestMapping(value="/rest", produces="application/json; charset=UTF-8")
public class calendarRestController {
	@Autowired
	calendarService cservice;
	
	@Autowired
	DiseaseService dservice;
	
	@Autowired
	DoctorMemberService service;
	
	@Autowired
	ClientMemberService cmservice;
	
//변경
	@RequestMapping("/insert")
	public Map<String,String> insert(HttpServletRequest request, @RequestBody Map<String,String> param){
		HttpSession session=request.getSession();
		String title = "일정";
		String start = param.get("start");
		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 Date date=null;
		try {
			date = dateFormat.parse(start);
		} catch (ParseException e) {
			e.printStackTrace();
		}//You will get date object relative to server/client timezone wherever it is parsed
		 DateFormat formatter = new SimpleDateFormat("E HH:mm:ss"); //If you need time just put specific format for time like 'HH:mm:ss'
		 String startDay = formatter.format(date);
		 
		 String startDate[] = startDay.split(" ");
			
			switch(startDate[0]) {
			case "월":
				startDate[0]= "Mon";
				break;
			case "화":
				startDate[0]= "Tue";
				break;
			case "수":
				startDate[0]= "Wed";
				break;
			case "목":
				startDate[0]= "Thu";
				break;
			case "금":
				startDate[0]= "Fri";
				break;
			case "토":
				startDate[0]= "Sat";
				break;
			case "일":
				startDate[0]= "Sun";
				break;
			}	
		 
		String end = param.get("end");
		String part=param.get("department");
		String dno2=param.get("dno");
		String type=param.get("type");
		List<DoctorMemberVo> list=cservice.showdoctorbydptime(part, startDate[0], startDate[1]);
		int dno=Integer.parseInt(dno2);
 		String mid=(String)session.getAttribute("id");
		String related=(String) session.getAttribute("getRelated");
		String diseaseName=(String) session.getAttribute("getName");
		calendarVo vo = new calendarVo();
		vo.setTitle(title);
		vo.setStartDate(start);
		vo.setEndDate(end);
		vo.setDoctorNum(dno);
		vo.setMid(mid);
		vo.setDiseaseName(diseaseName);
		vo.setRelated(related);
		vo.setType(type);
		cservice.insert(vo);
		if(cservice.ifCountCalendar(part, start)==0) {
			countCalendarVo cvo = new countCalendarVo();
			cvo.setPart(part);
			cvo.setStartDate(start);
			cvo.setEndDate(end);
			cvo.setDoctorcount(list.size());
			cservice.insertCountCalendar(cvo);
			System.out.println("count"+ cvo.getCount());
			System.out.println("doctorcount"+cvo.getDoctorcount());
		}else {
			cservice.updateCount(part, start);
		}
		
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("title_from_server",title);
		map.put("start_from_server",start);
		map.put("end_from_server",end);
		return map;
			
	}

	@RequestMapping("/delete")	//변경(calendarVo도 변경)
	public Map<String,String> delete(@RequestBody Map<String,String> param) throws ParseException{
		int doctorNum = Integer.parseInt(param.get("doctorNum"));
		String start = param.get("start");
		String end = param.get("end");
		String mid=param.get("mid");
		
		calendarVo vo = new calendarVo(start, end,doctorNum, mid);
		int cNum = cservice.checkCalendar(vo);
		cservice.deleteCalendar(cNum);
		cservice.deletecount(start, doctorNum);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("title_from_server","성공");
		return map;
	}
	@RequestMapping("/blockdoctortime")
	   public Map<String,String> blockdoctortime(@RequestBody Map<String,String> param) {
	      int doctorNum = Integer.parseInt(param.get("doctorNum"));
	      String start = param.get("start");
	      String end = param.get("end");
	      String title=param.get("title");
	      
	      calendarVo vo=new calendarVo();
	      vo.setDoctorNum(doctorNum);
	      vo.setStartDate(start);
	      vo.setEndDate(end);
	      vo.setTitle(title);
	      //calendarVo vo = new calendarVo(start, end,doctorNum, title);
	      cservice.blockdoctortime(vo);
	      HashMap<String,String> map = new HashMap<String,String>();
	      map.put("title_from_server","성공");
	      return map;
	   }
	
	//추가
	@RequestMapping(value="/selectPart", produces = "application/json; charset=utf-8")
	public List<DescriptionVo> selectpart(String part, HttpSession session) {
//		System.out.println("들어옴");
		List<DescriptionVo> list = dservice.showsymptom(part);//==>
		
		session.setAttribute("part", part);
//		System.out.println(part);
//		System.out.println(list.toString());
		for(int i=0; i<=list.size()-1; i++) {
			//System.out.println(list.get(i).getSymptom());
		}
		return list;
	}

//추가됨
	@RequestMapping("/sendurl")
	public Map<String,String> updateUrl(@RequestBody Map<String,String> param,HttpSession session) {
		String mid = param.get("mid");
		
		
		String type= param.get("type");
		String url = param.get("url");
		String startDate = param.get("startDate");
		System.out.println(startDate);
		System.out.println(mid);
		System.out.println(type);
		System.out.println(url);
		mailVo vo = new mailVo();
		String id = (String)session.getAttribute("id");
		vo.setMemberid(mid);
		vo.setDoctorid(id);
		vo.setContent(url);
		vo.setDatetime(startDate);
		cmservice.insertmail(vo);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id_from_server",id);
		return map;
	}
//추추추가
	@RequestMapping(value = "/clientidcheck", method = RequestMethod.GET)
	@ResponseBody
	public int idcheck(@RequestParam String id) {
		System.out.println(id);
		int result = cmservice.idcheck(id);
		return result;
	}
	
	@RequestMapping("/clientemailcheck")
	public int emailcheck(@RequestParam String email) {
		System.out.println(email);
		int result = cmservice.emailcheck(email);
		return result;
	}
	
	@RequestMapping(value = "/doctoridcheck", method = RequestMethod.GET)
	@ResponseBody
	public int doctoridcheck(@RequestParam String id) {
		System.out.println(id);
		int result = service.idcheck(id);
		return result;
	}
	
	@RequestMapping("/doctoremailcheck")
	public int doctoremailcheck(@RequestParam String email) {
		System.out.println(email);
		int result = service.emailcheck(email);
		return result;
	}
}
