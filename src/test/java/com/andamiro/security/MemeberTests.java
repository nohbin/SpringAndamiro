package com.andamiro.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemeberTests {

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	private DataSource dataSource;

//	@Test
	public void testInsertMember() {

		String sql = "insert into andamiromember VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		for (int i = 0; i < 100; i++) {

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(3, passwordEncoder.encode("pw" + i));
				if (i < 80) {
					pstmt.setInt(1, i);
					pstmt.setString(2, "user" + i);
					pstmt.setString(4, "user" + i);
					pstmt.setString(5, "phone" + i);
					pstmt.setString(6, "email" + i + "@gmail.com");
					pstmt.setString(7, "join" + i);
					pstmt.setString(8, "sub" + i);
					pstmt.setInt(9,  i);
				} else if (i < 90) {
					pstmt.setInt(1, i);
					pstmt.setString(2, "manager" + i);
					pstmt.setString(4, "manager" + i);
					pstmt.setString(5, "phone" + i);
					pstmt.setString(6, "email" + i + "@gmail.com");
					pstmt.setString(7, "join" + i);
					pstmt.setString(8, "sub" + i);
					pstmt.setInt(9,  i);
				} else {
					pstmt.setInt(1, i);
					pstmt.setString(2, "admin" + i);
					pstmt.setString(4, "admin" + i);
					pstmt.setString(5, "phone" + i);
					pstmt.setString(6, "email" + i + "@gmail.com");
					pstmt.setString(7, "join" + i);
					pstmt.setString(8, "sub" + i);
					pstmt.setInt(9,  i);
				}

				pstmt.executeUpdate();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
		}
	}
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into andamiromember_auth (userid, auth) values (?,?)";
		
		for (int i = 0; i < 100; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				if(i<80) {
					pstmt.setString(1, "user"+1);
					pstmt.setString(2, "ROLE_USER");
				}else if(i<90) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(2, "ROLE_MEMBER");
				}else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
		}
		
	}
	
}
