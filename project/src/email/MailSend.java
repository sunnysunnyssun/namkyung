package email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import member.PMemberBean;

public class MailSend {

	public static void main(String[] args) {
		
	}
	
	public static void Send(PMemberBean mb) {

		try {
			Properties props = System.getProperties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port","587");
			
			Authenticator auth = new MailAuth();
			
			Session session = Session.getDefaultInstance(props, auth);
			System.out.println("잘가늬1");

			MimeMessage msg = new MimeMessage(session);
			System.out.println("잘가늬2");

				msg.setSentDate(new Date());
				
				msg.setFrom(new InternetAddress("forprojectjsp@gmail.com", "NK Company"));
				InternetAddress to = new InternetAddress(mb.getEmail());
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject(mb.getName()+"님의 회원가입을 축하합니다.", "UTF-8");
//				msg.setText("안녕하세요 테스트 메일입니다", "UTF-8");
				msg.setContent("<h1>" + mb.getName()+ "님의 회원가입을 축하드립니다.</h1>"
						+ "<h3>아이디 : " + mb.getId() + "</h3>"
						+ "<h3>가입일시 : " + mb.getReg_date().toString() + "</h3>"
						+" <h4>감사합니다. 좋은하루 되세요~ </h4>"						
						,"text/html;charset=utf-8");

		
				Transport.send(msg);
				System.out.println("잘가늬4");
		} catch (AddressException e) {
			System.out.println("주소 예외 발생 : " + e.getMessage());
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("지원하지 않는 인코딩 : " + e.getMessage());
		} catch (MessagingException e) {
			System.out.println("메일 계정인증 관련 예외 발생 : " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	
}
