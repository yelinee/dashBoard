// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DashBoardController.java

package kr.co.project3.dashBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.dashBoard.dto.ServerInfoDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.ServerService;

@Controller
public class DashBoardController {

	
	@Autowired
	private ServerService sservice;
	
	String id;

	
	@RequestMapping(value="/")
	public String DashBoardView(HttpSession session, Model model) throws Exception {
		System.out.println("dashBoard");

		UserDTO udto = (UserDTO) session.getAttribute("dto_info");
		if (alarmController.empty(udto) == false) {
			id = udto.getId();
			List<ServerInfoDTO> list = sservice.getServerInfo(id);
	
			for (ServerInfoDTO sdto:list) {
				System.out.println((new StringBuilder("ip:")).append(sdto.getIp()).toString());
				System.out.println((new StringBuilder("version")).append(sdto.getVersion()).toString());
			}

			model.addAttribute("list", list);
		}
		return "dashBoard/dashBoard.tiles";
	}

}
