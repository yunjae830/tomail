package com.map.joinDao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.map.join.joinVO;

@Repository
public class joinDaoImpl implements joinDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int joinInsert(joinVO dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"joinInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int loginSelect(String email,String pw) {
		String select_pw = null;
		try {
			select_pw = sqlSession.selectOne(namespace+"loginSelect",email);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("디비 비번값: "+select_pw+"\t 내가보낸 비번값 : " + pw);
		if(pw.equals(select_pw)) {
			System.out.println("성공");
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int joinCheck(String email,String pw) {

		String select_email = null;
		try {
			select_email = sqlSession.selectOne(namespace+"joincheck",email);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("디비 이메일 값: "+select_email+"\t 내가보낸 이메일 값 : " + email);
		if(email.equals(select_email)) {
			System.out.println("중복");
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public int pass_ck(String email) {
		
		String seach_email = null;
		
		try {
			seach_email = sqlSession.selectOne(namespace+"pass_ck",email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("디비 이메일 값 : " + seach_email + "\t 내가보낸 이메일 값 : " + email);
		if(email.equals(seach_email)) {
			System.out.println("존재");
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public void pass_complate(String email) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"pass_ck_complate",email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("내가 보낸 이메일 : "+ email + "\t 디비 성공여부 : "+res);
	}

	@Override
	public int pass_change(joinVO dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"pass_change", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public String mail_check(String email) {
		String mail_ck = null;
		try {
			mail_ck = sqlSession.selectOne(namespace+"mail_check", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mail_ck;
	}

}
