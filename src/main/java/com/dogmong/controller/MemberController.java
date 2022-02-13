package com.dogmong.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@GetMapping("/sendMailAith")
	public ResponseEntity<String> sendMailAuth(){
		
		ResponseEntity<String> entity = null;
		
		
		return entity;
	}
	
	
	// 회원수정 폼
	@GetMapping("/modify")
	public void modify() {
		
	}
	
	//회원수정 
	
	//회원삭제 
	
	//로그인
	@GetMapping("/login")
	public void login() {
		
	}
	
	//로그아웃 
	
	//마이페이지 
	@GetMapping("/mypage")
	public void mypage() {
		
	}
	
	
	//아이디 및 비밀번호 찾기 
	@GetMapping("/searchIDPW")
	public void searchIDPW() {
		
	}
	
	
	
}
