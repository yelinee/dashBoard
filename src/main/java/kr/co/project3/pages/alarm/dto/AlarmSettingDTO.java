// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmSettingDTO.java

package kr.co.project3.pages.alarm.dto;

import java.sql.Timestamp;

public class AlarmSettingDTO
{

    public AlarmSettingDTO()
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

    public String getHp()
    {
        return hp;
    }

    public void setHp(String hp)
    {
        this.hp = hp;
    }

    public String getLevel()
    {
        return level;
    }

    public void setLevel(String level)
    {
        this.level = level;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public float getUsage()
    {
        return usage;
    }

    public void setUsage(float usage)
    {
        this.usage = usage;
    }

    public Timestamp getDate()
    {
        return date;
    }

    public void setDate(Timestamp date)
    {
        this.date = date;
    }

    public String toString()
    {
        return (new StringBuilder("AlarmSettingDTO [id=")).append(id).append(",ip= ").append(ip).append(", email=").append(email).append(", usage=").append(usage).append(", date=").append(date).append(", level=").append(level).append("]").toString();
    }

    private String id;
    private String ip;
    private String hp;
    private String email;
    private float usage;
    private Timestamp date;
    private String level;
}
