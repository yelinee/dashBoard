// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UserController.java

package kr.co.project3.User.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.inject.Inject;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.UserService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class UserController {

	@Inject
	JavaMailSender mailSender;

	@Autowired
	private UserService userService;

	String Name;
	String Id;
	String Hp;
	String Email;
	String passWord;
	String SmsMessage;
	String EmailMessage;

	@RequestMapping(value = "login")
	public ModelAndView loginView(ModelAndView mv) throws Exception {

		mv.setViewName("User/login.tiles");
		return mv;
	}

	@RequestMapping(value = "login_check")
	public ModelAndView login_check(UserDTO dto, HttpSession session) {
		int id_check_Result = userService.id_check(dto);
		String msg = "";
		String url = "";

		if (id_check_Result == 0) {
			msg = "일치하는 로그인 정보가 없습니다.";
			url = "User/login.tiles";
		} else {
			userService.userLogin(dto, session);
			url = "dashBoard/dashBoard.tiles";
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName(url);
		mv.addObject("msg", msg);
		return mv;
	}

	@RequestMapping(value = "join")
	public String userJoinPage() {
		return "User/join.tiles";
	}

	@RequestMapping(value = "join_check")
	public ModelAndView join_check(UserDTO dto, HttpServletResponse response_equals) throws IOException {
		String msg = "";
		ModelAndView mv = new ModelAndView();
		int Id_Check_Result = userService.Id_Check(dto);

		System.out.println(Id_Check_Result);

		if (Id_Check_Result != 0) {
			mv.setViewName("User/join.tiles");
			mv.addObject("msg", "중복되는 id가 있습니다.");
			System.out.println(msg);
		} else {
			if (!alarmController.empty(SmsMessage).booleanValue()
					&& !alarmController.empty(EmailMessage).booleanValue()) {
				userService.userJoin(dto);
				mv.setViewName("User/login.tiles");
			} else {
				response_equals.setContentType("text/html;charset=UTF-8");
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('휴대폰과 이메일 인증을 완료해주세요.');</script>");
				out_equals.flush();
				mv.setViewName("User/join.tiles");
			}
			mv.addObject("id", dto.getId());
			mv.addObject("hp", dto.getHp());
			mv.addObject("name", dto.getName());
			mv.addObject("passwd", dto.getPasswd());
			mv.addObject("email", dto.getEmail());
		}
		return mv;
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "User/login.tiles";
	}

	@RequestMapping(value = "email_auth_con")
	public ModelAndView mailSending(HttpServletRequest request, String id, String hp, String passwd, String name,
			String email, HttpServletResponse response_email) throws IOException {
		Name = name;
		Id = id;
		Hp = hp;
		Email = email;
		passWord = passwd;
		Random r = new Random();
		int dice = r.nextInt(0x460732) + 49311;
		String setfrom = "yejin12241224@gmail.com";
		String tomail = request.getParameter("email");
		if (tomail.equals(null) || tomail.equals("")) {
			response_email.setContentType("text/html;charset=UTF-8");
			PrintWriter out_email = response_email.getWriter();
			out_email.println("<script>alert('이메일인증이 완료되었습니다.');</script>");
			out_email.flush();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("User/email.tiles");
			return mv;
		}
		String title = "이메일 인증 ";
		String content = (new StringBuilder(String.valueOf(System.getProperty("line.separator"))))
				.append(System.getProperty("line.separator"))
				.append("\uFFFD\u0233\uFFFD\uFFFD\u03FC\uFFFD\uFFFD\uFFFD. \uFFFD\uFFFD\uFFFD\uFFFD \uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD \343\uFFFD\uFFFD\uFFFD\u05BC\u017C\uFFFD \uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\u0574\u03F4\uFFFD.")
				.append(System.getProperty("line.separator")).append(System.getProperty("line.separator"))
				.append("\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\u0223\uFFFD\uFFFD ").append(dice)
				.append("\uFFFD\u0534\u03F4\uFFFD.").append(System.getProperty("line.separator"))
				.append(System.getProperty("line.separator"))
				.append("\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD \uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\u0223\uFFFD\uFFFD \uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD \uFFFD\u0537\uFFFD\uFFFD\uFFFD\uFFFD\u05BC\uFFFD\uFFFD\uFFFD.")
				.toString();
		try {
			javax.mail.internet.MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("User/email_auth.tiles");
		mv.addObject("dice", Integer.valueOf(dice));
		System.out.println((new StringBuilder("mv:")).append(mv).toString());
		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println(
				"<script>alert('이메일 인증절차를 진행해주세요.');</script>");
		out_email.flush();
		return mv;
	}

	@RequestMapping(value = "join_auth{dice}")
	public ModelAndView join_auth(HttpServletRequest request, @PathVariable String dice,
			String email_auth, /* String dice, */
			HttpServletResponse response_equals) throws IOException {
		System.out.println((new StringBuilder(" email_auth : "))
				.append(email_auth).toString());
		System.out
				.println((new StringBuilder(" dice : ")).append(dice).toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("User/join.tiles");
		mv.addObject("e_mail", email_auth);
		if (email_auth.equals(dice)) {
			mv.setViewName("User/join.tiles");
			EmailMessage = "이메일 인증 완료";
			System.out.println((new StringBuilder("id:")).append(Id).toString());
			System.out.println((new StringBuilder("email")).append(Email).toString());
			System.out.println((new StringBuilder("hp")).append(Hp).toString());
			System.out.println((new StringBuilder("name")).append(Name).toString());
			System.out.println((new StringBuilder("passwd")).append(passWord).toString());
			mv.addObject("id", Id);
			mv.addObject("email", Email);
			mv.addObject("hp", Hp);
			mv.addObject("passwd", passWord);
			mv.addObject("name", Name);
			mv.addObject("sucessMsg", EmailMessage);
			mv.addObject("sucessSmsAuth", SmsMessage);
			request.setAttribute("sucessSmsAuth", SmsMessage);
			request.setAttribute("sucessMsg", EmailMessage);
			response_equals.setContentType("text/html;charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('이메일 인증이 완료되었습니다.');</script>");
			out_equals.flush();
			return mv;
		}
		if (email_auth != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("User/email_auth.tiles");
			response_equals.setContentType("text/html;charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('이메일 인증번호가 일치하지 않습니다. 다시 진행해주세요.'); history.go(-1);</script>");
			out_equals.flush();
			return mv2;
		} else {
			return mv;
		}
	}

	@RequestMapping(value = "hp_auth_con")
	public ModelAndView hp_auth(String name, String id, String passwd, String hp, String email) {
		Id = id;
		Name = name;
		passWord = passwd;
		Hp = hp;
		Email = email;
		String api_key = "NCSDZSOIFLVJX5RB";
		String api_secret = "G0RRGMZ1WSYSMR75PBLKFQ6GJUSZ2ADP";
		Message coolsms = new Message(api_key, api_secret);
		Random random = new Random();
		int dice_hp = random.nextInt(0x460732) + 49311;
		System.out.println(
				(new StringBuilder("\uFFFD\u07B4\uFFFD\uFFFD\uFFFD \uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\u0223:"))
						.append(dice_hp).toString());
		HashMap<String, String> params = new HashMap<String, String>();
		String text = (new StringBuilder("\uC778\uC99D \uBC88\uD638\uB294 ")).append(dice_hp)
				.append("\uC785\uB2C8\uB2E4.").toString();
		params.put("to", hp);
		params.put("from", "01062259554");
		params.put("type", "SMS");
		params.put("text", text);
		try {
			JSONObject obj = coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("User/hp_auth.tiles");
		mv.addObject("dice_hp", Integer.valueOf(dice_hp));
		return mv;
	}

	@RequestMapping(value = "hp_auth{dice_hp}")
	public ModelAndView hp_auth(HttpServletRequest request, String hp_auth, @PathVariable String dice_hp,/*String dice_hp,*/
			HttpServletResponse response_equals) throws IOException {
		System.out.println((new StringBuilder("hp_auth : ")).append(hp_auth).toString());
		System.out.println(
				(new StringBuilder("\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD : dice : ")).append(dice_hp).toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("User/join.tiles");
		if (hp_auth.equals(dice_hp)) {
			SmsMessage = "sms인증 완료";
			mv.setViewName("User/join.tiles");
			mv.addObject("id", Id);
			mv.addObject("email", Email);
			mv.addObject("hp", Hp);
			mv.addObject("passwd", passWord);
			mv.addObject("name", Name);
			mv.addObject("sucessMsg", EmailMessage);
			mv.addObject("sucessSmsAuth", SmsMessage);
			request.setAttribute("sucessSmsAuth", SmsMessage);
			request.setAttribute("sucessMsg", EmailMessage);
			response_equals.setContentType("text/html;charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('휴대폰 인증이 완료되었습니다.');</script>");
			out_equals.flush();
			return mv;
		}
		if (hp_auth != dice_hp) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("User/hp_auth.tiles");
			response_equals.setContentType("text/html;charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지 않습니다. 다시 진행해주세요'); history.go(-1);</script>");
			out_equals.flush();
			return mv2;
		} else {
			return mv;
		}
	}

}
