package com.lael.infra.modules.nationality;

import java.io.Serializable;

import com.lael.infra.common.base.BaseVo;

public class NationalityVo extends BaseVo implements Serializable{

	private static final long serialVersionUID = -7487131550711258015L;
	
	private String ifnaSeq;
//	----------
	public String getIfnaSeq() {
		return ifnaSeq;
	}

	public void setIfnaSeq(String ifnaSeq) {
		this.ifnaSeq = ifnaSeq;
	}
	
}
