// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PageMaker.java

package kr.co.project3.log.dto;


// Referenced classes of package kr.co.project3.log.dto:
//            Criteria

public class PageMaker
{

    public PageMaker()
    {
        displayPageNum = 20;
    }

    public Criteria getCri()
    {
        return cri;
    }

    public void setCri(Criteria cri)
    {
        this.cri = cri;
    }

    public int getTotalCount()
    {
        return totalCount;
    }

    public void setTotalCount(int totalCount)
    {
        this.totalCount = totalCount;
        calcData();
    }

    private void calcData()
    {
        endPage = (int)(Math.ceil((double)cri.getPage() / (double)displayPageNum) * (double)displayPageNum);
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0)
            startPage = 1;
        int tempEndPage = (int)Math.ceil((double)totalCount / (double)cri.getPerPageNum());
        if(endPage > tempEndPage)
            endPage = tempEndPage;
        prev = startPage != 1;
        next = endPage * cri.getPerPageNum() < totalCount;
    }

    public int getStartPage()
    {
        return startPage;
    }

    public void setStartPage(int startPage)
    {
        this.startPage = startPage;
    }

    public int getEndPage()
    {
        return endPage;
    }

    public void setEndPage(int endPage)
    {
        this.endPage = endPage;
    }

    public boolean isPrev()
    {
        return prev;
    }

    public void setPrev(boolean prev)
    {
        this.prev = prev;
    }

    public boolean isNext()
    {
        return next;
    }

    public void setNext(boolean next)
    {
        this.next = next;
    }

    public int getDisplayPageNum()
    {
        return displayPageNum;
    }

    public void setDisplayPageNum(int displayPageNum)
    {
        this.displayPageNum = displayPageNum;
    }

    private Criteria cri;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum;
}
