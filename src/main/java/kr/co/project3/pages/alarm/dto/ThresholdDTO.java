// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThresholdDTO.java

package kr.co.project3.pages.alarm.dto;


public class ThresholdDTO
{

    public ThresholdDTO()
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

    public String getCpu_warning()
    {
        return cpu_warning;
    }

    public void setCpu_warning(String cpu_warning)
    {
        this.cpu_warning = cpu_warning;
    }

    public String getCpu_danger()
    {
        return cpu_danger;
    }

    public void setCpu_danger(String cpu_danger)
    {
        this.cpu_danger = cpu_danger;
    }

    public String getMem_warning()
    {
        return mem_warning;
    }

    public void setMem_warning(String mem_warning2)
    {
        mem_warning = mem_warning2;
    }

    public String getMem_danger()
    {
        return mem_danger;
    }

    public void setMem_danger(String mem_danger)
    {
        this.mem_danger = mem_danger;
    }

    public String getNw_warning()
    {
        return nw_warning;
    }

    public void setNw_warning(String nw_warning)
    {
        this.nw_warning = nw_warning;
    }

    public String getNw_danger()
    {
        return nw_danger;
    }

    public void setNw_danger(String nw_danger)
    {
        this.nw_danger = nw_danger;
    }

    public String getDisk_warning()
    {
        return disk_warning;
    }

    public void setDisk_warning(String disk_warning)
    {
        this.disk_warning = disk_warning;
    }

    public String getDisk_danger()
    {
        return disk_danger;
    }

    public void setDisk_danger(String disk_danger)
    {
        this.disk_danger = disk_danger;
    }

    public int getNetusernum()
    {
        return netusernum;
    }

    public void setNetusernum(int netusernum)
    {
        this.netusernum = netusernum;
    }

    public int getPortuser()
    {
        return portuser;
    }

    public void setPortuser(int portuser)
    {
        this.portuser = portuser;
    }

    public String[] getCheck()
    {
        return check;
    }

    public void setCheck(String check[])
    {
        this.check = check;
    }

    public String toString()
    {
        return (new StringBuilder("ThresholdDTO[")).append(id).append(",").append(cpu_warning).append(",").append(cpu_danger).append(",").append(mem_warning).append(",").append(mem_danger).append(",").append(mem_danger).append(",").append(nw_warning).append(",").append(nw_danger).append(",").append(disk_warning).append(",").append(disk_danger).append("]").toString();
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    private String id;
    private String ip;
    private int netusernum;
    private int portuser;
    private String cpu_warning;
    private String cpu_danger;
    private String mem_warning;
    private String mem_danger;
    private String nw_warning;
    private String nw_danger;
    private String disk_warning;
    private String disk_danger;
    private String check[];
}
