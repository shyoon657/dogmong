package com.dogmong.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	// mem_id, mem_name, mem_pw, mem_zipcode, mem_addr, mem_deaddr, mem_phone, 
	// mem_email, mem_receive, mem_point, mem_regdate, mem_revdate, mem_logdate
	
	private String mem_id;
	private String mem_name;
	private String mem_pw;
	private String mem_zipcode;
	private String mem_addr;
	private String mem_de_addr;
	private String mem_phone;
	private String mem_email;
	private String mem_rec_email;
	private int mem_point;
	private Date mem_regdate;
	private Date mem_revdate;
	private Date mem_logdate;
	
}
