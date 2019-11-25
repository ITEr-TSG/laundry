package com.hp.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AnalysisKeyWordsListUtils {
	
	/**
	 * 把复杂的list解析成简单的map
	 * 	例如：[{name=custName, value=}, {name=min_integral, value=}, {name=max_integral, value=}, {name=custEmail, value=}, {name=start_date, value=}, {name=end_date, value=}]
	 * 	解析后：{end_date=, min_integral=, custEmail=, custName=, max_integral=, start_date=}
	 * */
	public HashMap<String, Object> analysisKeyWordsList(ArrayList<Map> arrayList) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Integer> list = new ArrayList<>();
		for (Map map2 : arrayList) {
			String object = (String) map2.get("name");
			if(object.equals("sortId")) {
				String sortId = (String) map2.get("value");
				Integer id = Integer.parseInt(sortId);
				list.add(id);
			}
			String object2 = (String) map2.get("value");
			map.put(object, object2);
		}
		map.put("sortId",list);
		return map;
	}
}
