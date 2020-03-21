package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYuding;

/**
 * Data access object (DAO) for domain model class TYuding.
 * 
 * @see com.model.TYuding
 * @author MyEclipse Persistence Tools
 */

public class TYudingDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYudingDAO.class);

	// property constants
	public static final String USER_ID = "userId";

	public static final String KEFANG_ID = "kefangId";

	public static final String TIANSHU = "tianshu";

	public static final String YUDINGZHE_TEL = "yudingzheTel";

	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYuding transientInstance)
	{
		log.debug("saving TYuding instance");
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

	public void delete(TYuding persistentInstance)
	{
		log.debug("deleting TYuding instance");
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

	public TYuding findById(java.lang.Integer id)
	{
		log.debug("getting TYuding instance with id: " + id);
		try
		{
			TYuding instance = (TYuding) getHibernateTemplate().get(
					"com.model.TYuding", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYuding instance)
	{
		log.debug("finding TYuding instance by example");
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
		log.debug("finding TYuding instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TYuding as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId)
	{
		return findByProperty(USER_ID, userId);
	}

	public List findByKefangId(Object kefangId)
	{
		return findByProperty(KEFANG_ID, kefangId);
	}

	public List findByTianshu(Object tianshu)
	{
		return findByProperty(TIANSHU, tianshu);
	}

	public List findByYudingzheTel(Object yudingzheTel)
	{
		return findByProperty(YUDINGZHE_TEL, yudingzheTel);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TYuding instances");
		try
		{
			String queryString = "from TYuding";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYuding merge(TYuding detachedInstance)
	{
		log.debug("merging TYuding instance");
		try
		{
			TYuding result = (TYuding) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TYuding instance)
	{
		log.debug("attaching dirty TYuding instance");
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

	public void attachClean(TYuding instance)
	{
		log.debug("attaching clean TYuding instance");
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

	public static TYudingDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYudingDAO) ctx.getBean("TYudingDAO");
	}
}