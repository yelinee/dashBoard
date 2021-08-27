// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServerDAOImpl.java

package kr.co.project3.server.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import kr.co.project3.dashBoard.dto.ServerInfoDTO;
import kr.co.project3.server.dto.ServerDTO;

// Referenced classes of package kr.co.project3.server.dao:
//            ServerDAO


@Repository
public class ServerDAOImpl
    implements ServerDAO
{
	
	 private static final String NameSpace = "ServerMapper.";
	 
	 @Autowired
	 private SqlSession session;

    public ServerDAOImpl()
    {
    }

    public int check_ip(String ip)
    {
        int check_ip = ((Integer)session.selectOne(NameSpace+"ServerMapper.check_ip", ip)).intValue();
        return check_ip;
    }

    public List<ServerInfoDTO> getServerInfo(String id)
    {
        return session.selectList(NameSpace+"select_info", id);
    }

    public void insert_server(ServerDTO dto)
    {
        String public_ip = dto.getPublic_ip();
        String username = dto.getUsername();
        String pw = dto.getPw();
        String keyname = "C:\\Users\\sonye\\adminserver.pem";
        String publicDNS = "ec2-3-36-184-127.ap-northeast-2.compute.amazonaws.com";
        session.insert(NameSpace+"insert_server", dto);
        try
        {
            JSch jsch = new JSch();
            String user = "root";
            String host = publicDNS;
            int port = 22;
            String privateKey = keyname;
            jsch.addIdentity(privateKey);
            System.out.println("identity added");
            Session session_shell = jsch.getSession(user, host, port);
            session_shell.setConfig("StrictHostKeyChecking", "no");
            session_shell.setConfig("GSSAPIAuthentication", "no");
            session_shell.setServerAliveInterval(0x1d4c0);
            session_shell.setServerAliveCountMax(1000);
            session_shell.setConfig("TCPKeepAlive", "yes");
            session_shell.connect();
            Channel channel = session_shell.openChannel("exec");
            channel.setInputStream(System.in);
            channel.setOutputStream(System.out);
            ((ChannelExec)channel).setPty(true);
            ((ChannelExec)channel).setCommand("sh /login/add.sh");
            System.out.println((new StringBuilder("echo -e \"")).append(public_ip).append("~").append(username).append("~").append(pw).append("\" > /login/sshserver.txt").toString());
            channel.connect(3000);
            System.out.println("cahnnel \uC5F0\uACB0");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

   
}
