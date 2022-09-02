package com.lael.infra.modules.code;

public class Code {
	
	private Integer ccgSeq;
	private String name;
	private Integer cdSeq;
	private String codeName;
	private Integer example;
	
	
	public Integer getExample() {
		return example;
	}
	public void setExample(Integer example) {
		this.example = example;
	}
	public Integer getCcgSeq() {
		return ccgSeq;
	}
	public void setCcgSeq(Integer ccgSeq) {
		this.ccgSeq = ccgSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private Integer codeOrder;
	private Integer codeGroup_ccgSeq;
	
	public Integer getCdSeq() {
		return cdSeq;
	}
	public void setCdSeq(Integer cdSeq) {
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
	public Integer getCodeGroup_ccgSeq() {
		return codeGroup_ccgSeq;
	}
	public void setCodeGroup_ccgSeq(Integer codeGroup_ccgSeq) {
		this.codeGroup_ccgSeq = codeGroup_ccgSeq;
	}

}
