package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TKefangDAO;
import com.dao.TUserDAO;
import com.model.TKefang;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TKefangDAO kefangDAO;
	private TCatelogDAO catelogDAO;
	
	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}
	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}
	public TKefangDAO getKefangDAO()
	{
		return kefangDAO;
	}
	public void setKefangDAO(TKefangDAO kefangDAO)
	{
		this.kefangDAO = kefangDAO;
	}


	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=ActionContext.getContext().getSession();
		
		String sql="from TKefang where del='no' order by catelogId";
		List kefangList=kefangDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<kefangList.size();i++)
		{
			TKefang kefang=(TKefang)kefangList.get(i);
			kefang.setCatelog(catelogDAO.findById(kefang.getCatelogId()));
		}
		
		request.put("kefangList", kefangList);
		
		
		
		sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		session.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}

}
