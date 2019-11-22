package com.hp.utils;

import java.util.Random;

public class RandomUtils {
	public static final int START = 1050;   //定义范围开始数字
    
    public static final int END = 9999; //定义范围结束数字
    
    public static String makeRandom() {
    	//创建Random类对象
        Random random = new Random();              
         
        //产生随机数
        int number = random.nextInt(END - START + 1) + START;
        String code = String.valueOf(number);
        return 	code;
    }
}
