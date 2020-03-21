package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TKefang;

/**
 * Data access object (DAO) for domain model class TKefang.
 * 
 * @see com.model.TKefang
 * @author MyEclipse Persistence Tools
 */

public class TKefangDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TKefangDAO.class);

	// property constants
	public static final String FANGJIANHAO = "fangjianhao";

	public static final String AREA = "area";

	public static final String JIESHAO = "jieshao";

	public static final String FUJIAN = "fujian";

	public static final String QIANSHU = "qianshu";

	public static final String CATELOG_ID = "catelogId";

	public static final String YUDINGTIAOJIAN = "yudingtiaojian";

	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TKefang transientInstance)
	{
		log.debug("saving TKefang instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TKefang persistentInstance)
	{
		log.debug("deleting TKefang instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TKefang findById(java.lang.Integer id)
	{
		log.debug("getting TKefang instance with id: " + id);
		try
		{
			TKefang instance = (TKefang) getHibernateTemplate().get(
					"com.model.TKefang", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TKefang instance)
	{
		log.debug("finding TKefang instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TKefang instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TKefang as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFangjianhao(Object fangjianhao)
	{
		return findByProperty(FANGJIANHAO, fangjianhao);
	}

	public List findByArea(Object area)
	{
		return findByProperty(AREA, area);
	}

	public List findByJieshao(Object jieshao)
	{
		return findByProperty(JIESHAO, jieshao);
	}

	public List findByFujian(Object fujian)
	{
		return findByProperty(FUJIAN, fujian);
	}

	public List findByQianshu(Object qianshu)
	{
		return findByProperty(QIANSHU, qianshu);
	}

	public List findByCatelogId(Object catelogId)
	{
		return findByProperty(CATELOG_ID, catelogId);
	}

	public List findByYudingtiaojian(Object yudingtiaojian)
	{
		return findByProperty(YUDINGTIAOJIAN, yudingtiaojian);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TKefang instances");
		try
		{
			String queryString = "from TKefang";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TKefang merge(TKefang detachedInstance)
	{
		log.debug("merging TKefang instance");
		try
		{
			TKefang result = (TKefang) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TKefang instance)
	{
		log.debug("attaching dirty TKefang instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TKefang instance)
	{
		log.debug("attaching clean TKefang instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TKefangDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TKefangDAO) ctx.getBean("TKefangDAO");
	}
}