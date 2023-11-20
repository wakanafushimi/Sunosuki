package model;

public class ProfileModel {
	private String img=null; 
	private String username=null;
	private String pref=null;
	private String car=null;
	
//	private String trick_a_1;
//	private String trick_a_2;
//	private String trick_a_3;
//	private String trick_b_1;
//	private String trick_b_2;
//	private String trick_b_3;
	
	
	private String selfintro;
	
	
	public void setImg(String img) {
		this.img=img;
	}
	public String getImg() {
		return img;
	}
	
	public void setUsername(String username) {
		this.username=username;
	}
	public String getUsername() {
		return username;
	}
	
	public void setPref(String pref) {
		this.pref=pref;
	}
	public String getPref() {
		return pref;
	}
	
	public void setCar(String carStr) {
		this.car=carStr;
	}
	
	public String getCar() {
		return car;
	}
	
	public void setSelfintro(String selfintro) {
		this.selfintro=selfintro;
	}
	public String getSelfintro() {
		return selfintro;
	}
}
