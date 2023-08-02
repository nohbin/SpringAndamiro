package com.andamiro.service.board;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.domain.board.Criteria;
import com.andamiro.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getListTemp() {
		log.info("♥ Board Service Impl ♥ getListTemp ♥");
		return mapper.getListTemp();
	}
	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		log.info("♥ Board Service Impl ♥ getListWithPaging ♥");
		System.out.println("♥ Board Service Impl ♥ getListWithPaging ♥");
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int register(BoardVO board) {
		log.info("♥ Board Service Impl ♥ register ♥");
		return mapper.insertSelectKey(board);
	}
	@Transactional
	@Override
	public BoardVO read(Long bno) {
		mapper.updateReadCount(bno);
		return mapper.read(bno);
	}
	@Override
	public boolean modify(BoardVO board) {
		log.info("♥ Board Service Impl ♥ modify ♥");
		return (mapper.modify(board) == 1);
	}
	@Override
	public boolean delete(Long bno) {
		log.info("♥ Board Service Impl ♥ delete ♥");
		return (mapper.delete(bno) == 1);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		log.info("♥ Board Service Impl ♥ totalCount ♥");
		return mapper.getTotalCount(cri);
	}
	@Override
	public int recommend(Long bno) {
		return mapper.updateRecommendCount(bno);
	}
}
