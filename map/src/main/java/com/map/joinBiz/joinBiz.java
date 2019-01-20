package com.map.joinBiz;


import com.map.join.joinVO;

public interface joinBiz {
	public int joinInsert(joinVO dto);
	public int loginSelect(String email,String pw);
	public int joinCheck(String email, String pw);
	public int pass_ck(String email);
	public void pass_complate(String email);//가입시 사용
	public int pass_change(joinVO dto);
	public String mail_check(String email);
}
