package com.common.email;

/**
 * ���ʼ���
 * @author lenove
 *
 */
public class SimpleMail {
	private String subject;//�ռ���
	private Object content;//�ʼ�����
	
	public SimpleMail(String subject,String content){
		this.subject = subject;
		this.content = content;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}
	
}
