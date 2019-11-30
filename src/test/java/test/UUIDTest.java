package test;

import java.util.Date;
import java.util.UUID;

import org.junit.Test;

public class UUIDTest {
	
	@Test
	public void uuid() {
		UUID uuid = UUID.randomUUID();
		String orderNumber = (String) uuid.toString().replace("-", "").toUpperCase().subSequence(0,9);
		
        System.out.println(orderNumber);
	}
	@Test
	public void testTime() {
		Date date = new Date();
		System.out.println(date.getTime());
	}
}
