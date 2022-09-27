package com.lael.infra.modules.member;

import com.lael.infra.common.base.BaseVo;

public class MemberVo extends BaseVo{

	private String seq;
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shUpdt;


	//	public Date getDatepickerS() {
//		return datepickerS;
//	}
//	public void setDatepickerS(Date datepickerS) {
//		this.datepickerS = datepickerS;
//	}
//	public Date getDatepickerE() {
//		return datepickerE;
//	}
//	public void setDatepickerE(Date datepickerE) {
//		this.datepickerE = datepickerE;
//	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public Integer getShUpdt() {
		return shUpdt;
	}
	public void setShUpdt(Integer shUpdt) {
		this.shUpdt = shUpdt;
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

}
