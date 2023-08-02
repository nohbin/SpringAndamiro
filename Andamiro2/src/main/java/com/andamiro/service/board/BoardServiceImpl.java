package com.andamiro.service.board;


import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
		return mapper.getListTemp();
	}
	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int register(BoardVO board) {
		return mapper.insertSelectKey(board);
	}
	@Transactional
	@Override
	public BoardVO read(Long bno) {
	    // 조회 수 중복 방지
		ServletRequestAttributes sessionAttr = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes());

		HttpServletRequest request = sessionAttr.getRequest();
		HttpServletResponse response = sessionAttr.getResponse();
		
	    Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	           if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
			        System.out.println("11111111111111111111111111"+oldCookie.getName() + "/"+oldCookie.getValue());
			        break;
	           }
	        }
	    }
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("["+ bno +"]")) {
	        	mapper.updateReadCount(bno);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + bno + "]");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
		        System.out.println("22222222222222222222222222"+oldCookie.getName() + "/"+oldCookie.getValue());
	        }
	    } else {
	    	mapper.updateReadCount(bno);
	        Cookie newCookie = new Cookie("postView", "[" + bno + "]");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	        System.out.println("333333333333333333333333"+newCookie);
	    }
		return mapper.read(bno);
	}
	@Override
	public boolean modify(BoardVO board) {
		return (mapper.modify(board) == 1);
	}
	@Override
	public boolean delete(Long bno) {
		return (mapper.delete(bno) == 1);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	@Transactional
	@Override
	public Long recommend(Long bno) {
		mapper.updateRecommendCount(bno);
		BoardVO board = mapper.read(bno);
		Long result = board.getRecommendCount();
		return result;
	}
}
