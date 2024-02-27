package com.andamiro.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.service.board.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class BoardServiceTest {
	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	@Test
	public void serviceListTempTest() {
		log.info(service.getListTemp());
	}
	@Test
	public void serviceRegisterTest() {
		BoardVO board = new BoardVO();
		board.setCno(05);
		board.setTitle("보드 서비스 레지스터 테스트");
		board.setContent("내용 없습니다.");
		board.setWriter("hihi");
		log.info("bno??????????????? " + board.getBno());
		service.register(board);
		log.info("bno??????????????? " + board.getBno());
	}
	@Test
	public void serviceReadTest() {
		log.info(service.read(9L));
	}
	@Test
	public void serviceModifyTest() {
		BoardVO board = service.read(9L);
		board.setTitle("보드 서비스 모디파이 테스트");
		board.setContent("내용 없습니다.");
		board.setWriter("momo");
		log.info("♥ 서비스 모디파이 결과는 ? " + service.modify(board) + " ♥");
	}
	@Test
	public void serviceDeleteTest() {
		log.info("♥ 서비스 딜리트 결과는 ? " + service.delete(8L) + " ♥");
	}
}
