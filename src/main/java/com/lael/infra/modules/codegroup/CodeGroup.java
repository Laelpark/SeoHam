package com.lael.infra.modules.codegroup;

public class CodeGroup {

	private Integer ccgSeq;
	private String name;
	private String name_eng;
	public String getCodeGroup_ccgSeq() {
		return codeGroup_ccgSeq;
	}
	public void setCodeGroup_ccgSeq(String codeGroup_ccgSeq) {
		this.codeGroup_ccgSeq = codeGroup_ccgSeq;
	}
	private String codeGroup_ccgSeq;
	
	public String getName_eng() {
		return name_eng;
	}
	public void setName_eng(String name_eng) {
		this.name_eng = name_eng;
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

}
