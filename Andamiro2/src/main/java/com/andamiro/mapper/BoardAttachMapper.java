package com.andamiro.mapper;

import java.util.List;

import com.andamiro.domain.board.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
}
