package com.lael.infra.modules.shareCodeGroup;

import com.lael.infra.common.base.BaseVo;

public class ShareCodeGroupVo extends BaseVo{

	private String ccgSeq;
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shUpdt;
	
	
	public String getCcgSeq() {
		return ccgSeq;
	}
	public void setCcgSeq(String ccgSeq) {
		this.ccgSeq = ccgSeq;
	}
	public Integer getShOption() {
		return shOption;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public Integer getShDelNy() {
		return shDelNy;
	}
	public void setShDelNy(Integer shDelNy) {
		this.shDelNy = shDelNy;
	}
	public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
	}
	
	
	
}
