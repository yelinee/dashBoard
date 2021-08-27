// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   alarmService.java

package kr.co.project3.service;

import java.util.List;

import kr.co.project3.log.dto.Criteria;
import kr.co.project3.pages.alarm.dto.AlarmDTO;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.pages.alarm.dto.AlarmSettingDTO;

public interface alarmService
{

    public  List<AlarmDTO> selectAlarm(String s);

    public  String selectIp(String s);

    public  List<AlarmSettingDTO> cpu_over_check();

    public  List<AlarmSettingDTO>   mem_over_check();

    public  List<AlarmSettingDTO> disk_over_check();

    public  List<AlarmSettingDTO> nw_over_check();

    public  String get_email(String s);

    public  void insertCpuAlarmLog(AlarmLogDTO alarmlogdto);

    public  void insertMemAlarmLog(AlarmLogDTO alarmlogdto);

    public  void insertDiskAlarmLog(AlarmLogDTO alarmlogdto);

    public  void insertNwAlarmLog(AlarmLogDTO alarmlogdto);

    public  List<AlarmLogDTO>  getAlarmLog(Criteria criteria);

    public  int countAlarm(String s);

    public  List<AlarmLogDTO> getAlarmList4(String s);
}
