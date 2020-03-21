package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TKefangDAO;
import com.dao.TRuzhuDAO;
import com.model.TCatelog;
import com.model.TRuzhu;
import com.opensymphony.xwork2.ActionSupport;

public class ruzhuAction extends ActionSupport {
	private Integer id;
	private Integer kefang_id;
	private String kehuming;
	private String kehuzheng;

	private String rushijian;
	private String lishijian;
	private Integer feiyong;

	private TRuzhuDAO ruzhuDAO;
	private TKefangDAO kefangDAO;

	private String message;
	private String path;

	public String ruzhuAdd() {
		TRuzhu ruzhu = new TRuzhu();

		ruzhu.setKefang_id(kefang_id);
		ruzhu.setKehuming(kehuming);
		ruzhu.setKehuzheng(kehuzheng);
		ruzhu.setRushijian(rushijian);

		ruzhu.setLishijian(lishijian);
		ruzhu.setFeiyong(feiyong);

		ruzhuDAO.save(ruzhu);

		this.setMessage("操作成功");
		this.setPath("ruzhuMana.action");
		return "succeed";
	}

	public String ruzhuMana() {
		String sql = "from TRuzhu";
		List ruzhuList = ruzhuDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < ruzhuList.size(); i++) {
			TRuzhu ruzhu = (TRuzhu) ruzhuList.get(i);
			ruzhu.setKefang(kefangDAO.findById(ruzhu.getKefang_id()));
		}

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("ruzhuList", ruzhuList);
		return ActionSupport.SUCCESS;
	}

	public String ruzhuDel() {

		TRuzhu ruzhu = ruzhuDAO.findById(id);
		ruzhuDAO.delete(ruzhu);

		this.setMessage("操作成功");
		this.setPath("ruzhuMana.action");
		return "succeed";
	}

	public Integer getFeiyong() {
		return feiyong;
	}

	public TKefangDAO getKefangDAO() {
		return kefangDAO;
	}

	public void setKefangDAO(TKefangDAO kefangDAO) {
		this.kefangDAO = kefangDAO;
	}

	public void setFeiyong(Integer feiyong) {
		this.feiyong = feiyong;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getKefang_id() {
		return kefang_id;
	}

	public void setKefang_id(Integer kefang_id) {
		this.kefang_id = kefang_id;
	}

	public String getKehuming() {
		return kehuming;
	}

	public void setKehuming(String kehuming) {
		this.kehuming = kehuming;
	}

	public String getKehuzheng() {
		return kehuzheng;
	}

	public void setKehuzheng(String kehuzheng) {
		this.kehuzheng = kehuzheng;
	}

	public String getLishijian() {
		return lishijian;
	}

	public void setLishijian(String lishijian) {
		this.lishijian = lishijian;
	}

	public String getRushijian() {
		return rushijian;
	}

	public void setRushijian(String rushijian) {
		this.rushijian = rushijian;
	}

	public TRuzhuDAO getRuzhuDAO() {
		return ruzhuDAO;
	}

	public void setRuzhuDAO(TRuzhuDAO ruzhuDAO) {
		this.ruzhuDAO = ruzhuDAO;
	}

}
