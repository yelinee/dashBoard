// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmSchedule.java

package kr.co.project3.scheduler;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.ModelAndView;

import com.google.inject.Inject;

import kr.co.project3.detailed.detailedCpuController;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.pages.alarm.dto.AlarmSettingDTO;
import kr.co.project3.service.alarmService;
import net.nurigo.java_sdk.api.Message;

@Configuration
@EnableScheduling
public class AlarmSchedule {

	@Autowired
	private alarmService service;
	
	@Inject
	JavaMailSender mailSender;
	
	public static boolean cpu_alert = false;
	public static boolean mem_alert = false;
	public static boolean disk_alert = false;
	public static boolean nw_alert = false;
	int check;
	Timestamp beforedate;
	String api_key;
	String api_secret;
	Message coolsms;

	public AlarmSchedule() {
		beforedate = null;
		api_key = "NCSDZSOIFLVJX5RB";
		api_secret = "G0RRGMZ1WSYSMR75PBLKFQ6GJUSZ2ADP";
		coolsms = new Message(api_key, api_secret);
	}

	public void scheduleFixedDelayTask() throws IOException {
		System.out.println("\uC2A4\uCF00\uC904\uB7EC \uC2DC\uC791");
		cpu_alert = false;
		ModelAndView mv = new ModelAndView();
		HashMap<String, String> params = new HashMap<String, String>();
		List<AlarmSettingDTO> check = service.cpu_over_check();
		AlarmLogDTO ldto = new AlarmLogDTO();
		if (!alarmController.empty(check).booleanValue()
				&& !((AlarmSettingDTO) check.get(0)).getDate().equals(beforedate)) {
			String id = ((AlarmSettingDTO) check.get(0)).getId();
			String email = ((AlarmSettingDTO) check.get(0)).getEmail();
			String level = ((AlarmSettingDTO) check.get(1)).getLevel();
			float usage = ((AlarmSettingDTO) check.get(0)).getUsage();
			Timestamp date = ((AlarmSettingDTO) check.get(0)).getDate();
			String hp = ((AlarmSettingDTO) check.get(0)).getHp();
			String ip = ((AlarmSettingDTO) check.get(0)).getIp();
			String setfrom = "yejin12241224@gmail.com";
			String tomail = email;
			String title = "";
			String text = "";
			System.out.println(date);
			if (level.equals("warning")) {
				title = "cpu \uACBD\uACE0 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C cpu \uACBD\uACE0 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC cpu \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
				params.put(api_key, text);
				cpu_alert = true;
			} else if (level.equals("danger")) {
				title = "cpu \uC704\uD5D8 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C cpu \uC704\uD5D8 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC cpu \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
				cpu_alert = true;
			}
			try {
				javax.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(text);
				mailSender.send(message);
				params.put("to", hp);
				params.put("from", "01062259554");
				params.put("type", "SMS");
				params.put("text", text);
				ldto.setResourceUsage(usage);
				ldto.setIp(ip);
				ldto.setDate(date);
				ldto.setLevel(level);
				ldto.setResource("CPU");
				service.insertCpuAlarmLog(ldto);
				detailedCpuController controller = new detailedCpuController();
				System.out.println("cpu controller\uD638\uCD9C");
				String check1 = controller.detailedCpuView();
				System.out.println(check1);
				System.out.println("cpu controller\uD638\uCD9C 2");
				beforedate = date;
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void mem_scheduled() throws IOException {
		HashMap<String, String> params = new HashMap<String, String>();
		List<AlarmSettingDTO> check = service.mem_over_check();
		AlarmLogDTO ldto = new AlarmLogDTO();
		if (!alarmController.empty(check).booleanValue()
				&& !((AlarmSettingDTO) check.get(0)).getDate().equals(beforedate)) {
			String id = ((AlarmSettingDTO) check.get(0)).getId();
			String email = ((AlarmSettingDTO) check.get(0)).getEmail();
			String level = ((AlarmSettingDTO) check.get(1)).getLevel();
			float usage = ((AlarmSettingDTO) check.get(0)).getUsage();
			Timestamp date = ((AlarmSettingDTO) check.get(0)).getDate();
			String hp = ((AlarmSettingDTO) check.get(0)).getHp();
			String ip = ((AlarmSettingDTO) check.get(0)).getIp();
			String setfrom = "yejin12241224@gmail.com";
			String tomail = email;
			String title = "";
			String text = "";
			if (level.equals("warning")) {
				title = "\uBA54\uBAA8\uB9AC \uACBD\uACE0 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uBA54\uBAA8\uB9AC \uACBD\uACE0 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uBA54\uBAA8\uB9AC \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
				params.put(api_key, text);
			} else if (level.equals("danger")) {
				title = "\uBA54\uBAA8\uB9AC \uC704\uD5D8 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uBA54\uBAA8\uB9AC \uC704\uD5D8 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uBA54\uBAA8\uB9AC \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
			}
			try {
				javax.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(text);
				mailSender.send(message);
				params.put("to", hp);
				params.put("from", "01062259554");
				params.put("type", "SMS");
				params.put("text", text);
				ldto.setResourceUsage(usage);
				ldto.setIp(ip);
				ldto.setDate(date);
				ldto.setLevel(level);
				ldto.setResource("Memory");
				service.insertMemAlarmLog(ldto);
				beforedate = date;
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void disk_scheduled() throws IOException {
		System.out.println(
				(new StringBuilder("\uD604\uC7AC\uC2DC\uAC04:")).append(System.currentTimeMillis() / 1000L).toString());
		HashMap<String, String> params = new HashMap<String, String>();
		List<AlarmSettingDTO> check = service.disk_over_check();
		AlarmLogDTO ldto = new AlarmLogDTO();
		
		if (!alarmController.empty(check).booleanValue()
				&& !((AlarmSettingDTO) check.get(0)).getDate().equals(beforedate)) {
			String id = ((AlarmSettingDTO) check.get(0)).getId();
			String email = ((AlarmSettingDTO) check.get(0)).getEmail();
			String level = ((AlarmSettingDTO) check.get(1)).getLevel();
			float usage = ((AlarmSettingDTO) check.get(0)).getUsage();
			Timestamp date = ((AlarmSettingDTO) check.get(0)).getDate();
			String hp = ((AlarmSettingDTO) check.get(0)).getHp();
			String ip = ((AlarmSettingDTO) check.get(0)).getIp();
			String setfrom = "yejin12241224@gmail.com";
			String tomail = email;
			String title = "";
			String content = "";
			String text = "";
			if (level.equals("warning")) {
				title = "\uB514\uC2A4\uD06C \uACBD\uACE0 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uB514\uC2A4\uD06C \uACBD\uACE0 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uB514\uC2A4\uD06C \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
				params.put(api_key, text);
			} else if (level.equals("danger")) {
				title = "\uB514\uC2A4\uD06C \uC704\uD5D8 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uB514\uC2A4\uD06C \uC704\uD5D8 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uB514\uC2A4\uD06C \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
			}
			try {
				javax.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(text);
				mailSender.send(message);
				params.put("to", hp);
				params.put("from", "01062259554");
				params.put("type", "SMS");
				params.put("text", text);
				ldto.setResourceUsage(usage);
				ldto.setIp(ip);
				ldto.setDate(date);
				ldto.setLevel(level);
				ldto.setResource("Disk");
				service.insertDiskAlarmLog(ldto);
				beforedate = date;
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void nw_scheduled() throws IOException {
		HashMap<String, String> params = new HashMap<String, String>();
		List<AlarmSettingDTO> check = service.nw_over_check();
		AlarmLogDTO ldto = new AlarmLogDTO();
		if (!alarmController.empty(check).booleanValue()
				&& !((AlarmSettingDTO) check.get(0)).getDate().equals(beforedate)) {
			String id = ((AlarmSettingDTO) check.get(0)).getId();
			String email = ((AlarmSettingDTO) check.get(0)).getEmail();
			String level = ((AlarmSettingDTO) check.get(1)).getLevel();
			float usage = ((AlarmSettingDTO) check.get(0)).getUsage();
			Timestamp date = ((AlarmSettingDTO) check.get(0)).getDate();
			String hp = ((AlarmSettingDTO) check.get(0)).getHp();
			String ip = ((AlarmSettingDTO) check.get(0)).getIp();
			String setfrom = "yejin12241224@gmail.com";
			String tomail = email;
			String title = "";
			String content = "";
			String text = "";
			if (level.equals("warning")) {
				title = "\uB124\uD2B8\uC6CC\uD06C \uACBD\uACE0 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uB124\uD2B8\uC6CC\uD06C \uACBD\uACE0 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uB124\uD2B8\uC6CC\uD06C \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
				params.put(api_key, text);
			} else if (level.equals("danger")) {
				title = "\uB124\uD2B8\uC6CC\uD06C \uC704\uD5D8 \uC54C\uB78C\uC785\uB2C8\uB2E4.";
				text = (new StringBuilder(String.valueOf(ip))).append(
						" \uC11C\uBC84\uC5D0\uC11C \uB124\uD2B8\uC6CC\uD06C \uC704\uD5D8 \uC784\uACC4\uCE58\uB97C \uCD08\uACFC\uD558\uC600\uC2B5\uB2C8\uB2E4.")
						.append(System.getProperty("line.separator"))
						.append("\uD604\uC7AC \uB124\uD2B8\uC6CC\uD06C \uC0AC\uC6A9\uB7C9\uC740 ").append(usage)
						.append("\uC785\uB2C8\uB2E4.").append(System.getProperty("line.separator"))
						.append("\uBC1C\uC0DD\uC2DC\uAC01\uC740 ").append(date).append("\uC785\uB2C8\uB2E4.")
						.toString();
			}
			try {
				javax.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(text);
				mailSender.send(message);
				params.put("to", hp);
				params.put("from", "01062259554");
				params.put("type", "SMS");
				params.put("text", text);
				ldto.setResourceUsage(usage);
				ldto.setIp(ip);
				ldto.setDate(date);
				ldto.setLevel(level);
				ldto.setResource("Network");
				service.insertNwAlarmLog(ldto);
				beforedate = date;
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

}
