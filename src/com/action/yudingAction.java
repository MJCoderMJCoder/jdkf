package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TKefangDAO;
import com.dao.TUserDAO;
import com.dao.TYudingDAO;
import com.model.TKefang;
import com.model.TUser;
import com.model.TYuding;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.liuService;

public class yudingAction extends ActionSupport {
	private int id;
	private int kefangId;
	private int tianshu;
	private String yudingzheTel;

	private TYudingDAO yudingDAO;
	private TKefangDAO kefangDAO;
	private TUserDAO userDAO;

	public String yudingAdd() {
		Map request = (Map) ServletActionContext.getContext().get("request");
		Map session = (Map) ActionContext.getContext().getSession();

		TUser user = (TUser) session.get("user");

		TYuding yuding = new TYuding();
		yuding.setUserId(user.getUserId());
		yuding.setKefangId(kefangId);
		yuding.setTianshu(tianshu);
		yuding.setYudingzheTel(yudingzheTel);
		yuding.setShijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		yuding.setDel("no");
		yudingDAO.save(yuding);
		request.put("msg", "预订成功");

		return "msg";

	}

	public String yudingMana() {
		String sql = "from TYuding where del='no'";
		List yudingList = yudingDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < yudingList.size(); i++) {
			TYuding yuding = (TYuding) yudingList.get(i);
			yuding.setUser(userDAO.findById(yuding.getUserId()));
			yuding.setKefang(kefangDAO.findById(yuding.getKefangId()));
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("yudingList", yudingList);
		return ActionSupport.SUCCESS;
	}

	public String yudingDel() {
		TYuding yuding = yudingDAO.findById(id);
		yuding.setDel("yes");
		yudingDAO.attachDirty(yuding);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getKefangId() {
		return kefangId;
	}

	public void setKefangId(int kefangId) {
		this.kefangId = kefangId;
	}

	public int getTianshu() {
		return tianshu;
	}

	public void setTianshu(int tianshu) {
		this.tianshu = tianshu;
	}

	public TKefangDAO getKefangDAO() {
		return kefangDAO;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setKefangDAO(TKefangDAO kefangDAO) {
		this.kefangDAO = kefangDAO;
	}

	public TYudingDAO getYudingDAO() {
		return yudingDAO;
	}

	public void setYudingDAO(TYudingDAO yudingDAO) {
		this.yudingDAO = yudingDAO;
	}

	public String getYudingzheTel() {
		return yudingzheTel;
	}

	public void setYudingzheTel(String yudingzheTel) {
		this.yudingzheTel = yudingzheTel;
	}

}
