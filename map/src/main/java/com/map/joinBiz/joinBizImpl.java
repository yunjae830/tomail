package com.map.joinBiz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.map.join.joinVO;
import com.map.joinDao.joinDao;
@Service
public class joinBizImpl implements joinBiz {
	@Autowired
	private joinDao dao;
	@Override
	public int joinInsert(joinVO dto) {
		return dao.joinInsert(dto);
	}
	@Override
	public int loginSelect(String email,String pw) {
		return dao.loginSelect(email,pw);
	}
	@Override
	public int joinCheck(String email,String pw) {
		return dao.joinCheck(email,pw);
	}
	@Override
	public int pass_ck(String email) {
		return dao.pass_ck(email);
	}
	@Override
	public void pass_complate(String email) {
		dao.pass_complate(email);
		
	}
	@Override
	public int pass_change(joinVO dto) {
		return dao.pass_change(dto);
	}
	@Override
	public String mail_check(String email) {	
		return dao.mail_check(email);
	}

}
