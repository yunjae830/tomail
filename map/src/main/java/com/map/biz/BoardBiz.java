package com.map.biz;

import java.util.List;

import com.map.domain.BoardDto;
import com.map.domain.Criteria;

public interface BoardBiz {

	List<BoardDto> getList(Criteria cri);
	BoardDto getBoard(int bno);
	void addBoard(BoardDto dto);
	boolean updateBoard(BoardDto dto);
	boolean deleteBoard(int bno);
}
