package com.dogmong.mapper;

import com.dogmong.domain.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);
	
	public String checkID(String mem_id);
}
