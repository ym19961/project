package com.common.email;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * ������Ȩ��
 * @author lenove
 *
 */
public class MailAuthenticator extends Authenticator{
	private String username;//�����ַ
	private String password;//��Ȩ��
	
	public MailAuthenticator(String username,String password){
		this.username = username;
		this.password = password;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(this.username,this.password);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
