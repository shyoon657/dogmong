package com.dogmong.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.dogmong.domain.MemberVO;

public interface MemberService {

	public int join(MemberVO vo);
	
	public String checkID(String mem_id);
	
	public MemberVO login(String mem_id);
	
	public int modify(MemberVO vo);
	
	public String findPwReq(String mem_email);
	
	public int modifyTempPw(String mem_email, String mem_pw);
	
	public String currentPwConfirm(String mem_id, PasswordEncoder cryptPassEnc, String mem_cur_pw, String mem_change_pw);
	
	public int unregister(String mem_id, PasswordEncoder cryptPassEnc, String mem_pw);
	
	  
}
