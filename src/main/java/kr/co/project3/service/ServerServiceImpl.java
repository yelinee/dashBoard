// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServerServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.dashBoard.dto.ServerInfoDTO;
import kr.co.project3.server.dao.ServerDAO;
import kr.co.project3.server.dto.ServerDTO;

// Referenced classes of package kr.co.project3.service:
//            ServerService

@Component
public class ServerServiceImpl implements ServerService {

	@Autowired
	ServerDAO dao;

	public int check_ip(String ip) {
		return dao.check_ip(ip);
	}

	public void insert_server(ServerDTO dto) {
		dao.insert_server(dto);
	}

	public List<ServerInfoDTO> getServerInfo(String id) {
		return dao.getServerInfo(id);
	}

}
