package com.lael.infra.modules.shareCode;

import com.lael.infra.common.base.BaseVo;

public class ShareCodeVo extends BaseVo{

	private String cdSeq;
	
	private Integer cdDelNy;
	private Integer shOption;
	private String shValue;
	private Integer shUpdt;
	
	
	public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
	}
	public String getCdSeq() {
		return cdSeq;
	}
	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
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
	public Integer getCdDelNy() {
		return cdDelNy;
	}
	public void setCdDelNy(Integer cdDelNy) {
		this.cdDelNy = cdDelNy;
	}


	
	
	
}
