// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmDTO.java

package kr.co.project3.pages.alarm.dto;

import java.sql.Date;

public class AlarmDTO
{

    public AlarmDTO()
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

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public boolean isCpu_warning()
    {
        return cpu_warning;
    }

    public void setCpu_warning(boolean cpu_warning)
    {
        this.cpu_warning = cpu_warning;
    }

    public boolean isCpu_danger()
    {
        return cpu_danger;
    }

    public void setCpu_danger(boolean cpu_danger)
    {
        this.cpu_danger = cpu_danger;
    }

    public boolean isMem_warning()
    {
        return mem_warning;
    }

    public void setMem_warning(boolean mem_warning)
    {
        this.mem_warning = mem_warning;
    }

    public boolean isMem_danger()
    {
        return mem_danger;
    }

    public void setMem_danger(boolean mem_danger)
    {
        this.mem_danger = mem_danger;
    }

    public boolean isDisk_warning()
    {
        return disk_warning;
    }

    public void setDisk_warning(boolean disk_warning)
    {
        this.disk_warning = disk_warning;
    }

    public boolean isDisk_danger()
    {
        return disk_danger;
    }

    public void setDisk_danger(boolean disk_danger)
    {
        this.disk_danger = disk_danger;
    }

    public boolean isNw_warning()
    {
        return nw_warning;
    }

    public void setNw_warning(boolean nw_warning)
    {
        this.nw_warning = nw_warning;
    }

    public boolean isNw_danger()
    {
        return nw_danger;
    }

    public void setNw_danger(boolean nw_danger)
    {
        this.nw_danger = nw_danger;
    }

    private String ip;
    private Date date;
    private boolean cpu_warning;
    private boolean cpu_danger;
    private boolean mem_warning;
    private boolean mem_danger;
    private boolean disk_warning;
    private boolean disk_danger;
    private boolean nw_warning;
    private boolean nw_danger;
}
