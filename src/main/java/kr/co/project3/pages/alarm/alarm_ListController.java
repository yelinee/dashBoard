// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   alarm_ListController.java

package kr.co.project3.pages.alarm;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.log.dto.Criteria;
import kr.co.project3.log.dto.PageMaker;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.service.alarmService;


@Controller
public class alarm_ListController
{
	@Autowired
	private alarmService service;

    public alarm_ListController()
    {
    }

    @RequestMapping(value="alarm_List")
    public String AlarmListView(Criteria cri, Model model, HttpSession session)
        throws Exception
    {
        int totalCount = 0;
        UserDTO dto = (UserDTO)session.getAttribute("dto_info");
        if(!alarmController.empty(dto).booleanValue())
        {
            String id = dto.getId();
            cri.setId(id);
            totalCount = service.countAlarm(id);
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalCount(totalCount);
            List<AlarmLogDTO> list = service.getAlarmLog(cri);
            AlarmLogDTO ldto;
            for(Iterator iterator = list.iterator(); iterator.hasNext(); System.out.println(ldto.getResourceUsage()))
            {
                ldto = (AlarmLogDTO)iterator.next();
                System.out.println(ldto.getResource());
            }

            model.addAttribute("list", list);
            model.addAttribute("pageMaker", pageMaker);
        }
        return "alarm/alarm_List.tiles";
    }

    public String headerTiles(HttpSession session, Model model)
    {
        System.out.println("header.tiles controller");
        UserDTO dto = (UserDTO)session.getAttribute("dto_info");
        if(!alarmController.empty(dto).booleanValue())
        {
            String id = dto.getId();
            List<AlarmLogDTO> list = service.getAlarmList4(id);
            if(!alarmController.empty(list).booleanValue())
            {
                AlarmLogDTO ldto;
                for(Iterator iterator = list.iterator(); iterator.hasNext(); System.out.println((new StringBuilder("ws2: ")).append(ldto.getResourceUsage()).toString()))
                {
                    ldto = (AlarmLogDTO)iterator.next();
                    System.out.println((new StringBuilder("ws6:")).append(ldto.getIp()).toString());
                    System.out.println((new StringBuilder("ws2: ")).append(ldto.getResource()).toString());
                }

            }
        }
        return "tiles/header.jsp";
    }

 
}
