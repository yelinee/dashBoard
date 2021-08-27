// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UsageService.java

package kr.co.project3.service;

import java.util.List;

import kr.co.project3.dashBoard.dto.UsageDTO;

public interface UsageService
{

    public abstract List<UsageDTO> getUsage(String s);
}
