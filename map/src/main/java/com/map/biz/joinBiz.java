package com.map.biz;


import com.map.domain.joinVO;

public interface joinBiz {
	public int joinInsert(joinVO dto);
	public int loginSelect(String email,String pw);
	public int joinCheck(String email, String pw);
	public int pass_ck(String email);
	public void pass_complate(String email);//���Խ� ���
	public int pass_change(joinVO dto);
	public String mail_check(String email);
}
