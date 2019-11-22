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
	}
	/**
	 * 更新时
	 * */
	@Override
	public void updateFill(MetaObject metaObject) {
		// creatTime自动填充为当前时间
		/*
		 * Object updataTime = getFieldValByName("updataTime", metaObject); if
		 * (updataTime == null) { Date date = new Date(); SimpleDateFormat dateFormat=
		 * new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss"); setFieldValByName("updataTime",
		 * dateFormat.format(date), metaObject); }
		 */
		// shipTime自动填充为当前时间
		/*
		 * Object shipTime = getFieldValByName("shipTime", metaObject); if (shipTime ==
		 * null) { Date date = new Date(); SimpleDateFormat dateFormat= new
		 * SimpleDateFormat("yyyy-MM-dd :hh:mm:ss"); setFieldValByName("shipTime",
		 * dateFormat.format(date), metaObject); }
		 */
	}

}
