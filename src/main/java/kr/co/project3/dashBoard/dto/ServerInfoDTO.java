// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServerInfoDTO.java

package kr.co.project3.dashBoard.dto;


public class ServerInfoDTO
{

    public ServerInfoDTO()
    {
    }

    public String getVersion()
    {
        return version;
    }

    public void setVersion(String version)
    {
        this.version = version;
    }

    public int getCorenum()
    {
        return corenum;
    }

    public void setCorenum(int corenum)
    {
        this.corenum = corenum;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getHostname()
    {
        return hostname;
    }

    public void setHostname(String hostname)
    {
        this.hostname = hostname;
    }

    public String getOsver()
    {
        return osver;
    }

    public void setOsver(String osver)
    {
        this.osver = osver;
    }

    public String getHw()
    {
        return hw;
    }

    public void setHw(String hw)
    {
        this.hw = hw;
    }

    private String ip;
    private String hostname;
    private String osver;
    private String hw;
    private String version;
    private int corenum;
}
