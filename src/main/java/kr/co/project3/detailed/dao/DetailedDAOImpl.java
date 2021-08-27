// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DetailedDAOImpl.java

package kr.co.project3.detailed.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.detailed.dto.CpuDetailedDTO;
import kr.co.project3.detailed.dto.DiskDetailedDTO;
import kr.co.project3.detailed.dto.MemDetailedDTO;
import kr.co.project3.detailed.dto.NwDetailedDTO;

// Referenced classes of package kr.co.project3.detailed.dao:
//            DetailedDAO

@Repository
public class DetailedDAOImpl implements DetailedDAO {

	private static final String NameSpace = "DetailedMapper.";
	
	@Autowired
	private SqlSession session;

	public List<CpuDetailedDTO> getCpuDetailed(String id) {
		return session.selectList(NameSpace+"select_cpuDetailed", id);
	}

	public List<MemDetailedDTO> getMemDetailed(String id) {
		return session.selectList(NameSpace+"select_memDetailed", id);
	}

	public List<DiskDetailedDTO> getDiskDetailed(String id) {
		return session.selectList(NameSpace+"select_diskDetailed", id);
	}

	public List<NwDetailedDTO> getNwDetailed(String id) {
		return session.selectList(NameSpace+"select_nwDetailed", id);
	}

}
