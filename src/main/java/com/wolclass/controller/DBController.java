package com.wolclass.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.MemberVO;
import com.wolclass.service.DBService;

@Controller
@RequestMapping("/db/*")
public class DBController {
	
	private static final Logger logger = LoggerFactory.getLogger(DBController.class);
	
	@Autowired
	private DBService service;
	@Autowired
	private JavaMailSender mailSender;

	
	
	
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	// http://localhost:8080/db/join
	// 회원가입 페이지 이동 db
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET(MemberVO vo) {
		logger.info("JoinGET() 호출!");
	}
	
	// 회원가입 db
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPOST(@RequestParam Map<String, Object> map,MultipartFile Ifile,HttpServletRequest request) throws Exception{
		logger.info("join 실행 {}",map);
		service.memberJoin(map);
				
		// C:\\workspace_Wolclass\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WolClass\\resources\\img
		return "redirect:/db/login";
	}
	
	//아이디 중복검사 db
	@RequestMapping(value = "/memberIdChk",method = RequestMethod.POST)
	@ResponseBody
	public int memberIdChk(String m_id) throws Exception{
		logger.info("memberIdChk() 호출!");
		
		int result = service.idCheck(m_id);
		
		return result;
	}
	
	// 로그인 페이지 이동 db
//	@RequestMapping(value = "/login",method = RequestMethod.GET)
//	public void loginGET() {
//		logger.info("loginGET() 호출!");
//	}
	
	// 이메일 인증 - 다빈
	@RequestMapping(value = "/mailCheck",method = RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email) throws Exception{
		logger.info("이메일 데이터 전송 확인");
		
		// 인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호 "+checkNum);
		
		// 이메일 보내기 
		String setFrom = "eksjqls1@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증번호는 " + checkNum + "입니다." +
						  "<br>" +
						  "해당 인증번호를 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 다빈 첨부파일
	

	

	
	
}