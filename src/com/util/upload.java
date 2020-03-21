package com.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONObject;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class upload extends ActionSupport {
	private static final int BUFFER_SIZE = 16 * 1024;
	private File fujian;
	private String fujianFileName;
	private String fujianContentType;
	private String Imagedata;

	public String upload() {
		String newFujianName = new Date().getTime() + fujianFileName.substring(fujianFileName.indexOf("."));
		String dstPath = ServletActionContext.getServletContext().getRealPath("upload") + "\\" + newFujianName;
		File dstFile = new File(dstPath);
		copy(this.getFujian(), dstFile);

		byte[] buff = FaceUtil.getBytesFromFile(dstFile);
		String url = "https://api-cn.faceplusplus.com/facepp/v3/detect";
		HashMap<String, String> map = new HashMap<>();
		HashMap<String, byte[]> byteMap = new HashMap<>();
		map.put("api_key", "UuCXeqizA8vnVjmXPphDTnMCA8QaRKkt");
		map.put("api_secret", "bylF7hiL4GBDJalhElaBwJYb-PIt5DlM");
		map.put("return_landmark", "1");
		map.put("return_attributes",
				"gender,age,smiling,headpose,facequality,blur,eyestatus,emotion,ethnicity,beauty,mouthstatus,eyegaze,skinstatus");
		byteMap.put("image_file", buff);
		try {
			byte[] bacd = FaceUtil.post(url, map, byteMap);
			String str = new String(bacd);
			System.out.println("人脸识别返回值：" + str);
			JSONObject object = JSONObject.parseObject(str);
			int face_num = object.getIntValue("face_num");
			System.out.println("face_num：" + face_num);
			if (face_num == 1) {
				Map request = (Map) ServletActionContext.getContext().get("request");
				request.put("newFujianName", newFujianName);
				request.put("oldFujianName", fujianFileName);
				request.put("fujianPath", "/upload" + "/" + newFujianName);
				return ActionSupport.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionSupport.INPUT;
	}

	public String compare() {
		try {
			// 注意：加上这句就必须设置响应的编码格式，否则会出现乱码
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			System.out.println("fujian：" + fujian);
			System.out.println("fujianFileName：" + fujianFileName);
			String dstPath1 = ServletActionContext.getServletContext().getRealPath("upload") + "\\" + fujianFileName;
			File dstFile1 = new File(dstPath1);
			copy(this.getFujian(), dstFile1);

			Map session = ActionContext.getContext().getSession();
			System.out.println("session：" + session);
			TUser tUser = (TUser) session.get("user");
			String fileName = tUser.getFujian().substring(tUser.getFujian().lastIndexOf("/") + 1);
			String dstPath2 = ServletActionContext.getServletContext().getRealPath("upload") + "\\" + fileName;
			File dstFile2 = new File(dstPath2);

			byte[] buff1 = FaceUtil.getBytesFromFile(dstFile1);
			System.out.println("buff：" + buff1);
			byte[] buff2 = FaceUtil.getBytesFromFile(dstFile2);
			System.out.println("buff：" + buff2);
			String url = "https://api-cn.faceplusplus.com/facepp/v3/compare";
			HashMap<String, String> map = new HashMap<>();
			HashMap<String, byte[]> byteMap = new HashMap<>();
			map.put("api_key", "UuCXeqizA8vnVjmXPphDTnMCA8QaRKkt");
			map.put("api_secret", "bylF7hiL4GBDJalhElaBwJYb-PIt5DlM");
			byteMap.put("image_file1", buff1);
			byteMap.put("image_file2", buff2);
			byte[] bacd = FaceUtil.post(url, map, byteMap);
			String str = new String(bacd);
			System.out.println("人脸识别返回值：" + str);
			JSONObject object = JSONObject.parseObject(str);
			float confidence = object.getFloatValue("confidence");
			if (confidence <= 75) {
				session.clear();
			}
			out.println(confidence);// 返回的字符串数据
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private static void copy(File src, File dst) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public File getFujian() {
		return fujian;
	}

	public void setFujian(File fujian) {
		this.fujian = fujian;
	}

	public String getFujianContentType() {
		return fujianContentType;
	}

	public void setFujianContentType(String fujianContentType) {
		this.fujianContentType = fujianContentType;
	}

	public String getFujianFileName() {
		return fujianFileName;
	}

	public void setFujianFileName(String fujianFileName) {
		this.fujianFileName = fujianFileName;
	}

	public String getImagedata() {
		return Imagedata;
	}

	public void setImagedata(String imagedata) {
		Imagedata = imagedata;
	}

}
