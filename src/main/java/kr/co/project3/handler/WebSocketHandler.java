// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebSocketHandler.java

package kr.co.project3.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.project3.User.dto.UserDTO;
import kr.co.project3.dashBoard.dto.UsageDTO;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.service.CoreUsageService;
import kr.co.project3.service.UsageService;


@Component
public class WebSocketHandler extends TextWebSocketHandler
{

    public WebSocketHandler()
    {
        sessionList = new ArrayList<WebSocketSession>();
        beResult = "";
    }
    
    @Autowired
    private UsageService service;
    
    @Autowired
    private CoreUsageService cservice;
    
    List<WebSocketSession> sessionList;
    
    String beResult;

    
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
        throws Exception
    {
        System.out.println("websocket\uC5F0\uACB0!");
    }

    @Override
    protected void handleTextMessage(final WebSocketSession session, TextMessage message)
        throws Exception
    {
        System.out.println((String)message.getPayload());
        Map<String, Object> map = session.getAttributes();
        UserDTO dto = (UserDTO)map.get("dto_info");
        if(!alarmController.empty(dto).booleanValue())
        {
            final String id = dto.getId();
            System.out.println(id);
            sessionList.add(session);
            TimerTask task = new TimerTask() {

                public void run()
                {
                    List<UsageDTO> list = service.getUsage(id);
                    if(!alarmController.empty(list).booleanValue())
                    {
                        String msg = "";
                        Gson gson = new Gson();
                        String result = gson.toJson(list);
                        msg = result;
                        System.out.println(msg);
                        try
                        {
                            session.sendMessage(new TextMessage(msg));
                        }
                        catch(IOException e)
                        {
                            e.printStackTrace();
                        }
                    } else
                    {
                        System.out.println("usageList\uBE44\uC5C7\uC2B4");
                    }
                }
				/*
				 * final WebSocketHandler this$0; private final String val$id; private final
				 * WebSocketSession val$session;
				 * 
				 * 
				 * { this$0 = WebSocketHandler.this; id = s; session = websocketsession;
				 * super(); }
				 */
            }
;
            Timer timer = new Timer(true);
            timer.scheduleAtFixedRate(task, 0L, 1000L);
        }
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
        throws Exception
    {
        System.out.println("websocket session \uC885\uB8CC!");
        sessionList.remove(session);
    }

    public void onError(Throwable e)
    {
        e.printStackTrace();
    }

  

}
