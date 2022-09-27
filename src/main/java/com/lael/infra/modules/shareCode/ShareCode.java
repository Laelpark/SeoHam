package com.lael.infra.modules.shareCode;

import java.util.ArrayList;
import java.util.List;

public class ShareCode {
	
	private String cdSeq;
	private String name;
	private String name_eng;
	private String cdAnother;
	private Integer cdUserNy;
	private Integer cdOrder;
	private String cdReferenceV1;
	private String cdReferenceV2;
	private String cdReferenceV3;
	private Integer cdReferenceI1;
	private Integer cdReferenceI2;
	private Integer cdReferenceI3;
	private Integer cdDelNy;
	private String createdAt;
	private String modifiedAt;
	private String ccgSeq;
	private String ccgName;
	
//	for cache
	public static List<ShareCode> cachedCodeArrayList = new ArrayList<ShareCode>();

	
	public String getCcgSeq() {
		return ccgSeq;
	}

	public void setCcgSeq(String ccgSeq) {
		this.ccgSeq = ccgSeq;
	}

	public String getCcgName() {
		return ccgName;
	}

	public void setCcgName(String ccgName) {
		this.ccgName = ccgName;
	}

	public String getCdSeq() {
		return cdSeq;
	}

	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName_eng() {
		return name_eng;
	}

	public void setName_eng(String name_eng) {
		this.name_eng = name_eng;
	}

	public String getCdAnother() {
		return cdAnother;
	}

	public void setCdAnother(String cdAnother) {
		this.cdAnother = cdAnother;
	}

	public Integer getCdUserNy() {
		return cdUserNy;
	}

	public void setCdUserNy(Integer cdUserNy) {
		this.cdUserNy = cdUserNy;
	}

	public Integer getCdOrder() {
		return cdOrder;
	}

	public void setCdOrder(Integer cdOrder) {
		this.cdOrder = cdOrder;
	}

	public String getCdReferenceV1() {
		return cdReferenceV1;
	}

	public void setCdReferenceV1(String cdReferenceV1) {
		this.cdReferenceV1 = cdReferenceV1;
	}

	public String getCdReferenceV2() {
		return cdReferenceV2;
	}

	public void setCdReferenceV2(String cdReferenceV2) {
		this.cdReferenceV2 = cdReferenceV2;
	}

	public String getCdReferenceV3() {
		return cdReferenceV3;
	}

	public void setCdReferenceV3(String cdReferenceV3) {
		this.cdReferenceV3 = cdReferenceV3;
	}

	public Integer getCdReferenceI1() {
		return cdReferenceI1;
	}

	public void setCdReferenceI1(Integer cdReferenceI1) {
		this.cdReferenceI1 = cdReferenceI1;
	}

	public Integer getCdReferenceI2() {
		return cdReferenceI2;
	}

	public void setCdReferenceI2(Integer cdReferenceI2) {
		this.cdReferenceI2 = cdReferenceI2;
	}

	public Integer getCdReferenceI3() {
		return cdReferenceI3;
	}

	public void setCdReferenceI3(Integer cdReferenceI3) {
		this.cdReferenceI3 = cdReferenceI3;
	}

	public Integer getCdDelNy() {
		return cdDelNy;
	}

	public void setCdDelNy(Integer cdDelNy) {
		this.cdDelNy = cdDelNy;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public static List<ShareCode> getCachedCodeArrayList() {
		return cachedCodeArrayList;
	}

	public static void setCachedCodeArrayList(List<ShareCode> cachedCodeArrayList) {
		ShareCode.cachedCodeArrayList = cachedCodeArrayList;
	}
	

}
