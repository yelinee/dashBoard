// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   alarmRecieveController.java

package kr.co.project3.pages.alarm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class alarmRecieveController
{

    public alarmRecieveController()
    {
    }

    @RequestMapping(value="alarmRecieveSetting")
    public ModelAndView alarmRecieveSetting(ModelAndView mv)
        throws Exception
    {
        mv.setViewName("alarm/alarmRecieveSetting.tiles");
        return mv;
    }
}
