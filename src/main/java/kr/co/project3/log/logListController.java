// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   logListController.java

package kr.co.project3.log;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.log.dto.Criteria;
import kr.co.project3.log.dto.LogDTO;
import kr.co.project3.log.dto.PageMaker;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.LogService;


@Controller
public class logListController
{

	@Autowired
	private LogService service;

	
	@RequestMapping(value="logList")
    public String LogListPage(String from, String to, Criteria cri, Model model, LogDTO dto, HttpSession session)
        throws ParseException
    {
        if(from != null && to != null)
        {
            System.out.println(from);
            System.out.println(to);
        } else
        {
            System.out.println("null!!");
        }
        UserDTO udto = (UserDTO)session.getAttribute("dto_info");
        int totalcount = 0;
        if(!alarmController.empty(udto).booleanValue())
        {
            String id = udto.getId();
            if(!id.equals(null) || id != null)
            {
                cri.setId(id);
                totalcount = service.countLog(id);
                PageMaker pageMaker = new PageMaker();
                pageMaker.setCri(cri);
                pageMaker.setTotalCount(totalcount);
                List<LogDTO> list = service.selectLog(cri);
                model.addAttribute("LogList", list);
                model.addAttribute("pageMaker", pageMaker);
            }
        }
        return "log/logList.tiles";
    }

    
}
