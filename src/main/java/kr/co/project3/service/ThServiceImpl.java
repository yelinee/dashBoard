// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThServiceImpl.java

package kr.co.project3.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.pages.alarm.dao.ThDAO;
import kr.co.project3.pages.alarm.dto.ThresholdDTO;

// Referenced classes of package kr.co.project3.service:
//            ThService

@Component
public class ThServiceImpl implements ThService
{

    @Autowired
    ThDAO tDao;
    
    public int threshold_check(ThresholdDTO tdto)
    {
        return tDao.threshold_check(tdto);
    }

    public void thSave(ThresholdDTO tdto)
    {
        tDao.thSave(tdto);
    }

    public List<ThresholdDTO> th_select(String id)
    {
        return tDao.th_select(id);
    }

    public HashMap<String,String> th_Check_save(String check[], String id)
    {
        return tDao.th_Check_save(check, id);
    }

    public HashMap<String,String> th_check_select(String id)
    {
        return tDao.th_check_select(id);
    }

 
}
