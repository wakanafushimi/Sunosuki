package model;

import java.util.ArrayList;
import java.util.List;

public class SessionListModel {
	String[] sessiondetail=new String[7];
	List<String[]> sessionList=new ArrayList<>();
	List<List<String>> memberList=new ArrayList<>();
	

	public String[] getSessiondetail() {
		return sessiondetail;
	}
	public void setSessiondetail(String[] sessiondetail) {
		this.sessiondetail = sessiondetail;
	}
	
	public List<String[]> getSessionList() {
		return sessionList;
	}
	public void setSessionList(List<String[]> sessionList) {
		this.sessionList = sessionList;
	}
	
	public List<List<String>> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<List<String>> memberList) {
		this.memberList = memberList;
	}
	
	
}
