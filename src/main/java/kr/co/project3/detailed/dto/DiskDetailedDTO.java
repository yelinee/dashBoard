// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DiskDetailedDTO.java

package kr.co.project3.detailed.dto;

public class DiskDetailedDTO {
	
	
	private float diskusage;
	private float disksize;
	private float diskused;
	private float diskio;
	private float diskread;
	private float diskwrite;
	private float disktime;
	private float diskwait;
	private String ip;

	public float getDiskusage() {
		return diskusage;
	}

	public void setDiskusage(float diskusage) {
		this.diskusage = diskusage;
	}

	public float getDisksize() {
		return disksize;
	}

	public void setDisksize(float disksize) {
		this.disksize = disksize;
	}

	public float getDiskused() {
		return diskused;
	}

	public void setDiskused(float diskused) {
		this.diskused = diskused;
	}

	public float getDiskio() {
		return diskio;
	}

	public void setDiskio(float diskio) {
		this.diskio = diskio;
	}

	public float getDiskread() {
		return diskread;
	}

	public void setDiskread(float diskread) {
		this.diskread = diskread;
	}

	public float getDiskwrite() {
		return diskwrite;
	}

	public void setDiskwrite(float diskwrite) {
		this.diskwrite = diskwrite;
	}

	public float getDisktime() {
		return disktime;
	}

	public void setDisktime(float disktime) {
		this.disktime = disktime;
	}

	public float getDiskwait() {
		return diskwait;
	}

	public void setDiskwait(float diskwait) {
		this.diskwait = diskwait;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
