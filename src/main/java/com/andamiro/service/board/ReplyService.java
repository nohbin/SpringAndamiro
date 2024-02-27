package com.andamiro.service.board;

import java.util.List;

import com.andamiro.domain.board.Criteria;
import com.andamiro.domain.board.ReplyPageDTO;
import com.andamiro.domain.board.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	public List<ReplyVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	public Long recommend(Long rno);
}
