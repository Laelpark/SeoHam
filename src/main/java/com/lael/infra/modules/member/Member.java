package com.lael.infra.modules.member;

public class Member {
	
	private String seq;
	private String id;
	private String pw;
	private String name;
	private Integer dob;
	private Integer dob2;
	private Integer dob3;
	private Integer gender;
	private String email;
	private Integer phone;
	private String nick_nm;
	private String share_place;
	private Integer grade;
	private String review;
	private String location;
	private Integer share_report_seq;
	private Integer share_review_seq;
	private Integer DelNy;
	private String createDate;
	private Integer shareCount;
	
	
	
	public Integer getShare_report_seq() {
		return share_report_seq;
	}
	public void setShare_report_seq(Integer share_report_seq) {
		this.share_report_seq = share_report_seq;
	}
	public Integer getShare_review_seq() {
		return share_review_seq;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Integer getShareCount() {
		return shareCount;
	}
	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}
	public void setShare_review_seq(Integer share_review_seq) {
		this.share_review_seq = share_review_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getDob() {
		return dob;
	}
	public void setDob(Integer dob) {
		this.dob = dob;
	}
	public Integer getDob2() {
		return dob2;
	}
	public void setDob2(Integer dob2) {
		this.dob2 = dob2;
	}
	public Integer getDob3() {
		return dob3;
	}
	public void setDob3(Integer dob3) {
		this.dob3 = dob3;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	
	public String getNick_nm() {
		return nick_nm;
	}
	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	public String getShare_place() {
		return share_place;
	}
	public void setShare_place(String share_place) {
		this.share_place = share_place;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Integer getDelNy() {
		return DelNy;
	}
	public void setDelNy(Integer delNy) {
		DelNy = delNy;
	}
	
}
