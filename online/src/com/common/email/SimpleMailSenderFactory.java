package com.common.email;

public class SimpleMailSenderFactory {
	private static SimpleMailSender sms;
	
	public static SimpleMailSender getInstance() {
		if(sms == null) {
			sms = new SimpleMailSender();
		}
		return sms;
	}
}
