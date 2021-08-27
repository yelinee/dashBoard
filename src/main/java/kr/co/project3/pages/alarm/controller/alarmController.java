// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   alarmController.java

package kr.co.project3.pages.alarm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.inject.Inject;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.pages.alarm.dto.ThresholdDTO;
import kr.co.project3.service.ThService;


@Controller
public class alarmController
{

	@Inject
	JavaMailSender mailSender;

	@Autowired
	private ThService thService;
	
	// 서비스 호출 private ThresholdDTO tdto;
	private UserDTO udto;


    public static Boolean empty(Object obj)
    {
        if(obj instanceof String)
            if(obj != null && !"".equals(obj.toString().trim()))
                return Boolean.valueOf(false);
            else
                return Boolean.valueOf(true);
        if(obj instanceof List)
            if(obj != null && !((List)obj).isEmpty())
                return Boolean.valueOf(false);
            else
                return Boolean.valueOf(true);
        if(obj instanceof Map)
            if(obj != null && !((Map)obj).isEmpty())
                return Boolean.valueOf(false);
            else
                return Boolean.valueOf(true);
        if(obj instanceof Object[])
            if(obj != null && Array.getLength(obj) != 0)
                return Boolean.valueOf(false);
            else
                return Boolean.valueOf(true);
        if(obj == null)
            return Boolean.valueOf(true);
        else
            return Boolean.valueOf(false);
    }

    @RequestMapping(value="alarmSetting")
    public String ArlamSettingView(Model model, HttpSession session) throws Exception
    {
        UserDTO dto = (UserDTO)session.getAttribute("dto_info");
        if(empty(dto)==false)
        {
            String id = dto.getId();
            List<ThresholdDTO> th_List = thService.th_select(id);
            
            HashMap<String,String> check_result = thService.th_check_select(id);
          
            for(ThresholdDTO tdto : th_List)
            {
                String cpu_warning = tdto.getCpu_warning();
                String cpu_danger = tdto.getCpu_danger();
                String mem_warning = tdto.getMem_warning();
                String mem_danger = tdto.getMem_danger();
                String disk_warning = tdto.getDisk_warning();
                String disk_danger = tdto.getDisk_danger();
                int netusernum = tdto.getNetusernum();
                int portuser = tdto.getPortuser();
              
                model.addAttribute("cpu_warning", cpu_warning);
                model.addAttribute("cpu_danger", cpu_danger);
                model.addAttribute("mem_warning", mem_warning);
                model.addAttribute("mem_danger", mem_danger);
                model.addAttribute("disk_warning", disk_warning);
                model.addAttribute("disk_danger", disk_danger);
                model.addAttribute("netusernum", netusernum);
                model.addAttribute("portuser", portuser);
             
            }

            model.addAttribute("check_result", check_result);
        }
        return "alarm/alarmSetting.tiles";
    }

    @RequestMapping(value="alarm_threshold")
    public String AlarmThresholdSetting(ThresholdDTO tdto, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
        throws IOException
    {
        UserDTO dto = (UserDTO)session.getAttribute("dto_info");
        if(!empty(dto).booleanValue())
        {
            String id = dto.getId();
            if(!id.equals(null))
            {
                String check[] = request.getParameterValues("check");
                System.out.println(id);
                tdto.setId(id);
                thService.thSave(tdto);
                HashMap<String,String> check_result = thService.th_Check_save(check, id);
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out_print = response.getWriter();
                out_print.println("<script>alert('임계치가 저장되었습니다.');</script>");
                out_print.flush();
                
                List<ThresholdDTO> th_List = thService.th_select(id);
               
                for(ThresholdDTO tdtoLi : th_List)
                {
                    
                    String cpu_warning = tdtoLi.getCpu_warning();
                    String cpu_danger = tdtoLi.getCpu_danger();
                    String mem_warning = tdtoLi.getMem_warning();
                    String mem_danger = tdtoLi.getMem_danger();
                    String disk_warning = tdtoLi.getDisk_warning();
                    String disk_danger = tdtoLi.getDisk_danger();
                    int netusernum = tdto.getNetusernum();
                    int portuser = tdto.getPortuser();
                    
                    
                    System.out.println(cpu_warning);
                    System.out.println(mem_warning);
                    System.out.println(disk_warning);
                    System.out.println(netusernum);
                    System.out.println(portuser);
                    
                    model.addAttribute("cpu_warning", cpu_warning);
                    model.addAttribute("cpu_danger", cpu_danger);
                    model.addAttribute("mem_warning", mem_warning);
                    model.addAttribute("mem_danger", mem_danger);
                    model.addAttribute("disk_warning", disk_warning);
                    model.addAttribute("disk_danger", disk_danger);
                    model.addAttribute("netusernum", netusernum);
                    model.addAttribute("portuser", portuser);
                }

                model.addAttribute("check_result", check_result);
            }
        } else
        {
        	
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out_print = response.getWriter();
            out_print.println("<script>alert('로그인후 이용해주세요.');</script>");
            out_print.flush();
            return "User/login.tiles";
            
        }
        
        return "alarm/alarmSetting.tiles";
    }

}
