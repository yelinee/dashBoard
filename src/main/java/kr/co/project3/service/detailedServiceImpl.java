// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   detailedServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.detailed.dao.DetailedDAO;
import kr.co.project3.detailed.dto.CpuDetailedDTO;
import kr.co.project3.detailed.dto.DiskDetailedDTO;
import kr.co.project3.detailed.dto.MemDetailedDTO;
import kr.co.project3.detailed.dto.NwDetailedDTO;

// Referenced classes of package kr.co.project3.service:
//            detailedService

@Component
public class detailedServiceImpl implements detailedService
{

    public detailedServiceImpl()
    {
    }
    
    @Autowired
    DetailedDAO ddao;

    public List<CpuDetailedDTO> getCpuDetailed(String id)
    {
        return ddao.getCpuDetailed(id);
    }

    public List<MemDetailedDTO> getMemDetailed(String id)
    {
        return ddao.getMemDetailed(id);
    }

    public List<DiskDetailedDTO> getDiskDetailed(String id)
    {
        return ddao.getDiskDetailed(id);
    }

    public List<NwDetailedDTO> getNwDetailed(String id)
    {
        return ddao.getNwDetailed(id);
    }

    
}
