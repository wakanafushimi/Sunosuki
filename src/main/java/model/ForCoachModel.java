package model;

import java.util.ArrayList;
import java.util.List;

public class ForCoachModel {
	private String trick;
	List<String> coaches=new ArrayList<>();

	public String getTrick() {
		return trick;
	}

	public void setTrick(String trick) {
		this.trick = trick;
	}

	public List<String> getCoachesList() {
		return coaches;
	}

	public void setCoachesList(List<String> coaches) {
		this.coaches = coaches;
	}
	
	
}
