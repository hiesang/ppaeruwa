package mvc.service;

import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import mvc.vo.Email;
import mvc.vo.Member;

@Service
public class MailService {
	// JavaMailSender를 autowired 처리
	@Autowired(required=false)
	protected JavaMailSender mailSender;
	// 메일 전송시 처리할 내용
	public void sendMail(Member member) throws Exception{
		// 전송될 내용은 MimeMessage로 처리
		MimeMessage msg = mailSender.createMimeMessage();
		// 발신자: 임의설정
		msg.setFrom(new InternetAddress("ley9472@gmail.com"));
		// view단에서 넘겨온 데이터 설정
		msg.setSubject("비밀번호 안내 메일입니다.");
		msg.setText("안녕하세요. 회원님의 비밀번호는 " + member.getPassword() + "입니다.");
		// 수신자
		msg.setRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));
		mailSender.send(msg);
	}
	
	public String checkUserEmail(String email) throws Exception{
		String uuid = UUID.randomUUID().toString().substring(0, 7);
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setFrom(new InternetAddress("ley9472@gmail.com"));
		msg.setSubject("이메일 인증 메일입니다.");
		msg.setText("안녕하세요. 아래 인증번호를 회원가입 페이지에 입력해주세요.\n" + "인증번호는 " + uuid + " 입니다.");
		msg.setRecipient(RecipientType.TO, new InternetAddress(email));
		mailSender.send(msg);
		
		return uuid;
	}
}
