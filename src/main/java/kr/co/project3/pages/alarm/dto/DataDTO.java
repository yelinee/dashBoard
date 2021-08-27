// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DataDTO.java

package kr.co.project3.pages.alarm.dto;


public class DataDTO
{

    public DataDTO()
    {
    }

    public int getCpu_data()
    {
        return cpu_data;
    }

    public void setCpu_data(int cpu_data)
    {
        this.cpu_data = cpu_data;
    }

    public int getMem_data()
    {
        return mem_data;
    }

    public void setMem_data(int mem_data)
    {
        this.mem_data = mem_data;
    }

    public int getDisk_data()
    {
        return disk_data;
    }

    public void setDisk_data(int disk_data)
    {
        this.disk_data = disk_data;
    }

    public int getNw_data()
    {
        return nw_data;
    }

    public void setNw_data(int nw_data)
    {
        this.nw_data = nw_data;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String toString()
    {
        return (new StringBuilder("DataDTO[")).append(cpu_data).append(",").append(mem_data).append(",").append(disk_data).append(",").append(nw_data).append("]").toString();
    }

    private String id;
    private int cpu_data;
    private int mem_data;
    private int disk_data;
    private int nw_data;
}
