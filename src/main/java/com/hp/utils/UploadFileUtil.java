package com.hp.utils;

import java.io.File;
import java.io.InputStream;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadFileUtil {
	// 文件上传
		public static String uploadFile(CommonsMultipartFile uploadFile,String savePath) {
			try {
				String filename = uploadFile.getOriginalFilename();
				String substring = filename.substring(filename.lastIndexOf("."));
				if (substring.equals(".jpg") || substring.equals(".png")) {
					long size = uploadFile.getSize();
					if (size > 1048576) {
						return "error";
					}
					long time = new Date().getTime();
					String newName = time + filename;

					File file = new File(savePath + "/" + newName);

					InputStream inputStream = uploadFile.getInputStream();

					FileUtils.copyInputStreamToFile(inputStream, file);

					if (inputStream != null) {
						inputStream.close();
					}
					return newName;
				}
				return "error";
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
}
