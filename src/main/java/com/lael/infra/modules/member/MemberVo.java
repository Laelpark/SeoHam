package com.lael.infra.modules.member;

import com.lael.infra.common.base.BaseVo;

public class MemberVo extends BaseVo{

	private String seq;
	private String name;
	private String id;
	private String phone;
	private String nick_nm;


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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNick_nm() {
		return nick_nm;
	}
	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	
	
}
