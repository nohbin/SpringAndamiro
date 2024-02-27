package com.andamiro.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.domain.board.Criteria;
import com.andamiro.domain.board.ReplyPageDTO;
import com.andamiro.domain.board.ReplyVO;
import com.andamiro.mapper.BoardMapper;
import com.andamiro.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardMapper;

	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		boardMapper.updateReplyCount(vo.getBno(), +1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		ReplyVO vo = mapper.read(rno); 
		boardMapper.updateReplyCount(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
	
	@Transactional
	@Override
	public Long recommend(Long rno) {
		mapper.updateRecommendCount(rno);
		ReplyVO reply = mapper.read(rno);
		Long result = reply.getRecommendCount();
		return result;
	}
	
	
	
	
}
