// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CoreUsageDAOImpl.java

package kr.co.project3.dashBoard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.dashBoard.dto.UsageDTO;

// Referenced classes of package kr.co.project3.dashBoard.dao:
//            CoreUsageDAO

@Repository
public class CoreUsageDAOImpl implements CoreUsageDAO
{

	private static final String NameSpace = "UsageMapper.";
	
	@Autowired
    private SqlSession session;
	
    public List<UsageDTO> getCoreUsage(String id)
    {
        return session.selectList(NameSpace+"coreusage_select", id);
    }


}
