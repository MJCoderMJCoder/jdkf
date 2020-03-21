package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TKefangDAO;
import com.dao.TPinglunDAO;
import com.model.TCatelog;
import com.model.TKefang;
import com.model.TPinglun;
import com.opensymphony.xwork2.ActionSupport;

public class kefangAction extends ActionSupport {
	private int id;
	private int catelogId;
	private String fangjianhao;
	private String area;
	private String jieshao;
	private String fujian;
	private int qianshu;
	private String yudingtiaojian;

	private String message;
	private String path;

	private TCatelogDAO catelogDAO;
	private TKefangDAO kefangDAO;
	private TPinglunDAO pinglunDAO;

	private int qianshu1;
	private int qianshu2;

	public String kefangAdd() {
		TKefang kefang = new TKefang();

		kefang.setFangjianhao(fangjianhao);
		kefang.setArea(area);
		kefang.setJieshao(jieshao);
		kefang.setFujian(fujian);
		kefang.setQianshu(qianshu);
		kefang.setCatelogId(catelogId);
		kefang.setDel("no");

		kefangDAO.save(kefang);
		this.setMessage("操作成功");
		this.setPath("kefangMana.action");
		return "succeed";
	}

	public String kefangMana() {
		String sql = "from TKefang where del='no' order by catelogId";
		List kefangList = kefangDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < kefangList.size(); i++) {
			TKefang kefang = (TKefang) kefangList.get(i);
			kefang.setCatelog(catelogDAO.findById(kefang.getCatelogId()));
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}

	public String kefangDel() {

		TKefang kefang = kefangDAO.findById(id);
		kefang.setDel("yes");
		kefangDAO.attachDirty(kefang);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}

	public String kefangEditPre() {

		TKefang kefang = kefangDAO.findById(id);
		kefang.setCatelog(catelogDAO.findById(kefang.getCatelogId()));

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("kefang", kefang);
		return ActionSupport.SUCCESS;

	}

	public String kefangEdit() {
		TKefang kefang = kefangDAO.findById(id);

		kefang.setFangjianhao(fangjianhao);
		kefang.setArea(area);
		kefang.setJieshao(jieshao);
		kefang.setFujian(fujian);
		kefang.setQianshu(qianshu);
		kefang.setCatelogId(catelogId);

		kefangDAO.getHibernateTemplate().update(kefang);
		this.setMessage("操作成功");
		this.setPath("kefangMana.action");
		return "succeed";

	}

	public String kefangByCatelog() {
		String sql = "from TKefang where del='no' and catelogId=" + catelogId;
		List kefangList = kefangDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < kefangList.size(); i++) {
			TKefang kefang = (TKefang) kefangList.get(i);
			kefang.setCatelog(catelogDAO.findById(kefang.getCatelogId()));
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}

	public String kefangDetailQian() {
		Map request = (Map) ServletActionContext.getContext().get("request");

		TKefang kefang = kefangDAO.findById(id);
		request.put("kefang", kefang);
		return ActionSupport.SUCCESS;

	}

	public String kefangSearch() {
		String sql = "from TKefang where del='no' and qianshu>? and qianshu<? order by catelogId";
		Object[] c = { qianshu1, qianshu2 };
		List kefangList = kefangDAO.getHibernateTemplate().find(sql, c);
		for (int i = 0; i < kefangList.size(); i++) {
			TKefang kefang = (TKefang) kefangList.get(i);
			kefang.setCatelog(catelogDAO.findById(kefang.getCatelogId()));
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}

	public String pinglunAdd() {
		HttpServletRequest request = ServletActionContext.getRequest();

		TPinglun pinglun = new TPinglun();
		pinglun.setContent(request.getParameter("content"));
		pinglun.setShijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		pinglun.setKefangId(Integer.parseInt(request.getParameter("kefangId")));

		pinglunDAO.save(pinglun);
		request.setAttribute("msg", "评论成功");
		return "msg";
	}

	public String pinglunAll() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String s = "from TPinglun where kefangId=" + Integer.parseInt(request.getParameter("kefangId"));
		List pinglunList = pinglunDAO.getHibernateTemplate().find(s);
		request.setAttribute("pinglunList", pinglunList);
		return ActionSupport.SUCCESS;
	}

	public String pinglunMana() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String s = "from TPinglun where kefangId=" + Integer.parseInt(request.getParameter("kefangId"));
		List pinglunList = pinglunDAO.getHibernateTemplate().find(s);
		request.setAttribute("pinglunList", pinglunList);
		return ActionSupport.SUCCESS;
	}

	public String pinglunDel() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String s = "delete from TPinglun where id=" + Integer.parseInt(request.getParameter("id"));
		pinglunDAO.getHibernateTemplate().bulkUpdate(s);
		request.setAttribute("msg", "删除成功");
		return "msg";
	}

	public String kefangAll() {
		String sql = "from TKefang where del='no'";
		List kefangList = kefangDAO.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public TCatelogDAO getCatelogDAO() {
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO) {
		this.catelogDAO = catelogDAO;
	}

	public int getCatelogId() {
		return catelogId;
	}

	public void setCatelogId(int catelogId) {
		this.catelogId = catelogId;
	}

	public String getFangjianhao() {
		return fangjianhao;
	}

	public TPinglunDAO getPinglunDAO() {
		return pinglunDAO;
	}

	public void setPinglunDAO(TPinglunDAO pinglunDAO) {
		this.pinglunDAO = pinglunDAO;
	}

	public void setFangjianhao(String fangjianhao) {
		this.fangjianhao = fangjianhao;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public int getQianshu1() {
		return qianshu1;
	}

	public void setQianshu1(int qianshu1) {
		this.qianshu1 = qianshu1;
	}

	public int getQianshu2() {
		return qianshu2;
	}

	public void setQianshu2(int qianshu2) {
		this.qianshu2 = qianshu2;
	}

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TKefangDAO getKefangDAO() {
		return kefangDAO;
	}

	public void setKefangDAO(TKefangDAO kefangDAO) {
		this.kefangDAO = kefangDAO;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getQianshu() {
		return qianshu;
	}

	public void setQianshu(int qianshu) {
		this.qianshu = qianshu;
	}

	public String getYudingtiaojian() {
		return yudingtiaojian;
	}

	public void setYudingtiaojian(String yudingtiaojian) {
		this.yudingtiaojian = yudingtiaojian;
	}

}
