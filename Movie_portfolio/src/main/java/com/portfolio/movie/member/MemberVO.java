package com.portfolio.movie.member;

public class MemberVO {
	private int i_user;
	private String cid;
	private String cpw;
	private String salt;
	private String cpwConfirm;
	private String nm;
	private String email;
	private String ph;
	private String phAuthNumber;
	
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getCpwConfirm() {
		return cpwConfirm;
	}
	public void setCpwConfirm(String cpwConfirm) {
		this.cpwConfirm = cpwConfirm;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getPhAuthNumber() {
		return phAuthNumber;
	}
	public void setPhAuthNumber(String phAuthNumber) {
		this.phAuthNumber = phAuthNumber;
	}
	
	
}
