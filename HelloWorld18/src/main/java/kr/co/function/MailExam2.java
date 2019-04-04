package kr.co.function;

import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class MailExam2 {
	public static void main() {
		try {
			new MailExam2();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
		}
	}
	public MailExam2() throws Exception{
		
		Properties props=new Properties();
		
		props.setProperty("mail.transport.protocol","smtp");
		props.setProperty("mail.host", "smtp.naver.com");
		props.setProperty("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");
		
		Authenticator auth=new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("kh060515@naver.com","kyunghoon970605!");
				//사용할 메일의 아이디 비밀번호 입력
			}
		};
		Session session=Session.getDefaultInstance(props, auth);
		
		MimeMessage message=new MimeMessage(session);
		message.setSender(new InternetAddress("kh060515@naver.com"));
		message.setSubject("임시비밀번호입니다..");	//메일 제목
		
		message.setRecipient(Message.RecipientType.TO,new InternetAddress("kh060515@naver.com"));
		//받는 사람 메일
		Multipart mp=new MimeMultipart();
		MimeBodyPart mbp1=new MimeBodyPart();
		mbp1.setText("임시비밀번호 test입니다.");
		mp.addBodyPart(mbp1);
		
		MailcapCommandMap mc=(MailcapCommandMap) CommandMap.getDefaultCommandMap();
		mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		mc.addMailcap("multipart/*;;x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		mc.addMailcap("text/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		
		message.setContent(mp);
		
		Transport.send(message);
	}
}
