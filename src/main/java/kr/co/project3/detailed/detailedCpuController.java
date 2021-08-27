// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   detailedCpuController.java

package kr.co.project3.detailed;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class detailedCpuController
{

    public detailedCpuController()
    {
    }

    @RequestMapping(value="detailedCpu")
    public String detailedCpuView()
        throws Exception
    {
        return "dashBoard/cpuDashboard.tiles";
    }
}
