package com.dogmong.mapper;

import org.apache.ibatis.annotations.Param;

import com.dogmong.domain.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);
	
	public String checkID(String mem_id);
	
	public MemberVO login(String mem_id);
	
	public int modify(MemberVO vo);
	
	public String findPwReq(String mem_email);
	
	public int modifyTempPw(@Param("mem_email") String mem_email, @Param("mem_pw") String mem_pw);
	
	public String currentPwConfirm(String mem_id);
	
	public int changeNewPw(@Param("mem_id") String mem_id, @Param("mem_change_pw") String mem_change_pw);
	
	public int unregister(String mem_id);
	

	
}
