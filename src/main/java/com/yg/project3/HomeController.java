package com.yg.project3;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.protobuf.TextFormat.ParseException;
import com.yg.service.AdminServiceImpl;
import com.yg.service.BoardServiceImpl;
import com.yg.service.ClientMemberService;
import com.yg.service.DiseaseService;
import com.yg.service.DoctorMemberService;
import com.yg.service.KakaoService;
import com.yg.service.calendarService;
import com.yg.vo.BoardVo;
import com.yg.vo.ClientMemberVo;
import com.yg.vo.DescriptionVo;
import com.yg.vo.DiseaseVo;
import com.yg.vo.DoctorMemberVo;
import com.yg.vo.FieldVo;
import com.yg.vo.calendarVo;
import com.yg.vo.mailVo;

@Controller
public class HomeController {
	
	@Autowired
	calendarService service;
	
	@Autowired
	DiseaseService service2;
	
	@Autowired
	AdminServiceImpl aService;
	
	@Autowired
    private KakaoService kakaoService;
	
	@Autowired
	ClientMemberService cService;
	
	@Autowired
	DoctorMemberService dService;
	
	@Autowired
	BoardServiceImpl bservice;
    /* NaverLoginBO */
    private NaverLoginBo naverLoginBo;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
        this.naverLoginBo = naverLoginBo;
    }
	
    @RequestMapping("/")
	public String home(HttpSession session) {
    	List<DoctorMemberVo> list=dService.getRank();
    	session.setAttribute("list",list);
		return "home";
	}
    
    @RequestMapping("/login")
    public String login(Model model,HttpSession session){
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        session.setAttribute("url", naverAuthUrl);
        model.addAttribute("url", naverAuthUrl);
        
        /* 생성한 인증 URL을 View로 전달 */
       return "login";
    }
    
    @RequestMapping("/kakaologin")
    public String home(@RequestParam(value = "code", required = false) String code, Model model,HttpSession session) throws Exception{
       session.removeAttribute("approve");
       System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
        String who = (String)session.getAttribute("who");
        int kakao_login_client = cService.kakao_login(""+userInfo.get("nickname"));
        int kakao_login_doctor = dService.kakao_login(""+userInfo.get("nickname"));
        System.out.println(kakao_login_client);
        System.out.println(kakao_login_doctor);
        session.setAttribute("kakao_nickname", userInfo.get("nickname")+"");
        System.out.println(session.getAttribute("kakao_nickname"));
        model.addAttribute("info", userInfo);
        String approve = "";
        if(kakao_login_doctor==1) {
           DoctorMemberVo vo = dService.doctorSelect_kakao(""+userInfo.get("nickname"));
           approve = dService.selectApprove(vo.getId());
        }
        System.out.println(approve);
        if(kakao_login_client==0&&kakao_login_doctor==1&&approve.equals("대기중")) {
           session.setAttribute("approve", "대기중");
           return "redirect:/doctorlogin";
        }else if(kakao_login_doctor==0&&kakao_login_client==0) {
           return "redirect:/register";
        }else if(kakao_login_doctor==0&&kakao_login_client>=1) {
           session.setAttribute("who", "client");
           ClientMemberVo vo = cService.clientSelect_kakao(""+userInfo.get("nickname"));
           session.setAttribute("id", vo.getId());
           session.setAttribute("name", vo.getName());
           return "redirect:/";
        }else if(kakao_login_doctor>=1&&kakao_login_client==0){
           session.setAttribute("who", "doctor");
           DoctorMemberVo vo = dService.doctorSelect_kakao(""+userInfo.get("nickname"));
           session.setAttribute("id", vo.getId());
           session.setAttribute("name", vo.getName());
           return "redirect:/";
        }else {
           return "redirect:/";
        }
        
    }
    
    
  //client & doctorloginAction 다 지우고 하나로 통일	

  	@RequestMapping("/loginAction")
  	public String loginAction(HttpServletRequest request, String id, String pw, HttpSession session) {
  		String option = request.getParameter("loginoption");
  		if(null==option) {
            session.setAttribute("option", "n");
            return "redirect:/login";
         }
  		session.setAttribute("who", option);
  		String type = cService.selectAdmin(id);
  		if(option.equals("client")) {
  			int result = 0;
  	        if(id!=null) {
  	        	result = cService.login(id, pw);
  	        }
  	        if(result>=1&&("admin").equals(type)) {
  	        	String name = cService.selectName(id);
  	        	session.setAttribute("id", id);
  	        	session.setAttribute("type", type);
  	        	session.setAttribute("name",name);
  	        	return "Admin";
  	        }else if(result>=1) {
  	        	session.setAttribute("clientlogin", "성공");
  	        	String name = cService.selectName(id);
  	        	session.setAttribute("id", id);
  	        	session.setAttribute("name", name);
  	        }else {
  	        	session.setAttribute("clientlogin", "실패");
  	        }
  			return "clientLoginResult";
  		}else if(option.equals("doctor")) {
  			int result = 0;
  			String approve = dService.selectApprove(id);
  	        if(id!=null) {
  	        	result = dService.login(id, pw);
  	        }
	  	    if(result>=1&&approve.equals("대기중")) {
	  	    	session.setAttribute("approve","대기중");
	          	return "redirect:/login";
	        }else if(result>=1) {
  	        	session.setAttribute("doctorlogin", "성공");
  	        	String name = dService.selectName(id);
  	        	session.setAttribute("name", name);
  	        	session.setAttribute("id", id);
  	        }else {
  	        	session.setAttribute("doctorlogin", "실패");
  	        }
  			return "doctorLoginResult";
  		}
  		return "login";
  	}
    
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("name");
    	session.removeAttribute("who");
    	session.removeAttribute("id");
    	return "home";
    }
    @RequestMapping(value="/findClientId")
    public String findClientId() {
    	return "findClientIdForm";
    }
    @RequestMapping(value="/findClientIdAction")
    public String findClientIdAction(String name,String email,HttpSession session) {
    	String id = cService.findId(name, email);
    	session.setAttribute("findId",id);
    	return "findClientIdView";
    }
    @RequestMapping(value="/updateClientPw")
    public String updateClientPw(HttpSession session) {
    	session.removeAttribute("Check");
    	session.removeAttribute("updatePw");
    	return "updateClientPwForm1";
    }
    @RequestMapping(value="/updateDoctorPw")
    public String updateDoctorPw(HttpSession session) {
    	session.removeAttribute("Check");
    	session.removeAttribute("updatePw");
    	return "updateDoctorPwForm1";
    }
    
    @RequestMapping(value="/clientPwCheck")
    public String clientPwCheckAction(String id, String email,HttpSession session) {
    	int num = cService.clientPwCheck(id, email);
    	if(num==0) {
    		session.setAttribute("Check","n");
    		return "updateClientPwForm1";
    	}else{
    		session.setAttribute("pwUpdateId", id);
    		session.setAttribute("pwUpdateEmail", email);
    		return "updateClientPwForm2";
    	}
    }
    @RequestMapping(value="/doctorPwCheck")
    public String doctorPwCheckAction(String id, String email,HttpSession session) {
    	int num = dService.doctorPwCheck(id, email);
    	if(num==0) {
    		session.setAttribute("Check","n");
    		return "updateDoctorPwForm1";
    	}else{
    		session.setAttribute("pwUpdateId", id);
    		session.setAttribute("pwUpdateEmail", email);
    		return "updateDoctorPwForm2";
    	}
    }
    @RequestMapping(value="/updateClientPwAction")
    public String updateClientPwAction(String pw,String pwc,HttpSession session) {
    	if(pw.equals(pwc)) {
    		session.setAttribute("updatePw", "y");
    		String id = (String)session.getAttribute("pwUpdateId");
    		String email = (String)session.getAttribute("pwUpdateEmail");
    		cService.updatePw(pw, id, email); 
    	}else {
    		session.setAttribute("updatePw", "n");
    	}
    	return "updateClientPwForm2";
    }
    @RequestMapping(value="/updateDoctorPwAction")
    public String updateDoctorPwAction(String pw,String pwc,HttpSession session) {
    	if(pw.equals(pwc)) {
    		session.setAttribute("updatePw", "y");
    		String id = (String)session.getAttribute("pwUpdateId");
    		String email = (String)session.getAttribute("pwUpdateEmail");
    		dService.updatePw(pw, id, email); 
    	}else {
    		session.setAttribute("updatePw", "n");
    	}
    	return "updateDoctorPwForm2";
    }
    @RequestMapping(value="/findDoctorId")
    public String findDoctorId() {
    	return "findDoctorIdForm";
    }
    @RequestMapping(value="/findDoctorIdAction")
    public String findDoctorIdAction(String name, String email, HttpSession session){
    	String id = dService.findId(name, email);
    	session.setAttribute("findId",id);
    	return "findDoctorIdView";
    }
   
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String naverlogin(Model model, HttpSession session) {
    	
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
    	String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
    	
    	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
    	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
    	System.out.println("네이버:" + naverAuthUrl);
    	
    	//네이버 
    	session.setAttribute("url", naverAuthUrl);
    	model.addAttribute("url", naverAuthUrl);
    	
    	/* 생성한 인증 URL을 View로 전달 */
    	return "naverlogin";
    }
    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
       session.removeAttribute("approve");
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBo.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBo.getUserProfile(oauthToken);
        System.out.println(apiResult);
        model.addAttribute("result", apiResult);
     //   String jsonString = apiResult;
        

       
        
        JsonParser parser = new JsonParser(); 
        JsonElement element = parser.parse(apiResult); 
        JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject(); 
//        String name = response.getAsJsonObject().get("name").getAsString(); 
//        String email = response.getAsJsonObject().get("email").getAsString(); 
        String id = response.getAsJsonObject().get("id").getAsString(); 
        
        System.out.println(id);
       
        session.setAttribute("naver_id",id);
//        naverUserInfo.put("name", name); 
//        naverUserInfo.put("email", email); 
//        naverUserInfo.put("id", id);

        
//        String who = (String)session.getAttribute("who");
//        String naver_id = apiResul
        /* 네이버 로그인 성공 페이지 View 호출 */
        int naver_login_doctor = dService.naver_login(id);
        int naver_login_client = cService.naver_login(id);
        System.out.println(naver_login_doctor);
        System.out.println(naver_login_client);
        String approve = "";
        if(naver_login_doctor==1) {
           DoctorMemberVo vo = dService.doctorSelect_naver(id);
           approve = dService.selectApprove(vo.getId());
        }
        System.out.println(approve);
        if(naver_login_client==0&&naver_login_doctor>=1&&approve.equals("대기중")) {
           session.setAttribute("approve", "대기중");
           return "redirect:/doctorlogin";
        }else if(naver_login_doctor==0&&naver_login_client==0) {
           return "redirect:/register";
        }else if(naver_login_doctor==0&&naver_login_client>=1) {
           session.setAttribute("who", "client");
           ClientMemberVo vo = cService.clientSelect_naver(id);
           session.setAttribute("id", vo.getId());
           session.setAttribute("name", vo.getName());
           return "redirect:/";
        }else if(naver_login_doctor>=1&&naver_login_client==0){
           session.setAttribute("who", "doctor");
           DoctorMemberVo vo = dService.doctorSelect_naver(id);
           session.setAttribute("id", vo.getId());
           session.setAttribute("name", vo.getName());
           return "redirect:/";
        }else {
           return "redirect:/";
        }
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	
	@RequestMapping("/clientRegister")
	public String clientRegister() {
		return "clientregister";
	}
	
	@RequestMapping("/clientRegisterAction")
	public String clientRegisterAction(@ModelAttribute("vo") ClientMemberVo vo, HttpSession session) {
		System.out.println(vo.getKakao_nickname());
		cService.clientRegister(vo);
		session.setAttribute("login_id", vo.getId());
		return "redirect:/clientInfo";
	}
	@RequestMapping("/clientInfo")
	public String clientInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("login_id");
		ClientMemberVo vo = cService.clientSelect(id);
		model.addAttribute("vo", vo);
		return "result";
	}
	
	@RequestMapping("/doctorRegister")
	public String doctorRegister() {
		return "doctorregister";
	}
	
	@RequestMapping("/doctorRegisterAction2")
	public String doctorRegisterAction(DoctorMemberVo vo,Model model,HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception {
//		MultipartHttpServletRequest multipartRequest = null;
//
//		try{
//		multipartRequest = (MultipartHttpServletRequest)request;
//		}catch(ClassCastException e){
//			e.printStackTrace();
//			return null;
//		}
		
		String name = multipartRequest.getParameter("name");
		String id = multipartRequest.getParameter("id");
		String pw = multipartRequest.getParameter("pw");
		String email = multipartRequest.getParameter("email");
		String address = multipartRequest.getParameter("address");
		String detailaddress = multipartRequest.getParameter("detailaddress");
		String extraaddress = multipartRequest.getParameter("extraaddress");
		String hospitalname = multipartRequest.getParameter("hospitalname");
		String field = multipartRequest.getParameter("field");
		String kakao_nickname = multipartRequest.getParameter("kakao_nickname");
		

System.out.println("들어옴");
		name = new String(vo.getName().getBytes("8859_1"), "UTF-8");
		id = new String(vo.getId().getBytes("8859_1"), "UTF-8");
		pw = new String(vo.getPw().getBytes("8859_1"), "UTF-8");
		email = new String(vo.getEmail().getBytes("8859_1"), "UTF-8");
		address = new String(vo.getAddress().getBytes("8859_1"), "UTF-8");
		detailaddress = new String(vo.getDetailaddress().getBytes("8859_1"), "UTF-8");
		extraaddress = new String(vo.getExtraaddress().getBytes("8859_1"), "UTF-8");
		hospitalname = new String(vo.getHospitalname().getBytes("8859_1"), "UTF-8");
		field = new String(vo.getField().getBytes("8859_1"),"UTF-8");
		kakao_nickname = new String(vo.getKakao_nickname().getBytes("8859_1"),"UTF-8");
		
		vo.setName(name);
		vo.setId(id);
		vo.setPw(pw);
		vo.setEmail(email);
		vo.setAddress(address);
		vo.setDetailaddress(detailaddress);
		vo.setExtraaddress(extraaddress);
		vo.setHospitalname(hospitalname);
		vo.setField(field);
		vo.setKakao_nickname(kakao_nickname);
		System.out.println(name);
		
//		System.out.println(vo.getNaver_id());

		String filePath = session.getServletContext().getRealPath("/resources/images/");
		System.out.println("filePath :"+filePath);
		MultipartFile multipart = vo.getMultipart();
		
		String filename = "(파일없음)";
		if(!multipart.isEmpty()) {
			filename = multipart.getOriginalFilename();
			filename = StringUtils.cleanPath(new String(multipart.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));
			File file = new File(filePath,filename);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		System.out.println(filename);
		vo.setLicense(filename);
		dService.DoctorRegister(vo);
		model.addAttribute("vo",vo);
		return "result";
	}
	
	/*병원찾기*/
	@RequestMapping("/findhospital")
	public String findhospital() {
		return "findhospital";
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session,HttpServletRequest request) {
		String id=(String)session.getAttribute("id");
    	int nnew=cService.newmailcheck(id);
    	request.setAttribute("new", nnew);
		return "mypage";
	}
	//바뀔예정
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String home(Model model) {
		List<DescriptionVo> list = service2.partList();
		model.addAttribute("list", list);
		return "select";
	}
	
	
//변경
	@RequestMapping("/checked")
	public String checked(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		List<DiseaseVo> list1 = service2.selectPart(request.getParameter("part"));
		System.out.println("part:"+request.getParameter("part"));
		System.out.println("list : "+list1);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		for(DiseaseVo vo : list1) {
			map.put(vo.getNum(), 0);
			String[] symptoms = request.getParameterValues("symptom");
			int count = 0;
			for(int i=0; i<symptoms.length; i++) {
				String str = symptoms[i];
				if(vo.getSymptom().contains(str)) {
					count++;
				}
			}
			map.put(vo.getNum(), count);
			
			List<String> list2 = new ArrayList<>();
			for(String symptom : symptoms) {
				list2.add(symptom);
			}
			model.addAttribute("list",list2);
//				System.out.println(map.get(vo.getNum())); 
		}
		List<Integer> keySetList = new ArrayList<>(map.keySet());
		System.out.println("------value------");
		Collections.sort(keySetList, (o1, o2) -> (map.get(o2).compareTo(map.get(o1))));

		for(DiseaseVo vo : list1) {
			if(vo.getNum()==(keySetList.get(0))) {
				System.out.println("환자에게 관련 과: "+vo.getHospital());
				session.setAttribute("gethospital", vo.getHospital());
				System.out.println("의사에게 예상 병명: "+vo.getName());
				session.setAttribute("getName", vo.getName());
				System.out.println("의사에게 관련 질환: "+vo.getRelated());
				session.setAttribute("getRelated", vo.getRelated());
			}
		}
		return "checked";
	}
		
	//추가
	@RequestMapping(value = "/showdoctorcalendar")
	public String showdoctorcalendar(Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		int doctornum=service.getdoctorNum(id);
		System.out.println("doctornum :"+doctornum);
		List<calendarVo> list=service.showdoctorevent(doctornum);
		model.addAttribute("doctorNum", doctornum);
		model.addAttribute("events",list);
		return "doctorcalendar";
	}
	
	//추가
	@RequestMapping(value = "/showpatientinfotodoctor")
	public String showpatientinfotodoctor(Model model,String startFormat, String endFormat, String doctorNum2, HttpSession session) {
		int doctorNum=Integer.parseInt(doctorNum2);
		calendarVo vo=service.showpatientinfotodoctor(startFormat, endFormat, doctorNum);
		String type = vo.getType();
		String id = (String)session.getAttribute("id");
		String url = dService.getUrl(id);
		String chaturl = dService.getChatUrl(id);
		int finish = vo.getFinish();
		String clientid = vo.getMid();
		String name = cService.getName(clientid);
		if(type.equals("video")&&finish==0) {
			model.addAttribute("url", url);
			model.addAttribute("vo",vo);
			model.addAttribute("startFormat",startFormat);
			model.addAttribute("finish", finish);
			model.addAttribute("name", name);
			return "showpatientinfotodoctor_video";
		} else if(type.equals("chat")&&finish==0) {
			model.addAttribute("url", chaturl);
			model.addAttribute("vo",vo);
			model.addAttribute("startFormat",startFormat);
			model.addAttribute("finish", finish);
			model.addAttribute("name", name);
		return "showpatientinfotodoctor_chat";
		}
		model.addAttribute("vo", vo);
		model.addAttribute("startFormat",startFormat);
		model.addAttribute("name", name);
		return "showpatientinfotodoctor";
   }
	
	@RequestMapping(value = "/selecttable")
	public String home(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String gethospital=(String) session.getAttribute("gethospital");
		model.addAttribute("events",service.showEventsAll(gethospital));
		//model.addAttribute("events",service.showEvents(doctorNum));
		
		model.addAttribute(gethospital);		
		return "selecttable";
	}
	
	@RequestMapping(value = "/showdoctorandtime")
	public String showdocotrandtime(HttpServletRequest request, String start,String end, Model model,String startFormat, String endFormat) throws Exception {		
		
		String decodeStart = URLDecoder.decode(start,"UTF-8");
		String[] time=decodeStart.split(" ");
		//0은 요일, 1은 월, 2는 일, 4는 시간
		HttpSession session=request.getSession();
		String gethospital=(String) session.getAttribute("gethospital");
		String[] department =gethospital.split(", ");
		
		
		List<DoctorMemberVo> list=null;
		list=service.showdoctor(time,startFormat, gethospital);
		
		model.addAttribute("list",list);
		model.addAttribute("start",startFormat);
		model.addAttribute("end",endFormat);
		return "showdoctor";
	}
	
	@RequestMapping(value = "/showclientreport")
	public String showclientreport(HttpServletRequest request, Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		List<calendarVo> finish=service.clientreportfinish(id);
		List<calendarVo> notfinish=service.clientreportnotfinish(id);
		
		model.addAttribute("service", dService);	//추가됨
		model.addAttribute("finish",finish);
		model.addAttribute("notfinish",notfinish);
		return "showclientreport";
	}
	
	@RequestMapping(value = "/insertstarpoint")
	public String insertstarpoint(HttpServletRequest request, Model model, String doctor_id, String startDate) {
		model.addAttribute("doctor_id",doctor_id);
		model.addAttribute("startDate",startDate);
		return "insertstarpoint";
	}
	
	@RequestMapping(value = "/insertstarpoint2")
	public String insertstarpoint2(Model model, String doctor_id, String starpoint, String startDate) {
		double dstarpoint=Double.parseDouble(starpoint);
		service.insertstarpoint(doctor_id, dstarpoint, startDate);
		return "redirect:/showclientreport";
	}
	
//추가
	@RequestMapping(value = "/gomymail")
	public String gomymail(Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		List<mailVo> vo=cService.selectmymail(id);
		model.addAttribute("list", vo);
		return "gomymail";
		//읽은애 안읽은애 구분줘야됨
	}
	
	@RequestMapping(value = "/gomaildetail")
	public String gomaildetail(Model model, String num) {
		int num2=Integer.parseInt(num);
		cService.updatehitcount(num2);
		mailVo vo=cService.showmaildetail(num2);
		String doctor = vo.getDoctorid();
		String member = vo.getMemberid();
		String doctorID = dService.selectName(doctor);
		String memberID = cService.getName(member);
		model.addAttribute("vo", vo);
		model.addAttribute("doctorid", doctorID);
		model.addAttribute("memberid", memberID);
		return "gomaildetail";
	}
	
//추가
	@RequestMapping(value = "/updatedoctortime")
	public String updatedoctortime(Model model, HttpServletRequest request,HttpSession session) {
		String id=(String)session.getAttribute("id");
		String[] list=dService.updatedoctortime(id);
		List<String> defaulttime=dService.gettime();
		model.addAttribute("defaultitme",defaulttime);
		request.setAttribute("list", list);
		return "updatedoctortime";
	}
	
	@RequestMapping(value = "/updatedoctortime2", method = RequestMethod.POST)
	public String updatedoctortime2(Model model, HttpServletRequest request,HttpSession session) {
		String id=(String)session.getAttribute("id");
		String[] doctortime=request.getParameterValues("time");
		String time="";
		for(int i=0;i<doctortime.length;i++) {
			time+=doctortime[i];
			if(i!=doctortime.length-1)
				time+="___";
		}
		dService.updatedoctortime2(time, id);
		//return은 의사 마이페이지로 수정
		return "redirect:/mypage";
	}
	
	@RequestMapping(value = "/updatedoctorinfo")
	public String updatedoctorinfo(Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		DoctorMemberVo vo=dService.selectdoctorinfo(id);
		model.addAttribute("vo",vo);
		return "updatedoctorinfo";
	}
	
	@RequestMapping(value = "/updatedoctorinfo2", method = RequestMethod.GET)
	public String updatedoctorinfo2(Model model, String address, String tel,HttpSession session) {
		String id=(String)session.getAttribute("id");
		dService.updatedoctorinfo(address,tel,id);
		//return은 의사 마이페이지로 수정
		return "redirect:/select";
	}
	
	//변경됨
	@RequestMapping(value="/clientUpdate")
    public String clientUpdate(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
    	ClientMemberVo vo = cService.clientSelect(id);
    	model.addAttribute("vo",vo);
    	return "clientUpdate";
    }
    @RequestMapping(value="/clientUpdateAction")
    public String clientUpdateAction(ClientMemberVo vo, HttpSession session) {
    	cService.clientUpdate(vo);
    	session.setAttribute("clientUpdate", "ok");
    	return "main";
    }
    @RequestMapping(value="/clientDelete")
    public String clientDelete(@RequestParam String id,HttpSession session) {
    	session.setAttribute("clientDelete", "ok");
    	return "main";
    }
    @RequestMapping(value="/clientDeleteAction")
    public String clientDeleteAction(@RequestParam String login_id) {
    	cService.clientDelete(login_id);
    	return "main";
    }
    @RequestMapping(value="/doctorDelete")
    public String doctorDelete(@RequestParam String id,HttpSession session) {
    	session.setAttribute("doctorDelete", "ok");
    	return "DoctorDeleteAlert";
    }
    @RequestMapping(value="/doctorDeleteAction")
    public String doctorDeleteAction(@RequestParam String id) {
    	dService.doctorDelete(id);
    	return "main";
    }
    @RequestMapping(value="admin_doctorMember")
    public String admin_doctorMember(Model model) {
    	List<DoctorMemberVo> list = dService.selectAll();
    	List<DoctorMemberVo> list2 = new ArrayList<DoctorMemberVo>();
    	for(DoctorMemberVo vo : list) {
    		System.out.println(vo.getApprove());
    		System.out.println(vo.getName());
    		if(("대기중").equals(vo.getApprove())) {
    			list2.add(vo);
    		}
    	}
    	model.addAttribute("list2",list2);
    	return "admin_doctorMember";
    }
    @RequestMapping(value="/admin_doctor_detail")
    public String admin_doctor_detail(@RequestParam String name, Model model) {
    	List<DoctorMemberVo> list = dService.selectAll();
    	List<DoctorMemberVo> list2 = new ArrayList<DoctorMemberVo>();
    	for(DoctorMemberVo vo : list) {
    		if(vo.getApprove().equals("대기중")) {
    			list2.add(vo);
    		}
    	}
    	for(DoctorMemberVo vo : list2) {
    		if(vo.getName().equals(name)) {
    			System.out.println(vo.getLicense());
    			model.addAttribute("vo",vo);
    		}
    	}
    	return "admin_doctor_detail";
    }
    @RequestMapping(value="/admin_detail_action")
    public String admin_detail_action(@RequestParam String id) {
    	aService.doctor_approve(id);
    	return "redirect:/admin_doctorMember";
    }
    
    @RequestMapping(value="/BoardList")
	public String boardList(Model model,HttpSession session) {
		session.removeAttribute("update");
		int page = 0;
		if(session.getAttribute("page")==null) {
			page=1;
		}else {
			page = (Integer)session.getAttribute("page");
		}
		int BoardSize = bservice.selectBoardSize();
		session.setAttribute("page", page);
		int maxPageNum = BoardSize / 20 + ((BoardSize % 20 > 0) ? 1 : 0); 
		session.setAttribute("maxPageNum",maxPageNum);
		int startNum = 20*(page-1);
		List<BoardVo> list = bservice.selectBoardPaging(20, startNum);
		model.addAttribute("list",list);
		
		return "BoardList";
	}
	@RequestMapping(value="/BoardListPaging")
	public String BoardListPaging(@RequestParam int page, HttpSession session) {
		session.setAttribute("page", page);
		return "redirect:/BoardList";
	}
	@RequestMapping(value="/BoardWrite")
	public String write() {
		return "writeForm";
	}
	@RequestMapping(value="/BoardDetailAction")//변경변경변경변경변경변경
	public String BoardDetailAction(Model model, @RequestParam int bno, HttpServletRequest request,HttpSession session) {
		BoardVo vo = bservice.selectOne(bno);
		model.addAttribute("vo", vo);
		session.setAttribute("writer", vo.getWriter());
		String img=vo.getFile();
		request.setAttribute("img", img);		
		return "BoardDetailView";
	}
	@RequestMapping(value="/BoardWriteAction")
	public String writeAction(BoardVo vo,Model model,HttpSession session, MultipartHttpServletRequest multipartRequest) throws Exception{
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
//		String writer = multipartRequest.getParameter("writer");
		
		title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		content = new String(vo.getContent().getBytes("8859_1"), "UTF-8");
//		writer = new String(vo.getWriter().getBytes("8859_1"), "UTF-8");
		
		vo.setTitle(title);
		vo.setContent(content);
//		vo.setWriter(writer);
		
		String filePath = session.getServletContext().getRealPath("/resources/images/");
		System.out.println("filePath :"+filePath);
		MultipartFile multipart = vo.getMultipart();
		
		String filename = "(파일없음)";
		if(!multipart.isEmpty()) {
			filename = multipart.getOriginalFilename();
			filename = StringUtils.cleanPath(new String(multipart.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));
			File file = new File(filePath,filename);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		System.out.println(filename);
		vo.setFile(filename);
		String id = (String)session.getAttribute("id");
		vo.setWriter(id);
		bservice.write(vo);
		model.addAttribute("vo",vo);
		session.setAttribute("page",1);
		return "redirect:/BoardList";
	}
	@RequestMapping(value="BoardUpdate")
	public String BoardUpdate(@RequestParam int bno, Model model,HttpSession session) {
		session.removeAttribute("update");
		//int bno = service.selectBno(title, content);
		
		
		BoardVo vo = bservice.selectOne(bno);
		model.addAttribute("vo",vo);
		return "updateForm";
	}
	@RequestMapping(value="updateAction")
	public String BoardUpdateAction(BoardVo vo,Model model,HttpSession session,
			MultipartHttpServletRequest multipartRequest) throws Exception{
		
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String writer = multipartRequest.getParameter("writer");
		int bno = Integer.parseInt(multipartRequest.getParameter("bno"));
		
		title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		content = new String(vo.getContent().getBytes("8859_1"), "UTF-8");
		writer = new String(vo.getWriter().getBytes("8859_1"), "UTF-8");
		writer = new String(vo.getWriter().getBytes("8859_1"), "UTF-8");
		
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		String filePath = session.getServletContext().getRealPath("/resources/images/");
		System.out.println("filePath :"+filePath);
		MultipartFile multipart = vo.getMultipart();
		
		String filename = "(파일없음)";
		if(!multipart.isEmpty()) {
			filename = multipart.getOriginalFilename();
			filename = StringUtils.cleanPath(new String(multipart.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));
			File file = new File(filePath,filename);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		System.out.println(filename);
		vo.setFile(filename);
		if(vo.getFile().equals("(파일없음)")){
			bservice.updateExfile(vo);
		}else {
		bservice.update(vo);
		}
		session.setAttribute("update","ok");
		model.addAttribute("vo",vo);
		return "redirect:/BoardDetailAction?bno="+bno;
	}
	@RequestMapping(value="/BoardDelete")
	public String BoardDelete(@RequestParam int bno,HttpSession session) {
//		session.setAttribute("delete", "ok");
		bservice.delete(bno);
		return "redirect:/BoardList";
	}
	@RequestMapping(value="/BoardDeleteAlert")
	public String BoardDeleteAlert(@RequestParam int bno, Model model) {
		model.addAttribute("bno",bno);
		return "BoardDeleteAlert";
	}
	
	/* 추가됨 
	@RequestMapping("/doctorMyPage")
	public String doctorMyPage(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		String url = dService.getUrl(id);
		model.addAttribute("url", url);
		return "doctorMyPage";
	}
	*/
	//채팅
	@RequestMapping("/chat")
	public String chat() {
		return "chat";
	}
	@RequestMapping("/doctorRank")
	public String doctorRank(Model model,HttpSession session) {
		int page = 0;
		if(session.getAttribute("page")==null) {
			page=1;
		}else {
			page = (Integer)session.getAttribute("page");
		}
		int DoctorSize = dService.selectDoctorSize();
		session.setAttribute("page", page);
		int maxPageNum = DoctorSize / 15 + ((DoctorSize % 15 > 0) ? 1 : 0); 
		session.setAttribute("maxPageNum",maxPageNum);
		int startNum = 20*(page-1);
		List<DoctorMemberVo> rank = dService.getRankAll(15, startNum);
		model.addAttribute("rank",rank);
		return "doctorRank";
	}
	@RequestMapping(value="/doctorRankPage")
	public String doctorRankpage(@RequestParam int page, HttpSession session) {
		session.setAttribute("page", page);
		return "redirect:/doctorRank";
	}
//추가됨
	@RequestMapping("/doctorlistByField")
	public String doctorListByField(HttpServletRequest request, Model model) {
		String field = (String)request.getParameter("field");
		List<DoctorMemberVo> list = dService.doctorlistByField(field);
		FieldVo vo = dService.fieldDescription(field);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "doctorList";
	}
	
	@RequestMapping("/terms")
	public String terms() {
		return "terms";
	}
	@RequestMapping(value="/main")	//변경
    public String main(HttpServletRequest request) {
    	
    	return "main";
    }
   @RequestMapping("/finish")
   public String finish(HttpServletRequest request, Model model) {
      int cnum = Integer.parseInt(request.getParameter("cNum"));
      service.updateFinish(cnum);
      model.addAttribute("updateFinish", "ok");
      return "main";
   }

}
