// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LogDTO.java

package kr.co.project3.log.dto;

import java.sql.Date;

public class LogDTO
{

    public LogDTO()
    {
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public Date getFrom()
    {
        return from;
    }

    public void setFrom(Date from)
    {
        this.from = from;
    }

    public Date getTo()
    {
        return to;
    }

    public void setTo(Date to)
    {
        this.to = to;
    }

    public String getFromHost()
    {
        return fromHost;
    }

    public void setFromHost(String fromHost)
    {
        this.fromHost = fromHost;
    }

    public String getFacility()
    {
        return facility;
    }

    public void setFacility(String facility)
    {
        this.facility = facility;
    }

    public String getSyslogTag()
    {
        return syslogTag;
    }

    public void setSyslogTag(String syslogTag)
    {
        this.syslogTag = syslogTag;
    }

    public String getPriority()
    {
        return priority;
    }

    public void setPriority(String priority)
    {
        this.priority = priority;
    }

    public String getProgramname()
    {
        return programname;
    }

    public void setProgramname(String programname)
    {
        this.programname = programname;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public void setReceivedAt(Date receivedAt)
    {
        this.receivedAt = receivedAt;
    }

    public Date getReceivedAt()
    {
        return receivedAt;
    }

    public void setDeviceTime(Date deviceTime)
    {
        this.deviceTime = deviceTime;
    }

    public Date getDeviceTime()
    {
        return deviceTime;
    }

    private String fromHost;
    private String id;
    private Date deviceTime;
    private Date receivedAt;
    private String facility;
    private String priority;
    private String message;
    private String syslogTag;
    private String programname;
    private Date from;
    private Date to;
}
