package com.mycompany.gofarm.job.config;


import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Bean
	public static JavaMailSender mailSender() {
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		Properties prop = new Properties();
		prop.put("mail.transport", "smtp");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.debug", "true");
		
		mailSender.setHost("smtp.gmail.com");
		mailSender.setUsername("gofarm16@gmail.com");
		mailSender.setPassword("1q2w3e4r!@");
		mailSender.setPort(587);
		mailSender.setJavaMailProperties(prop);
		
		return mailSender;
	}
	
}
