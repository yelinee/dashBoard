// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LogServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.log.dao.LogDAO;
import kr.co.project3.log.dto.Criteria;
import kr.co.project3.log.dto.LogDTO;

// Referenced classes of package kr.co.project3.service:
//            LogService


@Component
public class LogServiceImpl implements LogService
{
	@Autowired
    private LogDAO ldao;


    public List select_dateLog(LogDTO dto)
    {
        return ldao.select_dateLog(dto);
    }

    public List<LogDTO> selectLog(Criteria cri)
    {
        return ldao.selectLog(cri);
    }

    public int countLog(String id)
    {
        return ldao.countLog(id);
    }

    
}
