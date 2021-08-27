// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebSocketHandler_cpu.java

package kr.co.project3.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.detailed.dto.CpuDetailedDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.detailedService;


public class WebSocketHandler_cpu extends TextWebSocketHandler
{
	
	@Autowired
	private detailedService dservice;
	
    List<WebSocketSession> sessionList;

    public WebSocketHandler_cpu()
    {
        sessionList = new ArrayList<WebSocketSession>();
    }

    public void afterConnectionEstablished(WebSocketSession session)
        throws Exception
    {
        System.out.println("websocket2 \uC5F0\uACB0!!");
    }

    protected void handleTextMessage(final WebSocketSession session, TextMessage message)
        throws Exception
    {
        System.out.println((String)message.getPayload());
        Map<String, Object> map = session.getAttributes();
        UserDTO dto = (UserDTO)map.get("dto_info");
        if(!alarmController.empty(dto).booleanValue())
        {
            final String id = dto.getId();
            sessionList.add(session);
            TimerTask task = new TimerTask() {

                public void run()
                {
                    List<CpuDetailedDTO> list = dservice.getCpuDetailed(id);
                    if(!alarmController.empty(list).booleanValue())
                    {
                        CpuDetailedDTO cdto;
                        for(Iterator iterator = list.iterator(); iterator.hasNext(); System.out.println((new StringBuilder("ws2: ")).append(cdto.getCpuiowait()).toString()))
                        {
                            cdto = (CpuDetailedDTO)iterator.next();
                            System.out.println((new StringBuilder("ws2: ")).append(cdto.getCpuusage()).toString());
                            System.out.println((new StringBuilder("ws2: ")).append(cdto.getCpuidle()).toString());
                        }

                        String detailedCPU = "";
                        Gson gson = new Gson();
                        String result = gson.toJson(list);
                        System.out.println(result);
                        detailedCPU = result;
                        try
                        {
                            session.sendMessage(new TextMessage(detailedCPU));
                        }
                        catch(IOException e)
                        {
                            e.printStackTrace();
                        }
                    }
                }

               
            
            }
;
            Timer timer = new Timer(true);
            timer.schedule(task, 0L, 60000L);
        }
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
        throws Exception
    {
        System.out.println("websocket session2 \uC885\uB8CC!");
        sessionList.remove(session);
    }

    public void onError(Throwable e)
    {
        e.printStackTrace();
    }

    

}
