// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CpuDetailedDTO.java

package kr.co.project3.detailed.dto;

public class CpuDetailedDTO {

	private float cpuusage;
	private float cpuuser;
	private float cpusys;
	private float cpunice;
	private float cpuidle;
	private float cpuiowait;
	private float cpusteal;
	private String ip;

	public CpuDetailedDTO() {
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public float getCpuusage() {
		return cpuusage;
	}

	public void setCpuusage(float cpuusage) {
		this.cpuusage = cpuusage;
	}

	public float getCpuuser() {
		return cpuuser;
	}

	public void setCpuuser(float cpuuser) {
		this.cpuuser = cpuuser;
	}

	public float getCpusys() {
		return cpusys;
	}

	public void setCpusys(float cpusys) {
		this.cpusys = cpusys;
	}

	public float getCpunice() {
		return cpunice;
	}

	public void setCpunice(float cpunice) {
		this.cpunice = cpunice;
	}

	public float getCpuidle() {
		return cpuidle;
	}

	public void setCpuidle(float cpuidle) {
		this.cpuidle = cpuidle;
	}

	public float getCpuiowait() {
		return cpuiowait;
	}

	public void setCpuiowait(float cpuiowait) {
		this.cpuiowait = cpuiowait;
	}

	public float getCpusteal() {
		return cpusteal;
	}

	public void setCpusteal(float cpusteal) {
		this.cpusteal = cpusteal;
	}

	public String toString() {
		return (new StringBuilder("CpuDetailedDTO [cpuusage=")).append(cpuusage).append(",cpuuser= ").append(cpuuser)
				.append(", cpusys=").append(cpusys).append(", cpunice=").append(cpunice).append(", cpuidle=")
				.append(cpuidle).append(",cpuiowait =").append(cpuiowait).append(",cpusteal=").append(cpusteal)
				.append("]").toString();
	}

}
