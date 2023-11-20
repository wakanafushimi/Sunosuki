package dao;

import java.util.ArrayList;
import java.util.List;

public class TrickModel {
	List<String> trick_a=new ArrayList<>();
	List<String> trick_b=new ArrayList<>();
	
	public TrickModel() {}
	public TrickModel(String trick_a_1,String trick_a_2,String trick_a_3,String trick_b_1,String trick_b_2,String trick_b_3) {
		trick_a.add(trick_a_1);
		trick_a.add(trick_a_2);
		trick_a.add(trick_a_3);
		trick_b.add(trick_b_1);
		trick_b.add(trick_b_2);
		trick_b.add(trick_b_3);
	}
	public List<String> getTrick_a() {
		return trick_a;
	}
	public List<String> getTrick_b() {
		return trick_b;
	}
	

}
