package com.dogmong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dogmong.domain.MemberVO;
import com.dogmong.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO vo) {
		
		return mapper.join(vo);
	}

	@Override
	public String checkID(String mem_id) {
		
		log.info("아이디확인" + mem_id);
		
		return mapper.checkID(mem_id);
	}

	@Override
	public MemberVO login(String mem_id) {
		// TODO Auto-generated method stub
		return mapper.login(mem_id);
	}

	@Override
	public int modify(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.modify(vo);
	}

	@Override
	public String findPwReq(String mem_email) {
		// TODO Auto-generated method stub
		return mapper.findPwReq(mem_email);
	}

	@Override
	public int modifyTempPw(String mem_email, String mem_pw) {
		// TODO Auto-generated method stub
		return mapper.modifyTempPw(mem_email, mem_pw);
	}
	
	
	@Override
	public String currentPwConfirm(String mem_id, PasswordEncoder cryptPassEnc, String mem_cur_pw, String mem_change_pw) {
		// TODO Auto-generated method stub
		
		String result = "noPw";
		
		// DB의 암호화 비밀번호와 일치하면 비밀번호 변경작업 진행
		if(cryptPassEnc.matches(mem_cur_pw, mapper.currentPwConfirm(mem_id))) {
			mapper.changeNewPw(mem_id, mem_change_pw);
			result = "success";
		}
		
		return result;
	}

	@Override
	public int unregister(String mem_id, PasswordEncoder cryptPassEnc, String mem_pw) {
		// TODO Auto-generated method stub
		
		int count = 0; 
		
		if(cryptPassEnc.matches(mem_pw, mapper.currentPwConfirm(mem_id))) {
			count = mapper.unregister(mem_id);
		}
	
		return count;
	}

	
	
	
	
	
	
}
