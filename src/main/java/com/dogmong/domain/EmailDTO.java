package com.dogmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class EmailDTO {

	private String m_senderName;
	private String m_senderMail;
	private String m_receiveMail;
	private String m_title;
	private String m_message;
	 
}
