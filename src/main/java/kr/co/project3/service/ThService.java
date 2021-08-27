// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThService.java

package kr.co.project3.service;

import java.util.HashMap;
import java.util.List;
import kr.co.project3.pages.alarm.dto.ThresholdDTO;

public interface ThService {

	public int threshold_check(ThresholdDTO thresholddto);

	public void thSave(ThresholdDTO thresholddto);

	public HashMap<String, String> th_Check_save(String as[], String s);

	public List<ThresholdDTO> th_select(String s);

	public HashMap<String, String> th_check_select(String s);
}
