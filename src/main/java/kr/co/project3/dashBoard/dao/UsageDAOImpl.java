// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UsageDAOImpl.java

package kr.co.project3.dashBoard.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.dashBoard.dto.UsageDTO;

// Referenced classes of package kr.co.project3.dashBoard.dao:
//            UsageDAO

@Repository
public class UsageDAOImpl implements UsageDAO {
	private static final String NameSpace = "UsageMapper.";
	
	@Autowired
	private SqlSession session;

	public List<UsageDTO> getUsage(String id) {
		UsageDTO udto = new UsageDTO();
		List<UsageDTO> list = session.selectList(NameSpace + "usage_select", id);
		List<UsageDTO> list2 = session.selectList(NameSpace + "coreusage_select", id);
		List<UsageDTO> returnList = new ArrayList<UsageDTO>();
		udto.setCpuusage(((UsageDTO) list.get(0)).getCpuusage());
		udto.setMemusage(((UsageDTO) list.get(0)).getMemusage());
		udto.setDiskusage(((UsageDTO) list.get(0)).getDiskusage());
		udto.setNwusage(((UsageDTO) list.get(0)).getNwusage());
		for (int i = 0; i < list2.size(); i++) {
			System.out.println(((UsageDTO) list2.get(i)).getCorename());
			System.out.println(((UsageDTO) list2.get(i)).getCoreusage());
			udto.setCorename(((UsageDTO) list2.get(i)).getCorename());
			udto.setCoreusage(((UsageDTO) list2.get(i)).getCoreusage());
			returnList.add(udto);
			udto = new UsageDTO();
		}

		return returnList;
	}

}
