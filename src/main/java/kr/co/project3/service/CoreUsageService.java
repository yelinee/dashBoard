// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CoreUsageService.java

package kr.co.project3.service;

import java.util.List;

import kr.co.project3.dashBoard.dto.UsageDTO;

public interface CoreUsageService
{

    public abstract List<UsageDTO> getCoreUsage(String s);
}
