package com.lael.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

public class Code {
	
	private String cdSeq;
	private String name;
	private String codeName;
	private Integer codeOrder;
	private String ccgSeq;
	
//	for cache
	public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
	
	public String getCcgSeq() {
		return ccgSeq;
	}
	public void setCcgSeq(String ccgSeq) {
		this.ccgSeq = ccgSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCdSeq() {
		return cdSeq;
	}
	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public Integer getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(Integer codeOrder) {
		this.codeOrder = codeOrder;
	}
	
	
	

}
