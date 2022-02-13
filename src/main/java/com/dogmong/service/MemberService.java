package com.dogmong.service;

import com.dogmong.domain.MemberVO;

public interface MemberService {

	public int join(MemberVO vo);
	
	public String checkID(String mem_id);
	
	
}
