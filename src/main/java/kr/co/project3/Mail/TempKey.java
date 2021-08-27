// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TempKey.java

package kr.co.project3.Mail;

import java.util.Random;

public class TempKey
{

    public TempKey()
    {
    }

    public String getKey(int size, boolean lowerCheck)
    {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init()
    {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do
        {
            num = ran.nextInt(75) + 48;
            if(num >= 48 && num <= 57 || num >= 65 && num <= 90 || num >= 97 && num <= 122)
                sb.append((char)num);
        } while(sb.length() < size);
        if(lowerCheck)
            return sb.toString().toLowerCase();
        else
            return sb.toString();
    }

    private boolean lowerCheck;
    private int size;
}
