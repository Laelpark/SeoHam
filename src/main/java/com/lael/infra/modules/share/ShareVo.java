package com.lael.infra.modules.share;

import com.lael.infra.common.base.BaseVo;

public class ShareVo extends BaseVo{

	private String seq;
	private Integer shOption;
	private String shValue;
	private Integer DelNy;
	private Integer shUpdt;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
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
	public Integer getDelNy() {
		return DelNy;
	}
	public void setDelNy(Integer DelNy) {
		this.DelNy = DelNy;
	}
	public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
	}
	
	

}
