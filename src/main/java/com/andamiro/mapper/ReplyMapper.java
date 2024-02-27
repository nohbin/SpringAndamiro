package com.andamiro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.andamiro.domain.board.Criteria;
import com.andamiro.domain.board.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO rVo);
	public ReplyVO read(Long rno); // 특정 댓글 읽기
	public int delete (Long rno);
	public int update (ReplyVO vo);
	public List<ReplyVO> getListWithPaging(
											@Param("cri") Criteria cri,
											@Param("bno") Long bno
										  );
	public int getCountByBno(Long bno);
	public int updateRecommendCount(Long rno); 	
}
