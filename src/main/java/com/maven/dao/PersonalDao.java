package com.maven.dao;

import com.maven.entity.Personal;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Repository("personalDao")
public class PersonalDao extends BaseDao{

    //添加用户信息
    public boolean addPersonal(Personal personal){
        try {
            getSession().save(personal);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //查询用户信息
    public List findPersonalList(String hql){
        return getSession().createQuery(hql).list();
    }
}
