package kr.co.jboard2.test;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailTest {

	public static void main(String[] args) {
		
		//기본정보
		String sender = "javapext@gmail.com";
		String password = "ahqbfjbfnpooulmy";
		
		String receiver = "kkkk6030_@naver.com";
		String title = "따끈 따끈한 스팸 메일 입니다.";
		String content = "테스트 완료";
		
		//Gmail SMTP 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//미리 등록한 사용자 정보를 가지고 Gmail 서버 인증
		Session session = Session.getInstance(props, new Authenticator() { //세션 javax.mail로 객체 생성
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password); //샌더, 패스워드 값 입력
			}
			
		});
		
		//이메일 발송
		Message message = new MimeMessage(session);
		
		try {
			System.out.println("메일 전송 시작...");
			
			message.setFrom(new InternetAddress(sender, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일 전송 실패...");
		}
		
		System.out.println("메일 전송 성공...");
	}
}
