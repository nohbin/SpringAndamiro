package com.andamiro.service.board;

import java.util.List;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.domain.board.Criteria;

public interface BoardService {


	public List<BoardVO> getListTemp();
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int register(BoardVO board);
	public BoardVO read(Long bno);
	public boolean modify(BoardVO board);
	public boolean delete(Long bno);
	
	public int getTotalCount(Criteria cri);
	public int recommend(Long bno);

	
	

}
