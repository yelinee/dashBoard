// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebSocketHandler_disk.java

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
import kr.co.project3.detailed.dto.DiskDetailedDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.detailedService;

public class WebSocketHandler_disk extends TextWebSocketHandler
{

    public WebSocketHandler_disk()
    {
        sessionList = new ArrayList<WebSocketSession>();
    }
    
    @Autowired
    private detailedService dservice;
    
    List<WebSocketSession> sessionList;

    public void afterConnectionEstablished(WebSocketSession session)
        throws Exception
    {
        System.out.println("websocket4 \uC5F0\uACB0!!");
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
                    List<DiskDetailedDTO> list = dservice.getDiskDetailed(id);
                    if(!alarmController.empty(list).booleanValue())
                    {
                        DiskDetailedDTO ddto;
                        for(Iterator<DiskDetailedDTO> iterator = list.iterator(); iterator.hasNext(); System.out.println((new StringBuilder("ws2: ")).append(ddto.getDiskwait()).toString()))
                        {
                            ddto = (DiskDetailedDTO)iterator.next();
                            System.out.println((new StringBuilder("ws2: ")).append(ddto.getDisksize()).toString());
                            System.out.println((new StringBuilder("ws2: ")).append(ddto.getDisktime()).toString());
                        }

                        String detailedDISK = "";
                        Gson gson = new Gson();
                        String result = gson.toJson(list);
                        System.out.println(result);
                        detailedDISK = result;
                        try
                        {
                            session.sendMessage(new TextMessage(detailedDISK));
                        }
                        catch(IOException e)
                        {
                            e.printStackTrace();
                        }
                    }
                }

				/*
				 * final WebSocketHandler_disk this$0; private final String val$id; private
				 * final WebSocketSession val$session;
				 * 
				 * 
				 * { this$0 = WebSocketHandler_disk.this; id = s; session = websocketsession;
				 * super(); }
				 */
            }
;
            Timer timer = new Timer(true);
            timer.schedule(task, 0L, 60000L);
        }
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
        throws Exception
    {
        System.out.println("websocket session4 \uC885\uB8CC!");
        sessionList.remove(session);
    }

    public void onError(Throwable e)
    {
        e.printStackTrace();
    }

   

}
