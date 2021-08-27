// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Criteria.java

package kr.co.project3.log.dto;


public class Criteria
{

    public int getPageStart()
    {
        return (page - 1) * perPageNum;
    }

    public Criteria()
    {
        page = 1;
        perPageNum = 15;
    }

    public int getPage()
    {
        return page;
    }

    public void setPage(int page)
    {
        if(page <= 0)
            this.page = 1;
        else
            this.page = page;
    }

    public int getPerPageNum()
    {
        return perPageNum;
    }

    public void setPerPageNum(int pageCount)
    {
        int cnt = perPageNum;
        if(pageCount != cnt)
            perPageNum = cnt;
        else
            perPageNum = pageCount;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    private String id;
    private int page;
    private int perPageNum;
}
