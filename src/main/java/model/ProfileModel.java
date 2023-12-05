package model;

public class ProfileModel {
	private String img=null; 
	private String username=null;
	private String pref=null;
	private String car=null;
	private String style=null;
	private String geer=null;
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
	
	public void setStyle(String style) {
		this.style = style;
	}
	public String getStyle() {
		return style;
	}
	
	public void setGeer(String geer) {
		this.geer = geer;
	}
	public String getGeer() {
		return geer;
	}
	
	
}
