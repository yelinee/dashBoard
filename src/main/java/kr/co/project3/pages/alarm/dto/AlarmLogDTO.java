// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmLogDTO.java

package kr.co.project3.pages.alarm.dto;

import java.sql.Timestamp;

public class AlarmLogDTO
{

    public AlarmLogDTO()
    {
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public float getResourceUsage()
    {
        return resourceUsage;
    }

    public void setResourceUsage(float resourceUsage)
    {
        this.resourceUsage = resourceUsage;
    }

    public String getLevel()
    {
        return level;
    }

    public void setLevel(String level)
    {
        this.level = level;
    }

    public String getResource()
    {
        return resource;
    }

    public void setResource(String resource)
    {
        this.resource = resource;
    }

    public Timestamp getDate()
    {
        return date;
    }

    public void setDate(Timestamp date)
    {
        this.date = date;
    }

    private String ip;
    private float resourceUsage;
    private String level;
    private String resource;
    private Timestamp date;
}
