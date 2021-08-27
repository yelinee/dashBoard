// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   detailedMemController.java

package kr.co.project3.detailed;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class detailedMemController
{

    public detailedMemController()
    {
    }

    @RequestMapping(value="detailedMem")
    public ModelAndView detailedCpuView(ModelAndView mv)
        throws Exception
    {
        mv.setViewName("dashBoard/memDashboard.tiles");
        return mv;
    }
}
