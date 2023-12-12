package model;

import java.util.ArrayList;
import java.util.List;

public class SessionListModel {
	String[] sessiondetail=new String[8];
	List<String[]> sessiondetailList=new ArrayList<>();
	List<List<String>> memberidList=new ArrayList<>();
	List<List<String>> membernameList=new ArrayList<>();

	public String[] getSessiondetail() {
		return sessiondetail;
	}
	public void setSessiondetail(String[] sessiondetail) {
		this.sessiondetail = sessiondetail;
	}
	
	public List<String[]> getSessiondetailList() {
		return sessiondetailList;
	}
	public void setSessiondetailList(List<String[]> sessiondetailList) {
		this.sessiondetailList = sessiondetailList;
	}
	
	public List<List<String>> getMemberidList() {
		return memberidList;
	}
	public void setMemberidList(List<List<String>> memberidList) {
		this.memberidList = memberidList;
	}
	
	
	public List<List<String>> getMembernameList() {
		return membernameList;
	}
	public void setMembernameList(List<List<String>> membernameList) {
		this.membernameList = membernameList;
	}
}