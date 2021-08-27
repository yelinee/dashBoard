// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmDAO.java

package kr.co.project3.pages.alarm.dao;

import java.util.List;

import kr.co.project3.log.dto.Criteria;
import kr.co.project3.pages.alarm.dto.AlarmDTO;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.pages.alarm.dto.AlarmSettingDTO;

public interface AlarmDAO
{

    public abstract String selectIp(String s);

    public abstract List<AlarmDTO> selectAlarm(String s);

    public abstract List<AlarmSettingDTO> cpu_over_check();

    public abstract List<AlarmSettingDTO> mem_over_check();

    public abstract List<AlarmSettingDTO> nw_over_check();

    public abstract List<AlarmSettingDTO> disk_over_check();

    public abstract String get_email(String s);

    public abstract void insertCpuAlarmLog(AlarmLogDTO alarmlogdto);

    public abstract void insertMemAlarmLog(AlarmLogDTO alarmlogdto);

    public abstract void insertDiskAlarmLog(AlarmLogDTO alarmlogdto);

    public abstract void insertNwAlarmLog(AlarmLogDTO alarmlogdto);

    public abstract List<AlarmLogDTO> getAlarmLog(Criteria criteria);

    public abstract int countAlarm(String s);

    public abstract List<AlarmLogDTO> getAlarmList4(String s);
}
