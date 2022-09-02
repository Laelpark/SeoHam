package com.lael.infra.modules.codegroup;

public class CodeGroup {

	private Integer ccgSeq;
	private String name;
	private String name_eng;
	private Integer count;
	
	
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
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
