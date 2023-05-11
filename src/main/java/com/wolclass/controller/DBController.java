package com.wolclass.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.service.DBService;
import com.wolclass.service.WishService;

@Controller
@RequestMapping("/db/*")
public class DBController {
	
	private static final Logger logger = LoggerFactory.getLogger(DBController.class);
	
	@Autowired
	private DBService service;
	@Autowired
	private WishService wservice;
	@Autowired
	private JavaMailSender mailSender;

	
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	// http://localhost:8080/db/join
	// 회원가입 페이지 이동 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET(MemberVO vo) {
		logger.info("JoinGET() 호출!");
	}
	
	// 회원가입 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPOST(@RequestParam Map<String, Object> map) throws Exception{
		logger.info("join 실행 {}",map);
		service.memberJoin(map);
		
		return "redirect:/db/login";
	}
	
	//아이디 중복검사 - 다빈 
	@RequestMapping(value = "/memberIdChk",method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String m_id) throws Exception{
		logger.info("memberIdChk() 호출!");
		int result = service.idCheck(m_id);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	// 이메일 중복검사 - 다빈
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String m_email) throws Exception{
		logger.info("emailCheck() 호출");
		int result = service.emailCheck(m_email);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	// 전화번호 중복검사 - 다빈
		@PostMapping("/phoneCheck")
		@ResponseBody
		public String phoneCheck(String m_phone) throws Exception{
			logger.info("phoneCheck() 호출");
			int result = service.phoneCheck(m_phone);
			
			if(result != 0) {
				return "fail";
			}else {
				return "success";
			}
			
		}
	
	// 이메일 인증 - 다빈
	@RequestMapping(value = "/mailCheck",method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		logger.info("이메일 데이터 전송 확인");
		
		// 인증번호 생성 - 다빈 
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호 "+checkNum);
		
		// 이메일 보내기 - 다빈 
		String setFrom = "eksjqls1@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증번호는 " + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(setFrom,"월클래스");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}
	
	// 로그인 페이지 이동 - 다빈 
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public void loginGET() throws Exception{
		logger.info("loginGET() 호출!");
	}
	
	// http://localhost:8080/db/login
	// 로그인 처리 - 다빈 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo,HttpSession session,RedirectAttributes rttr) throws Exception{
		logger.info("loginPOST() 호출!");
		MemberVO loginResultVO = service.memberLogin(vo);
		if(loginResultVO != null) {
			// 로그인 성공
			logger.info("로그인 성공!");
			// 아이디정보를 세션에 저장
			session.setAttribute("id", loginResultVO.getM_id());
			// main 페이지 이동
			return "redirect:/tj/main";
		}else {
			// 로그인 실패
			logger.info("로그인 실패!");
			rttr.addFlashAttribute("result",0);
			// 로그인 페이지 이동
			return "redirect:/db/login";
		}
	}
	
	// 로그아웃 - 다빈 
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.info("logoutGET() 호출!");
		session.invalidate();
		
		return "redirect:/tj/main";
	}
	
	// http://localhost:8080/db/findId
	// 아이디 찾기form - 다빈 
	@RequestMapping(value = "/findId",method = RequestMethod.GET)
	public String findIdGET() {
		logger.info("findIdGET() 호출");
		return "/db/findId";
	}
	
	// 아이디 찾기 기능 - 다빈 
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findIdPOST(MemberVO vo) throws Exception {
		logger.info("findIdPOST() 호출");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberVO findIdVO = service.findId(vo);
		if (findIdVO == null) {
			resultMap.put("check", 1);
		} else {
			resultMap.put("check", 0);
			resultMap.put("id", findIdVO.getM_id());
		}
		return resultMap;
	}
	
	// http://localhost:8080/db/findPw
	// 비밀번호 찾기 form - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.GET)
	public String findPwGET() {
		logger.info("findPwGET() 호출");
		return "/db/findPw";
	}
	// 비밀번호 찾기 처리 - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.POST)
	@ResponseBody
	public int findPwPOST(MemberVO vo) throws Exception{
		logger.info("findPwPOST() 호출");
		if(service.findPw(vo)) {
			Random random = new Random();
			String tempPassword = "";
			for (int i = 0; i < 8; i++) {
			    int digit = random.nextInt(10);
			    tempPassword += String.valueOf(digit);
			}
			logger.info("Temporary password: " + tempPassword);
			// 이메일 보내기 - 다빈 
			vo.setM_pw(tempPassword);
			String setFrom = "eksjqls1@naver.com";
			String toMail = vo.getM_email();
			String title = "임시 비밀번호입니다.";
			String content = "비밀번호는 " + tempPassword + "입니다." +
					"<br>" +
					"해당 비밀번호로 로그인 후 비밀번호 변경 해주세요.";
			new Thread(() -> {
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
					helper.setFrom(setFrom,"월클래스");
					helper.setTo(toMail);
					helper.setSubject(title);
					helper.setText(content,true);
					mailSender.send(message);
					
					service.updateTempPw(vo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}).start();
			return 1;
		}
		return 0;
	}

	// 카카오 로그인 - 다빈
	@GetMapping("/kakao")
	public String kakaoLogin(@RequestParam String code, Model model, HttpSession session) throws Exception{
		logger.info("code : "+code);
		
		String access_token = service.getToken(code);
		Map<String, String> userInfo = service.getUserInfo(access_token);
		
		MemberVO vo = new MemberVO();
		vo.setM_id(userInfo.get("id"));
		vo.setM_pw(userInfo.get("password"));
		vo.setM_email(userInfo.get("email"));
		vo.setM_name(userInfo.get("name"));
		
		//if id db에 있을때
		if(service.kfindId(vo)!= null) session.setAttribute("id", vo.getM_id());
		else {
			service.kakaoInsert(vo);
			session.setAttribute("id", vo.getM_id());
		}
		return "redirect:/db/main";
	}
	// 네이버 콜백 - 다빈
	@RequestMapping(value="/callback", method=RequestMethod.GET)
    public String callBack(){
        return "/db/navercallback";
    }
	
	// 네이버 로그인 - 다빈
	@PostMapping("/naver")
    public @ResponseBody String naverLogin(@RequestParam("n_email") String n_email,
    		@RequestParam("n_name") String n_name,@RequestParam("n_id") String n_id,HttpSession session) throws Exception{
		logger.info("naverLogin() 호출");
		
		MemberVO vo = new MemberVO();
		vo.setM_email(n_email);
		vo.setM_name(n_name);
		vo.setM_id(n_id);
		
		// 랜덤한 8자리 비밀번호 생성
	    Random random = new Random();
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    String randomPassword = "";
	    for (int i = 0; i < 8; i++) {
	        randomPassword += characters.charAt(random.nextInt(characters.length()));
	    }
	    String password = randomPassword;
	    
	    // 비밀번호 설정
	    vo.setM_pw(password);
		
		
		if(service.kfindId(vo)!= null) session.setAttribute("id", vo.getM_id());
		else {
			service.kakaoInsert(vo);
			session.setAttribute("id", vo.getM_id());
		}
		return "redirect:/db/main";
	}
	
	// 마이페이지 - 다빈
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) throws Exception{
		logger.info("mypage() 호출");
		
		String id = (String)session.getAttribute("id");
		if (id == null) {
			return "redirect:/db/login";
		}
		
		MemberVO vo = service.selectMember(id);
		model.addAttribute("vo", vo);
		
		return "/db/mypage";
	}
	
	// 마이페이지 프로필사진 변경 - 다빈
	@PostMapping("/profileImg")
	@ResponseBody
	public String profileImg(@RequestParam("m_profile") MultipartFile mFile,
			HttpSession session) throws Exception{
		MemberVO vo = new MemberVO();
		vo.setM_id((String)session.getAttribute("id"));
		String filePath = 
				getClass().getResource("/").getPath().split("WEB-INF")[0]+"resources/img/";
		String oFileName = mFile.getOriginalFilename();
		logger.info("file이름 저장 완료! ");
		
		 // 파일 이름에 고유한 값을 추가하여 파일 이름 변경
        String fileExtension = oFileName.substring(oFileName.lastIndexOf(".")); // 파일 확장자 추출
        String uniqueFileName = new SimpleDateFormat("HHmmss").format(new Date()) + UUID.randomUUID().toString() + fileExtension;
		
		File file = new File(filePath + uniqueFileName);
		if (mFile.getSize() != 0) {
			// 해당 경로에 파일이 없을경우
			if (!file.exists()) {
				// 해당하는 디렉터리 생성후 파일을 업로드
				if (file.getParentFile().mkdirs()) {
					file.createNewFile();
				} // mkdirs
			} // exists
				// 임시로 생성(저장) MultipartFile을 실제 파일로 전송
			mFile.transferTo(file);
		} 
		
		vo.setM_profile(uniqueFileName);
		service.updateProfile(vo);
		
		return "success";
	}
	// 마이페이지 위시리스트 - 다빈
	@GetMapping("/wishList")
	public ModelAndView listGET(HttpSession session) {
		logger.info(" listGET() 호출 ");
		ModelAndView mav = new ModelAndView("/db/wishList");
		mav.addObject(wservice.getClassList((String)session.getAttribute("id")));
		return mav;
	}
	
	// 회원정보 수정 - 다빈
	@GetMapping("/updateMember")
	public String updateMember(HttpSession session,Model model) throws Exception{
		logger.info("updateMember() 호출!");
		
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/db/login";
		}
		model.addAttribute("vo",service.selectMember(id));
		
		return "/db/updateMember";
	}
	
	// 회원정보 수정 처리 - 다빈
	@PostMapping("/updateMember")
	public String updateMemberPro(@RequestParam Map<String,Object> map) throws Exception{
		logger.info("updateMemberPro() 호출!");
		service.updateMember(map);
		return "redirect:/db/mypage";
	}
	
	@GetMapping("/deleteMember")
	// 회원탈퇴 -  다빈
	public String deleteMember(HttpSession session) throws Exception{
		logger.info("deleteMember() 호출 !");
		return "/db/deleteMember";
	}
	
	// 회원탈퇴 처리 - 다빈
	@PostMapping("/deleteMember")
	@ResponseBody
	public String deleteMemberPro(@RequestParam("m_pw") String m_pw, 
				HttpSession session) throws Exception{
		logger.info("deleteMemberPro() 호출");
		String m_id = (String) session.getAttribute("id");
		MemberVO vo = service.selectMember(m_id);
		if(vo.getM_pw().equals(m_pw)) {
			return "success";
		}else {
			return "fail";
		}
	}
	// 회원탈퇴 처리 - 다빈
	@PostMapping("/CheckPW")
	@ResponseBody
	public String CheckPW(HttpSession session) throws Exception{
		logger.info("CheckPW() 호출");
		String m_id = (String) session.getAttribute("id");
		service.deleteMember(m_id);
		session.invalidate();
		return "success";
	}
	
	// 결제내역 - 다빈
	@GetMapping("/payList")
	public void payList(HttpSession session, Model model) throws Exception{
		logger.info("payList() 호출 ");
		List<Map<String,Object>> payList = service.payList((String)session.getAttribute("id"));
		
		model.addAttribute("payList",payList );
	}
	
	// 예약 리스트 - 다빈
	@GetMapping("/classList")
	public void classList(HttpSession session, Model model) throws Exception{
		logger.info("classList() 호출 ");
		String id = (String)session.getAttribute("id");
		model.addAttribute("classList", service.classList(id));
		model.addAttribute("classList2", service.classList2(id));
	}
	
	// 메세지 리스트 - 다빈
	@GetMapping("/msgList")
	public void msgList(HttpSession session, Model model) throws Exception{
		logger.info("msgList() 호출 ");
		String id = (String)session.getAttribute("id");
		model.addAttribute("msgList1", service.msgList1(id));
		model.addAttribute("msgList2", service.msgList2(id));
	}
	
	// 구독 페이지 - 다빈 
	@GetMapping("/subscribe")
	public void subscribe(HttpSession session, Model model) throws Exception{
		logger.info("subscribe() 호출 ");
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("sub", service.subscribe(id));
	}
	
	
}