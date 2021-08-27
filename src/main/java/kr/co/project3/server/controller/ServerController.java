// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServerController.java

package kr.co.project3.server.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.server.dto.ServerDTO;
import kr.co.project3.service.ServerService;

@Controller
public class ServerController {
	
	@Autowired
	private ServerService service;

	@RequestMapping(value = "serverSetting")
	public ModelAndView serverSettingPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("server/serverSetting.tiles");
		return mv;
	}

	
	@RequestMapping(value="server_setting")
	public String serverSetting(ServerDTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserDTO udto = (UserDTO) session.getAttribute("dto_info");
		if (!alarmController.empty(udto).booleanValue()) {
			String id = udto.getId();
			dto.setId(id);
			String IP = dto.getIp();
			int ip_check = service.check_ip(IP);
			if (ip_check != 0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out_print = response.getWriter();
				out_print.println("<script>alert('중복되는 서버가 있습니다.');</script>");
				out_print.flush();
			} else {
				service.insert_server(dto);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter server_setting_print = response.getWriter();
				server_setting_print.println("<script>alert('서버등록이 완료되었습니다.');</script>");
				server_setting_print.flush();
			}
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out_print = response.getWriter();
			out_print.println("<script>alert('로그인을 먼저 진행해주세요.');</script>");
			out_print.flush();
			return "User/login.tiles";
		}
		return "dashBoard/dashBoard.tiles";
	}

}
