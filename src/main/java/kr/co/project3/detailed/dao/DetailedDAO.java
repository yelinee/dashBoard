// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DetailedDAO.java

package kr.co.project3.detailed.dao;

import java.util.List;

import kr.co.project3.detailed.dto.CpuDetailedDTO;
import kr.co.project3.detailed.dto.DiskDetailedDTO;
import kr.co.project3.detailed.dto.MemDetailedDTO;
import kr.co.project3.detailed.dto.NwDetailedDTO;

public interface DetailedDAO
{

    public abstract List<CpuDetailedDTO> getCpuDetailed(String s);

    public abstract List<MemDetailedDTO> getMemDetailed(String s);

    public abstract List<DiskDetailedDTO> getDiskDetailed(String s);

    public abstract List<NwDetailedDTO> getNwDetailed(String s);
}
