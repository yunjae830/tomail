package com.map.joinDao;


import com.map.join.joinVO;

public interface joinDao {

	String namespace = "board.";
	
	public int joinInsert(joinVO dto);
	public int loginSelect(String email, String pw);
	public int joinCheck(String email,String pw);
	public int pass_ck(String email);
	public void pass_complate(String email);
	public int pass_change(joinVO dto);
	public String mail_check(String email);
}
