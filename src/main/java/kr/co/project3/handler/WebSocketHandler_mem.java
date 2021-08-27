// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebSocketHandler_mem.java

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
import kr.co.project3.detailed.dto.MemDetailedDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.detailedService;

public class WebSocketHandler_mem extends TextWebSocketHandler
{

    public WebSocketHandler_mem()
    {
        sessionList = new ArrayList<WebSocketSession>();
    }
    
    @Autowired
    private detailedService dservice;
    
    
    List<WebSocketSession> sessionList;

    public void afterConnectionEstablished(WebSocketSession session)
        throws Exception
    {
        System.out.println("websocket3 \uC5F0\uACB0!!");
    }

    protected void handleTextMessage(final WebSocketSession session, TextMessage message) throws Exception
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
                    List<MemDetailedDTO> list = dservice.getMemDetailed(id);
                    if(!alarmController.empty(list).booleanValue())
                    {
                        MemDetailedDTO mdto;
                        for(Iterator<MemDetailedDTO> iterator = list.iterator(); iterator.hasNext(); System.out.println((new StringBuilder("ws2: ")).append(mdto.getMemnominal()).toString()))
                        {
                            mdto = (MemDetailedDTO)iterator.next();
                            System.out.println((new StringBuilder("ws2: ")).append(mdto.getMemable()).toString());
                            System.out.println((new StringBuilder("ws2: ")).append(mdto.getMemactual()).toString());
                        }

                        String detailedMEM = "";
                        Gson gson = new Gson();
                        String result = gson.toJson(list);
                        System.out.println(result);
                        detailedMEM = result;
                        try
                        {
                            session.sendMessage(new TextMessage(detailedMEM));
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
            timer.schedule(task, 0L, 30000L);
        }
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
        throws Exception
    {
        System.out.println("websocket session3 \uC885\uB8CC!");
        sessionList.remove(session);
    }

    public void onError(Throwable e)
    {
        e.printStackTrace();
    }

   

}
