// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LogDAOImpl.java

package kr.co.project3.log.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.log.dto.Criteria;
import kr.co.project3.log.dto.LogDTO;

// Referenced classes of package kr.co.project3.log.dao:
//            LogDAO

@Repository
public class LogDAOImpl implements LogDAO {

	private static final String NameSpace = "ServerMapper.";

	@Autowired
	private SqlSession session;

	public List select_dateLog(LogDTO dto) {
		dto.getId();
		return session.selectList(NameSpace + "log_select_date", dto);
	}

	public List<LogDTO> selectLog(Criteria cri) {
		return session.selectList(NameSpace + "log_select", cri);
	}

	public int countLog(String id) {
		return ((Integer) session.selectOne("ServerMapper.log_count", id)).intValue();
	}

}
