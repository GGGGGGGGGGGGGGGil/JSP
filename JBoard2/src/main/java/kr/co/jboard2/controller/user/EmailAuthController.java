package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

@WebServlet("/user/emailAuth.do")
public class EmailAuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String receiveremail = req.getParameter("email"); //리시버(수신받을 이메일)
		
		//인증코드 생성(6자리 for문 돌려야함, 프로그램에서 랜덤 값은 완전 핸덤x)
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000); //이게 가장 깔끔
		
		//기본정보
		String sender = "javapext@gmail.com";
		String password = "ahqbfjbfnpooulmy";
		
		String title = "JBoard2 인증코드 입니다.";
		String content = "인증코드 6자리는 "+code+" 입니다.";
		
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
		int status = 0;
		
		try {
			System.out.println("메일 전송 시작...");
			
			message.setFrom(new InternetAddress(sender, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveremail));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			status = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일 전송 실패...");
			status = 0;
		}
		
		//JSON 출력
		JsonObject json = new JsonObject();
		json.addProperty("status", status);
		json.addProperty("code", code);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
