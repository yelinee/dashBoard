// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AlarmDAOImpl.java

package kr.co.project3.pages.alarm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.project3.log.dto.Criteria;
import kr.co.project3.pages.alarm.controller.alarmController;
import kr.co.project3.pages.alarm.dto.AlarmDTO;
import kr.co.project3.pages.alarm.dto.AlarmLogDTO;
import kr.co.project3.pages.alarm.dto.AlarmSettingDTO;

// Referenced classes of package kr.co.project3.pages.alarm.dao:
//            AlarmDAO

@Repository
public class AlarmDAOImpl implements AlarmDAO {

	@Autowired
	private SqlSession session;
	
	
	int over_warning_check;
	int over_danger_check;
	
	private static final String NameSpace = "alarmMapper.";

	public AlarmDAOImpl() {
		over_warning_check = 0;
		over_danger_check = 0;
	}

	public String selectIp(String id) {
		return (String) session.selectOne(NameSpace+"ip_select", id);
	}

	public List<AlarmDTO> selectAlarm(String id) {
		String ip = selectIp(id);
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("ip", ip);
		map.put("id", id);
		
		return session.selectList(NameSpace+"alarm_select", map);
	}

	public List<AlarmSettingDTO> cpu_over_check() {
		AlarmSettingDTO adto = new AlarmSettingDTO();
		List<AlarmSettingDTO> over_warning_check = null;
		List<AlarmSettingDTO> over_danger_check = session.selectList(NameSpace+"over_danger_check");
		if (alarmController.empty(over_danger_check).booleanValue()) {
			over_warning_check = session.selectList(NameSpace+"over_warning_check");
			if (!alarmController.empty(over_warning_check).booleanValue()) {
				adto.setLevel("warning");
				over_warning_check.add(adto);
				return over_warning_check;
			} else {
				return null;
			}
		} else {
			adto.setLevel("danger");
			over_danger_check.add(adto);
			
			return over_danger_check;
		}
	}

	public List<AlarmSettingDTO> mem_over_check() {
		AlarmSettingDTO adto = new AlarmSettingDTO();
		List<AlarmSettingDTO> over_memwarning_check = null;
		List<AlarmSettingDTO> over_memdanger_check = session.selectList(NameSpace+"over_memdanger_check");
		if (alarmController.empty(over_memdanger_check).booleanValue()) {
			over_memwarning_check = session.selectList(NameSpace+"over_memwarning_check");
			if (!alarmController.empty(over_memwarning_check).booleanValue()) {
				adto.setLevel("warning");
				over_memwarning_check.add(adto);
				
				return over_memwarning_check;
			} else {
				return null;
			}
		} else {
			adto.setLevel("danger");
			over_memdanger_check.add(adto);
			return over_memdanger_check;
		}
	}

	public List<AlarmSettingDTO> disk_over_check() {
		AlarmSettingDTO adto = new AlarmSettingDTO();
		List<AlarmSettingDTO> over_diskwarning_check = null;
		List<AlarmSettingDTO> over_diskdanger_check = session.selectList(NameSpace+"over_diskdanger_check");
		if (alarmController.empty(over_diskdanger_check).booleanValue()) {
			over_diskwarning_check = session.selectList(NameSpace+"over_diskwarning_check");
			if (!alarmController.empty(over_diskwarning_check).booleanValue()) {
				adto.setLevel("warning");
				over_diskwarning_check.add(adto);
				return over_diskwarning_check;
			} else {
				return null;
			}
		} else {
			adto.setLevel("danger");
			over_diskdanger_check.add(adto);
			return over_diskdanger_check;
		}
	}

	public List<AlarmSettingDTO> nw_over_check() {
		AlarmSettingDTO adto = new AlarmSettingDTO();
		List<AlarmSettingDTO> over_nwwarning_check = null;
		List<AlarmSettingDTO> over_nwkdanger_check = session.selectList(NameSpace+"over_nwdanger_check");
		if (alarmController.empty(over_nwkdanger_check).booleanValue()) {
			
			over_nwwarning_check = session.selectList(NameSpace+"over_nwwarning_check");
			if (!alarmController.empty(over_nwwarning_check).booleanValue()) {
				
				adto.setLevel("warning");
				over_nwwarning_check.add(adto);
				return over_nwwarning_check;
				
			} else {
				return null;
			}
		} else {
			adto.setLevel("danger");
			over_nwkdanger_check.add(adto);
			return over_nwkdanger_check;
		}
	}

	public void insertCpuAlarmLog(AlarmLogDTO ldto) {
		session.insert(NameSpace+"insertCpuLog", ldto);
	}

	public void insertMemAlarmLog(AlarmLogDTO ldto) {
		session.insert(NameSpace+"insertMemLog", ldto);
	}

	public void insertDiskAlarmLog(AlarmLogDTO ldto) {
		session.insert(NameSpace+"insertDiskLog", ldto);
	}

	public void insertNwAlarmLog(AlarmLogDTO ldto) {
		session.insert(NameSpace+"insertNwLog", ldto);
	}

	public List<AlarmLogDTO> getAlarmLog(Criteria cri) {
		return session.selectList(NameSpace+"selectAlarmLog", cri);
	}

	public String get_email(String id) {
		String email = (String) session.selectOne(NameSpace+"select_email", id);
		return email;
	}

	public int countAlarm(String id) {
		return ((Integer) session.selectOne(NameSpace+"select_alarmCount", id)).intValue();
	}

	public List<AlarmLogDTO> getAlarmList4(String id) {
		return session.selectList(NameSpace+"select_alarm4", id);
	}

}
