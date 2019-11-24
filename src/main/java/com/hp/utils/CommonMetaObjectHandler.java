package com.hp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.reflection.MetaObject;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
/**
 * 自定义填充公共字段 
 * */
public class CommonMetaObjectHandler extends MetaObjectHandler {
	
	/**
	 * 插入时
	 * */
	@Override
	public void insertFill(MetaObject metaObject) {
		// 自动填充为 1（未删除状态）
		Object isDel = getFieldValByName("isDel", metaObject);
		if (isDel == null) {
			setFieldValByName("isDel", 1, metaObject);
		}
		// creatTime自动填充为当前时间
		Object createTime = getFieldValByName("createTime", metaObject);
		if (createTime == null) {
			Date date = new Date();
			setFieldValByName("createTime", date, metaObject);
		}
		// state自动填充为200待审核状态
		Object technState = getFieldValByName("technState", metaObject);
		if (technState == null) {
			setFieldValByName("technState", "200", metaObject);
		}
	}
	/**
	 * 更新时
	 * */
	@Override
	public void updateFill(MetaObject metaObject) {
		// changeTime
		Object changeTime = getFieldValByName("changeTime", metaObject);
		if (changeTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			setFieldValByName("changeTime", dateFormat.format(date), metaObject);
		}
		
	}

}
