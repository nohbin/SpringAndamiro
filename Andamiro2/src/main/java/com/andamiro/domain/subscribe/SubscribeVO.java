package com.andamiro.domain.subscribe;

public class SubscribeVO {
	private String sub_start;
	private String sub_end;
	private int subNumber;
	private int memberNumber;
	private int status;
	
	public String getSub_start() {
		return sub_start;
	}
	public void setSub_start(String sub_start) {
		this.sub_start = sub_start;
	}
	public String getSub_end() {
		return sub_end;
	}
	public void setSub_end(String sub_end) {
		this.sub_end = sub_end;
	}
	public int getSubNumber() {
		return subNumber;
	}
	public void setSubNumber(int subNumber) {
		this.subNumber = subNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
