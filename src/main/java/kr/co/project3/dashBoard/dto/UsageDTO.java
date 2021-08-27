// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UsageDTO.java

package kr.co.project3.dashBoard.dto;


public class UsageDTO
{

    public UsageDTO()
    {
    }

    public float getNwusage()
    {
        return nwusage;
    }

    public void setNwusage(float nwusage)
    {
        this.nwusage = nwusage;
    }

    public String getCorename()
    {
        return corename;
    }

    public void setCorename(String corename)
    {
        this.corename = corename;
    }

    public float getCoreusage()
    {
        return coreusage;
    }

    public void setCoreusage(float coreusage)
    {
        this.coreusage = coreusage;
    }

    public float getCpuusage()
    {
        return cpuusage;
    }

    public void setCpuusage(float cpuusage)
    {
        this.cpuusage = cpuusage;
    }

    public float getMemusage()
    {
        return memusage;
    }

    public void setMemusage(float memusage)
    {
        this.memusage = memusage;
    }

    public float getDiskusage()
    {
        return diskusage;
    }

    public void setDiskusage(float diskusage)
    {
        this.diskusage = diskusage;
    }

    private float cpuusage;
    private float memusage;
    private float diskusage;
    private float nwusage;
    private String corename;
    private float coreusage;
}
