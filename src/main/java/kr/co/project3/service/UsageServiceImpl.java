// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UsageServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.dashBoard.dao.UsageDAO;
import kr.co.project3.dashBoard.dto.UsageDTO;

// Referenced classes of package kr.co.project3.service:
//            UsageService

@Component
public class UsageServiceImpl
    implements UsageService
{

    public UsageServiceImpl()
    {
    }
    
    @Autowired
    UsageDAO useDao;

    public List<UsageDTO> getUsage(String id)
    {
        return useDao.getUsage(id);
    }

  
}
