package com.andamiro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.domain.board.Criteria;

public interface BoardMapper {

	public List<BoardVO> getListTemp();
	public List<BoardVO> getListWithPaging(Criteria cri); 
	//카테고리 별로 게시판을 분리할 것. 메쏘드가 더 필요할 것. 

	public int insertSelectKey(BoardVO bVo);
	public int modify(BoardVO bVo);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	


	public void updateReadCount(Long bno); 	
	public int updateRecommendCount(Long bno); 	
	public void updateReplyCount(@Param("bno") Long bno, @Param("amount") int amount); 	/*MyBatis의 SQL을 처리하기 위해서는 기본적으로 하나의 파라미터 타입을 사용하기 때문에
																							위와 같이 2개 이상의 데이터를 전달하려면 @Param이라는 어노테이션을 이용해서 처리할 수 있습니다. */
	public int getTotalCount(Criteria cri);
//	public int getTotalCount(@Param("cri") Criteria cri, @Param("cno") String cno);

}
