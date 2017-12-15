package com.sf.hackthon;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HackthondayApplicationTests {

	@Test
	public void contextLoads() {
	  Integer id = 3;
	  Assert.assertNotNull(id);
	}

}
