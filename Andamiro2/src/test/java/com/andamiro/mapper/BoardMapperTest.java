package com.andamiro.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.board.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class BoardMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void testExist() {
		log.info(mapper);
		assertNotNull(mapper);
	}
	@Test
	public void boardInsertTest() {
		BoardVO bVo = new BoardVO();
		bVo.setCno(01);
		bVo.setTitle("안다미로 게시판 테스트");
		bVo.setContent("테스트가 잘 진행되면 좋겠습니다. 13조 화이팅!!");
		bVo.setWriter("해솔");
		log.info("bno??????????????? " + bVo.getBno()); // null
		mapper.insertSelectKey(bVo);
		log.info("bno??????????????? " + bVo.getBno()); // selectedKey.
	}
	@Test
	public void boardReadTest() {
		log.info(mapper.read(2L));
	}
	@Test
	public void boardModifyTest() {
		BoardVO bVo = new BoardVO();
		bVo.setBno(2L);
		bVo.setCno(99);
		bVo.setTitle("게시글 수정 테스트");
		bVo.setContent("히히 히히!");
		bVo.setWriter("솔해");
		log.info("bVo?? " + bVo);
		mapper.modify(bVo);
	}
	@Test
	public void boardDeleteTest() {
		log.info(mapper.delete(4L));
	}
	
}
