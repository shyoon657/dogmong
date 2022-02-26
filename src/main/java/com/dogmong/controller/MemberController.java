package com.dogmong.controller;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dogmong.domain.EmailDTO;
import com.dogmong.domain.MemberVO;
import com.dogmong.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private PasswordEncoder cryptPassEnc;
	
	@Inject
	private MemberService service;
	
	@Inject
	private JavaMailSender mailSender;
	
	// 회원기능
	
	//회원가입 
	@GetMapping("/join")
	public void join() {
			
	}
	
	//회원가입저장
	@PostMapping("/join")
	public String joinOk(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		// 비밀번호 암호화 (스프링 시큐리티 기능 사용) 
		 
		vo.setMem_pw(cryptPassEnc.encode(vo.getMem_pw()));
		
		vo.setMem_rec_email(!StringUtils.isEmpty(vo.getMem_rec_email()) ? "Y" : "N");
		
		log.info("암호화된 비밀번호 : " + vo);
		
		service.join(vo);
		
		return "redirect:/member/login";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/checkID")
	public ResponseEntity<String> checkID(@RequestParam("mem_id") String mem_id) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.checkID(mem_id)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	// 메일인증요청 
	@ResponseBody
	@GetMapping("/sendMailAuth")
	public ResponseEntity<String> sendMailAuth(@RequestParam("mem_email") String mem_email, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String authCode = makeAuthCode(); 
		session.setAttribute("authCode", authCode);
		
		EmailDTO dto = new EmailDTO("dogmong", "sangyoon@gmail.com", mem_email , "도그몽 인증 메일 ", authCode);
		
		// 메일 내용을 구성하는 클래스
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			// 받는 사람 메일 설정 
			message.addRecipient(RecipientType.TO, new InternetAddress(mem_email));
			// 보내는 사람 설정(이메일, 이름)
			message.addFrom(new InternetAddress[] {new InternetAddress(dto.getM_senderMail(), dto.getM_senderMail())});
			// 제목 
			message.setSubject(dto.getM_title(), "utf-8");
			// 본문 내용 
			message.setText(dto.getM_message(), "utf-8");
			
			mailSender.send(message);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);	
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);	
		} 
	
		
		
		return entity;
	}
	
		// 메일인증요청 확인
		@ResponseBody
		@GetMapping("/mailAuthConfirm")
		public ResponseEntity<String> mailAuthConfirm(@RequestParam("user_authCode") String user_authCode, HttpSession session){
			
			ResponseEntity<String> entity = null;
			
			String authCode = (String) session.getAttribute("authCode");
			
			if(authCode.equals(user_authCode)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK );
			}else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK );
			}
			
			return entity;
		}
	
	
	// 회원가입시 메일인증코드 생성 
	private String makeAuthCode() {
		
		String authCode = "";
		
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int) (Math.random() * 9) + 1);
		}
		return authCode;
	}   

	
	// 회원수정 폼
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(HttpSession session, Model model) {
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String mem_id =  vo.getMem_id();
		
		/*
		MemberVO db_vo = service.login(mem_id);
		
		model.addAttribute("memberVO", db_vo); 
		*/
		model.addAttribute(service.login(mem_id));
		
	}

	
	
	//회원수정 저장 
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String redirectURL = "";
		
		vo.setMem_rec_email(!StringUtils.isEmpty(vo.getMem_rec_email()) ? "Y" : "N");
		
		log.info("회원수정정보" + vo);
		
		MemberVO session_vo = (MemberVO) session.getAttribute("loginStatus");
		
		if(cryptPassEnc.matches(vo.getMem_pw(), session_vo.getMem_pw())) {
			service.modify(vo);
			
			redirectURL = "/";
			rttr.addFlashAttribute("msg", "modifyOK");
		
			
		}else {
			redirectURL = "/member/modify";
			rttr.addFlashAttribute("msg", "modifyFail");
			
		}
		
		return "redirect:" + redirectURL;
		
	}
	
	
	//로그인폼
	@GetMapping("/login")
	public void login() {
		
	}
	
	// 로그인 
	@ResponseBody
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw, HttpSession session) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		MemberVO vo = service.login(mem_id);
		
		if(vo == null) {
			result = "idFail";
		} else { 
			if(cryptPassEnc.matches(mem_pw, vo.getMem_pw())) {
				result = "success";
				
				session.setAttribute("loginStatus", vo);  // 로그인 성공 상태정보를 세션으로 저장 
				
			} else {
				result = "pwFail";
			}
		}
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}

	
	//로그아웃 
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/";
	}

	
	//비밀번호 찾기 폼
	@GetMapping("/findPw")
	public void findPw() {

	}
	// findPw
	
	//비밀번호 찾기 기능
	@ResponseBody
	@PostMapping("/findPw")
	public ResponseEntity<String> findPwReq(@RequestParam("mem_email") String mem_email) {
		
		/*
		 1) 이름, email 존재 시 : 등록된 email로 임시 비밀번호 발송 
		 2) 이름, email 미존재시 : 재입력 메세지
		 */

		ResponseEntity<String> entity = null;
		
		// 가입 이메일 존재 시 임시 비밀번호 생성 후 메일로 발송 
		if(!StringUtils.isEmpty(service.findPwReq(mem_email))) {
			
			
			String TempPw = makeAuthCode(); 
			
			EmailDTO dto = new EmailDTO("dogmong", "sangyoon@gmail.com", mem_email , "도그몽 메일(임시비밀번호)", TempPw);
			
			// 메일 내용을 구성하는 클래스
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				// 받는 사람 메일 설정 
				message.addRecipient(RecipientType.TO, new InternetAddress(mem_email));
				// 보내는 사람 설정(이메일, 이름)
				message.addFrom(new InternetAddress[] {new InternetAddress(dto.getM_senderMail(), dto.getM_senderMail())});
				// 제목 
				message.setSubject(dto.getM_title(), "utf-8");
				// 본문 내용 
				message.setText(dto.getM_message(), "utf-8");
				
				mailSender.send(message);
				
				
				// 임시비밀번호를 암호화하여 DB에 저장
				String encryptPw = cryptPassEnc.encode(TempPw);
				service.modifyTempPw(mem_email, encryptPw);
					
				 
				entity = new ResponseEntity<String>("success", HttpStatus.OK);	
				 
			} catch (Exception e) {
		
				e.printStackTrace();
				
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);	
			} 
		
			
		// 이메일이 존재하지 않을 경우 	
		}else {
		
			entity = new ResponseEntity<String>("noMail", HttpStatus.OK);	
		}
		
		return entity;

	}
	
	// 비밀번호 찾기 폼 
	@GetMapping("/changePw")
	public void changePw() {
		
	}
	
	
	
	// 비밀번호 변경하기 
	@ResponseBody
	@PostMapping("/changePw")
	public ResponseEntity<String> changePw(@RequestParam("mem_cur_pw") String mem_cur_pw, @RequestParam("mem_change_pw") String mem_change_pw, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		log.info("현재 비밀번호" + mem_cur_pw);
		log.info("변경 비밀번호" + mem_change_pw);
		
		
		String mem_id = vo.getMem_id();

		String result = service.currentPwConfirm(mem_id, cryptPassEnc, mem_cur_pw, cryptPassEnc.encode(mem_change_pw));

		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
		
		 
		
	}
	
	// 회원탈퇴하기 폼
		@GetMapping("/unregister")
		public void unregister() {
			
		}
	
	// 회원탈퇴 하기 
		@ResponseBody
		@PostMapping("/unregister")
		public ResponseEntity<String> unregister(@RequestParam("mem_pw") String mem_pw, HttpSession session) {
			
			ResponseEntity<String> entity = null; 
			
			MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
			
			String mem_id =  vo.getMem_id();
			
			entity = new ResponseEntity<String>(String.valueOf(service.unregister(mem_id, cryptPassEnc, mem_pw)), HttpStatus.OK);
			
			return entity;
			
			
		}
		
	
	
	
	
	
	
}
