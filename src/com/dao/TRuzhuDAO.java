package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TRuzhu;

/**
 * Data access object (DAO) for domain model class TRuzhu.
 * 
 * @see com.model.TRuzhu
 * @author MyEclipse Persistence Tools
 */

public class TRuzhuDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TRuzhuDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TRuzhu transientInstance)
	{
		log.debug("saving TRuzhu instance");
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

	public void delete(TRuzhu persistentInstance)
	{
		log.debug("deleting TRuzhu instance");
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

	public TRuzhu findById(java.lang.Integer id)
	{
		log.debug("getting TRuzhu instance with id: " + id);
		try
		{
			TRuzhu instance = (TRuzhu) getHibernateTemplate().get(
					"com.model.TRuzhu", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TRuzhu instance)
	{
		log.debug("finding TRuzhu instance by example");
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
		log.debug("finding TRuzhu instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TRuzhu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TRuzhu instances");
		try
		{
			String queryString = "from TRuzhu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TRuzhu merge(TRuzhu detachedInstance)
	{
		log.debug("merging TRuzhu instance");
		try
		{
			TRuzhu result = (TRuzhu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TRuzhu instance)
	{
		log.debug("attaching dirty TRuzhu instance");
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

	public void attachClean(TRuzhu instance)
	{
		log.debug("attaching clean TRuzhu instance");
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

	public static TRuzhuDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TRuzhuDAO) ctx.getBean("TRuzhuDAO");
	}
}