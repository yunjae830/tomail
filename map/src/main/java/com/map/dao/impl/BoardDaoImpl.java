package com.map.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.map.dao.BoardDao;
import com.map.domain.BoardDto;
import com.map.domain.Criteria;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSessionTemplate sql;
	
	@Override
	public List<BoardDto> getList(Criteria cri) {
		return sql.selectList(namespace + "getList", cri);
	}

	@Override
	public BoardDto getBoard(int bno) {
		return sql.selectOne(namespace + "getBoard", bno);
	}

	@Override
	public void addBoard(BoardDto dto) {
		sql.insert(namespace + "insert", dto);
		
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		return sql.update(namespace + "update", dto) == 1;
	}

	@Override
	public boolean deleteBoard(int bno) {
		return sql.delete(namespace + "delete", bno) ==1;
	}

}
