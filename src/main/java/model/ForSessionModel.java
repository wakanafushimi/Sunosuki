package model;

import java.util.ArrayList;
import java.util.List;

public class ForSessionModel {
	private String date;
	List<String> sessionList=new ArrayList<>();
	String[] sessionArray=new String[sessionList.size()];
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<String> getSessionList() {
		return sessionList;
	}
	public void setSessionList(List<String> sessionList) {
		this.sessionList = sessionList;
	}
	public String[] getSessionArray() {
		return sessionArray;
	}
	public void setSessionArray(String[] sessionArray) {
		this.sessionArray = sessionArray;
	}
	
	
}
