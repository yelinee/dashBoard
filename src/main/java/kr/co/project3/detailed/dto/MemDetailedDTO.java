// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MemDetailedDTO.java

package kr.co.project3.detailed.dto;


public class MemDetailedDTO
{

    public MemDetailedDTO()
    {
    }

    public float getMemtotal()
    {
        return memtotal;
    }

    public void setMemtotal(float memtotal)
    {
        this.memtotal = memtotal;
    }

    public float getMemused()
    {
        return memused;
    }

    public void setMemused(float memused)
    {
        this.memused = memused;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public float getMemnominal()
    {
        return memnominal;
    }

    public void setMemnominal(float memnominal)
    {
        this.memnominal = memnominal;
    }

    public float getMemactual()
    {
        return memactual;
    }

    public void setMemactual(float memactual)
    {
        this.memactual = memactual;
    }

    public float getSwapusage()
    {
        return swapusage;
    }

    public void setSwapusage(float swapusage)
    {
        this.swapusage = swapusage;
    }

    public float getMemfree()
    {
        return memfree;
    }

    public void setMemfree(float memfree)
    {
        this.memfree = memfree;
    }

    public float getMemshared()
    {
        return memshared;
    }

    public void setMemshared(float memshared)
    {
        this.memshared = memshared;
    }

    public float getMembuff()
    {
        return membuff;
    }

    public void setMembuff(float membuff)
    {
        this.membuff = membuff;
    }

    public float getMemable()
    {
        return memable;
    }

    public void setMemable(float memable)
    {
        this.memable = memable;
    }

    public float getSwaptotal()
    {
        return swaptotal;
    }

    public void setSwaptotal(float swaptotal)
    {
        this.swaptotal = swaptotal;
    }

    public float getSwapused()
    {
        return swapused;
    }

    public void setSwapused(float swapused)
    {
        this.swapused = swapused;
    }

    public float getSwapfree()
    {
        return swapfree;
    }

    public void setSwapfree(float swapfree)
    {
        this.swapfree = swapfree;
    }

    private float memnominal;
    private float memactual;
    private float swapusage;
    private float memfree;
    private float memtotal;
    private float memused;
    private float memshared;
    private float membuff;
    private float memable;
    private float swaptotal;
    private float swapused;
    private float swapfree;
    private String ip;
}
