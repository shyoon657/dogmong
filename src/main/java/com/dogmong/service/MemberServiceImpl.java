package com.dogmong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
