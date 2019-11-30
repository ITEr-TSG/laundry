package com.hp.utils;

import java.util.UUID;

public class UUIDUtil {
	
	/**
	 * 根据UUID随机生成10位的字符串
	 * */
	public static String createUUID() {
		UUID uuid = UUID.randomUUID();
        String orderNumber = (String) uuid.toString().replace("-", "").toUpperCase().subSequence(0,10);
		return orderNumber;
	}
}
