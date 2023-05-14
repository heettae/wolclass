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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.MemberService;
import com.wolclass.service.WishService;
import com.wolclass.utils.SerialMaker;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ClassService classService;
	@Autowired
	private WishService wishService;
	@Autowired
	private JavaMailSender mailSender;
	
	// 회원가입 페이지 이동 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET(MemberVO vo) {
		logger.info("JoinGET() 호출!");
	}
	
	// 회원가입 - 다빈 
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPOST(@RequestParam Map<String, Object> map) throws Exception{
		logger.info("join 실행 {}",map);
		memberService.memberJoin(map);
		
		return "redirect:/member/login";
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
	
	// http://localhost:8080/member/login
	// 로그인 처리 - 다빈 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo,HttpSession session,RedirectAttributes rttr) throws Exception{
		logger.info("loginPOST() 호출!");
		MemberVO loginResultVO = memberService.memberLogin(vo);
		if(loginResultVO != null) {
			// 로그인 성공
			logger.info("로그인 성공!");
			// 아이디정보를 세션에 저장
			session.setAttribute("id", loginResultVO.getM_id());
			// main 페이지 이동
			return "redirect:/";
		}else {
			// 로그인 실패
			logger.info("로그인 실패!");
			rttr.addFlashAttribute("result",0);
			// 로그인 페이지 이동
			return "redirect:/member/login";
		}
	}
	
	// 로그아웃 - 다빈 
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.info("logoutGET() 호출!");
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 찾기form - 다빈 
	@RequestMapping(value = "/findId",method = RequestMethod.GET)
	public String findIdGET() {
		logger.info("findIdGET() 호출");
		return "/member/findId";
	}
	
	// 아이디 찾기 기능 - 다빈 
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findIdPOST(MemberVO vo) throws Exception {
		logger.info("findIdPOST() 호출");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberVO findIdVO = memberService.findId(vo);
		if (findIdVO == null) {
			resultMap.put("check", 1);
		} else {
			resultMap.put("check", 0);
			resultMap.put("id", findIdVO.getM_id());
		}
		return resultMap;
	}
	
	// 비밀번호 찾기 form - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.GET)
	public void findPwGET() {
		logger.info("findPwGET() 호출");
	}
	
	// 비밀번호 찾기 처리 - 다빈
	@RequestMapping(value = "/findPw",method = RequestMethod.POST)
	@ResponseBody
	public int findPwPOST(MemberVO vo) throws Exception{
		logger.info("findPwPOST() 호출");
		if(memberService.findPw(vo)) {
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
					
					memberService.updateTempPw(vo);
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
		
		String access_token = memberService.getToken(code);
		Map<String, String> userInfo = memberService.getUserInfo(access_token);
		
		MemberVO vo = new MemberVO();
		vo.setM_id(userInfo.get("id"));
		vo.setM_pw(userInfo.get("password"));
		vo.setM_email(userInfo.get("email"));
		vo.setM_name(userInfo.get("name"));
		
		//if id db에 있을때
		if(memberService.kfindId(vo)!= null) session.setAttribute("id", vo.getM_id());
		else {
			memberService.kakaoInsert(vo);
			session.setAttribute("id", vo.getM_id());
		}
		return "redirect:/";
	}
	
	// 네이버 콜백 - 다빈
	@RequestMapping(value="/callback", method=RequestMethod.GET)
    public String callBack(){
        return "/member/navercallback";
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
	    // 비밀번호 설정
	    vo.setM_pw(SerialMaker.getString(8));
		
		
		if(memberService.kfindId(vo)!= null) session.setAttribute("id", vo.getM_id());
		else {
			memberService.kakaoInsert(vo);
			session.setAttribute("id", vo.getM_id());
		}
		return "redirect:/";
	}
	
	// 마이페이지 - 다빈
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) throws Exception{
		logger.info("mypage() 호출");
		
		String id = (String)session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		}
		
		MemberVO vo = memberService.getMemberInfo(id);
		model.addAttribute("vo", vo);
		
		return "/member/mypage";
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
		memberService.updateProfile(vo);
		
		return "success";
	}
	// 마이페이지 위시리스트 - 다빈
	@GetMapping("/wishList")
	public void listGET(HttpSession session, Model model) {
		logger.info(" listGET() 호출 ");
		model.addAttribute("wishList",wishService.getClassList((String)session.getAttribute("id")));
	}
	
	// 회원정보 수정 - 다빈
	@GetMapping("/updateMember")
	public String updateMember(HttpSession session,Model model) throws Exception{
		logger.info("updateMember() 호출!");
		
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("vo",memberService.getMemberInfo(id));
		
		return "/member/updateMember";
	}
	
	// 회원정보 수정 처리 - 다빈
	@PostMapping("/updateMember")
	public String updateMemberPro(@RequestParam Map<String,Object> map) throws Exception{
		logger.info("updateMemberPro() 호출!");
		memberService.updateMember(map);
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/deleteMember")
	// 회원탈퇴 -  다빈
	public String deleteMember(HttpSession session) throws Exception{
		logger.info("deleteMember() 호출 !");
		return "/member/deleteMember";
	}
	
	// 회원탈퇴 처리 - 다빈
	@PostMapping("/deleteMember")
	@ResponseBody
	public String deleteMemberPro(@RequestParam("m_pw") String m_pw, 
				HttpSession session) throws Exception{
		logger.info("deleteMemberPro() 호출");
		String m_id = (String) session.getAttribute("id");
		MemberVO vo = memberService.getMemberInfo(m_id);
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
		memberService.deleteMember(m_id);
		session.invalidate();
		return "success";
	}
	
	// 결제내역 - 다빈
	@GetMapping("/payList")
	public void payList(@RequestParam Map<String,Object> map, HttpSession session, Model model) throws Exception{
		logger.info("payList() 호출 ");
		String id = (String)session.getAttribute("id");
		map.put("m_id",id);
		List<Map<String,Object>> payList = memberService.payList(map);
		model.addAttribute("payList",payList );
		model.addAttribute("amap", map);
	}
	
	// 예약 리스트 - 다빈
	@GetMapping("/classList")
	public void classList(@RequestParam Map<String,Object> map ,HttpSession session, Model model) throws Exception{
		logger.info("classList() 호출 ");
		String id = (String)session.getAttribute("id");
		map.put("m_id",id);
		model.addAttribute("classList", memberService.classList(map));
		model.addAttribute("classList2", memberService.classList2(map));
		model.addAttribute("amap", map);
	}
	
	// 메세지 리스트 - 다빈
	@GetMapping("/msgList")
	public void msgList(@RequestParam Map<String,Object> map, HttpSession session, Model model) throws Exception{
		logger.info("msgList() 호출 ");
		String id = (String)session.getAttribute("id");
		map.put("m_id",id);
		model.addAttribute("msgList1", memberService.msgList1(map));
		model.addAttribute("msgList2", memberService.msgList2(map));
		model.addAttribute("amap", map);
	}
	
	// 구독 페이지 - 다빈 
	@GetMapping("/subscribe")
	public void subscribe(HttpSession session, Model model) throws Exception{
		logger.info("subscribe() 호출 ");
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("sub", memberService.subscribe(id));
	}
	
	// 마이페이지(문의하기) - 다빈
	@GetMapping("/myinquiry")
	public void inquiry(RsrvPayVO vo,Model model) throws Exception{
		logger.info("inquiry() 호출 ");
		memberService.myinquiry(vo);
		model.addAttribute("vo", vo);
	}
	
	// 마이페이지(문의하기 처리) - 다빈
	@PostMapping("/myinquiry")
	@ResponseBody
	public void inquiryPro(@RequestParam Map<String, Object> map, Model model) throws Exception{
		logger.info("inquiryPro() 호출 ");
		memberService.myinquiryPro(map);
	}
	
	// 마이페이지(후기등록) - 다빈
	@GetMapping("/myreview")
	public void myreview(@RequestParam("c_no") String c_no,@RequestParam("p_no") String p_no,Model model) throws Exception{
		logger.info("myreview() 호출 ");
		model.addAttribute("c_no", c_no);
		model.addAttribute("p_no", p_no);
	}
	
	// 마이페이지(후기등록 처리) - 다빈
	@PostMapping("/myreview")
	@ResponseBody
	public String myreviewPro(@RequestParam Map<String, Object> map,String p_no) throws Exception{
		logger.info("myreviewPro() 호출 ");
		memberService.myreviewPro(map);
		memberService.myreviewOK(p_no);
		return "success";
	}
	
	// 클래스 워크스페이스
	@RequestMapping(value = "/classWorkSpace", method = RequestMethod.GET)
	public void classWorkSpace(Model model, HttpSession session) throws Exception {
		logger.info(" classWorkSpaceGET() 호출 ");

		String id = (String) session.getAttribute("id");
		model.addAttribute("registerList", classService.registerClassList(id));
	}
	// 클래스 워크스페이스
}
