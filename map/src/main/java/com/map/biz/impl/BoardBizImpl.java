package com.map.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.map.biz.BoardBiz;
import com.map.dao.BoardDao;
import com.map.domain.BoardDto;
import com.map.domain.Criteria;

@Service
public class BoardBizImpl implements BoardBiz{

	@Autowired
	BoardDao dao;
	
	@Override
	public List<BoardDto> getList(Criteria cri) {
		return dao.getList(cri);
	}

	@Override
	public BoardDto getBoard(int bno) {
		return dao.getBoard(bno);
	}

	@Override
	public void addBoard(BoardDto dto) {
		dao.addBoard(dto);
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public boolean deleteBoard(int bno) {
		return dao.deleteBoard(bno);
	}

	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}

}
