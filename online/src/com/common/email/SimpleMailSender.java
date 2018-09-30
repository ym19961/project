package com.common.email;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SimpleMailSender {
	private final transient Properties props = System.getProperties();
	private MailAuthenticator authenticator;
	private transient Session session;
	
	public SimpleMailSender(final String smtpHostName,final String username,final String password){
		init(smtpHostName,username,password);
	}
	public SimpleMailSender(final String username,final String password){
		final String smtpHostName = "smtp." + username.split("@")[1];
		init(smtpHostName,username,password);
	}
	public SimpleMailSender(){
		InputStream i = getClass().getResourceAsStream("mailprop.properties");
		Properties prop = new Properties();
		try {
			prop.load(i);
			final String username = prop.getProperty("username");
			final String password = prop.getProperty("password");
			final String smtpHostName = "smtp." + username.split("@")[1];
			init(smtpHostName,username,password);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void init(final String smtpHostName,final String username,final String password){
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", smtpHostName);
		props.put("mail.smtp.port", "25");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.timeout", "50000");
		authenticator = new MailAuthenticator(username,password);
		session = Session.getInstance(props,authenticator);
		//session.setDebug(true);
	}
	public void sendMail(String recipient,String subject,Object content) throws AddressException, MessagingException{
		final MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(authenticator.getUsername()));
		message.setRecipient(RecipientType.TO, new InternetAddress(recipient));
		message.setSubject(subject);
		message.setContent(content.toString(), "text/html;charset=utf-8");
		Transport.send(message);
	}
	public void sendMails(List recipient,String subject,Object content) throws MessagingException{
		final MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(authenticator.getUsername()));
		InternetAddress internetaddress[] = new InternetAddress[recipient.size()];
		int i = 0;
		for(Object o:recipient){
			internetaddress[i++] = new InternetAddress(o.toString());
		}
		message.setRecipients(RecipientType.TO, internetaddress);
		message.setSubject(subject);
		message.setContent(content.toString(), "text/html;charset=utf-8");
		Transport.send(message);
	}
	public void sendMail(String recipient,SimpleMail simplemail) throws AddressException, MessagingException{
		sendMail(recipient,simplemail.getSubject(),simplemail.getContent());
	}
	public void sendMails(List recipient,SimpleMail simplemail) throws MessagingException{
		sendMails(recipient,simplemail.getSubject(),simplemail.getContent());
	}
	
	public static void main(String[] args) {
		try {
			SimpleMailSenderFactory.getInstance().sendMail("suttutormanage@163.com", "������ҵ��ѧ��ʦ���Ĺ���ϵͳ", "����������Ŀ��֤��ͨ��");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
