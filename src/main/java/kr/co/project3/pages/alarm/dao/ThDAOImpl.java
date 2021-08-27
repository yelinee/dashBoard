// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThDAOImpl.java

package kr.co.project3.pages.alarm.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.pages.alarm.dto.ThresholdDTO;

// Referenced classes of package kr.co.project3.pages.alarm.dao:
//            ThDAO

@Repository
public class ThDAOImpl implements ThDAO
{

	@Autowired
    private SqlSession session;
    
    
    HttpSession hsession;
    private static final String NameSpace = "alarmMapper.";

    public int threshold_check(ThresholdDTO tdto)
    {
        int th_result = ((Integer)session.selectOne(NameSpace+"th_check", tdto)).intValue();
        return th_result;
    }

    public String selectIp(String id)
    {
        return session.selectOne(NameSpace+"ip_select", id);
    }

    public void thSave(ThresholdDTO tdto)
    {
        String id = tdto.getId();
        System.out.println(id);
        String ip = selectIp(id);
        tdto.setIp(ip);
        int th_check_result = threshold_check(tdto);
        
        if(th_check_result == 0)
            session.insert(NameSpace+"th_insert", tdto);
        else
            session.update(NameSpace+"th_update", tdto);
    }

    public List<ThresholdDTO> th_select(String id)
    {
        return session.selectList(NameSpace+"th_select", id);
    }

    public HashMap<String,String> th_Check_save(String check[], String id)
    {
        HashMap<String,String>  map = new HashMap<String, String>();
        String check_ch[] = new String[4];
        
        if(alarmController.empty(check)==false)
        {
            for(int i = 0; i < check.length; i++)
                if(check[i].equals("cpu_check"))
                    check_ch[0] = "checked";
                else
                if(check[i].equals("mem_check"))
                    check_ch[1] = "checked";
                else
                if(check[i].equals("disk_check"))
                    check_ch[2] = "checked";
                else
                if(check[i].equals("nw_check"))
                    check_ch[3] = "checked";

        }
        System.out.println((new StringBuilder("cpu_check:")).append(check_ch[0]).toString());
        System.out.println((new StringBuilder("mem_check:")).append(check_ch[1]).toString());
        System.out.println((new StringBuilder("disk_check:")).append(check_ch[2]).toString());
        System.out.println((new StringBuilder("nw_check:")).append(check_ch[3]).toString());
        
        
        map.put("cpu_check", check_ch[0]);
        map.put("mem_check", check_ch[1]);
        map.put("nw_check", check_ch[3]);
        map.put("disk_check", check_ch[2]);
        map.put("id", id);
        
        session.update(NameSpace+"th_Check_update", map);
        
        return session.selectOne(NameSpace+"th_Check_select", id);
    }

    public HashMap<String,String>  th_check_select(String id)
    {
        return session.selectOne(NameSpace+"th_Check_select", id);
    }


}
