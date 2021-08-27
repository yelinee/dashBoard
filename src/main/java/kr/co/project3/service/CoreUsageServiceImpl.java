// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CoreUsageServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.project3.dashBoard.dao.CoreUsageDAO;
import kr.co.project3.dashBoard.dto.UsageDTO;

// Referenced classes of package kr.co.project3.service:
//            CoreUsageService

@Component
public class CoreUsageServiceImpl
    implements CoreUsageService
{

    public CoreUsageServiceImpl()
    {
    }

    public List<UsageDTO> getCoreUsage(String id)
    {
        return dao.getCoreUsage(id);
    }

    CoreUsageDAO dao;
}
