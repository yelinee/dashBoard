// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CoreUsageDTO.java

package kr.co.project3.dashBoard.dto;


public class CoreUsageDTO
{

    public CoreUsageDTO()
    {
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

    private String corename;
    private float coreusage;
}
