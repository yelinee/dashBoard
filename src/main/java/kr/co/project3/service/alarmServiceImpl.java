// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   alarmServiceImpl.java

package kr.co.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.project3.log.dto.Criteria;
import kr.co.project3.pages.alarm.dao.AlarmDAO;
import kr.co.project3.pages.alarm.dto.AlarmDTO;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.pages.alarm.dto.AlarmSettingDTO;

// Referenced classes of package kr.co.project3.service:
//            alarmService

@Component
public class alarmServiceImpl
    implements alarmService
{

    public alarmServiceImpl()
    {
    }
    
    @Autowired
    AlarmDAO adao;

    public String selectIp(String id)
    {
        return adao.selectIp(id);
    }

    public List<AlarmDTO> selectAlarm(String id)
    {
        return adao.selectAlarm(id);
    }

    public List<AlarmSettingDTO> cpu_over_check()
    {
        return adao.cpu_over_check();
    }

    public List<AlarmSettingDTO> mem_over_check()
    {
        return adao.mem_over_check();
    }

    public List<AlarmSettingDTO> disk_over_check()
    {
        return adao.disk_over_check();
    }

    public List<AlarmSettingDTO> nw_over_check()
    {
        return adao.nw_over_check();
    }

    public String get_email(String id)
    {
        return adao.get_email(id);
    }

    public void insertCpuAlarmLog(AlarmLogDTO ldto)
    {
        adao.insertCpuAlarmLog(ldto);
    }

    public void insertMemAlarmLog(AlarmLogDTO ldto)
    {
        adao.insertMemAlarmLog(ldto);
    }

    public void insertDiskAlarmLog(AlarmLogDTO ldto)
    {
        adao.insertDiskAlarmLog(ldto);
    }

    public void insertNwAlarmLog(AlarmLogDTO ldto)
    {
        adao.insertNwAlarmLog(ldto);
    }

    public List<AlarmLogDTO> getAlarmLog(Criteria cri)
    {
        return adao.getAlarmLog(cri);
    }

    public int countAlarm(String id)
    {
        return adao.countAlarm(id);
    }

    public List<AlarmLogDTO>  getAlarmList4(String id)
    {
        return adao.getAlarmList4(id);
    }


}
