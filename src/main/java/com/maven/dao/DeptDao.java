package com.maven.dao;

import com.maven.entity.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Repository("deptDao")
public class DeptDao extends BaseDao{

    //添加部门
    public boolean addDept(Dept dept){
        try {
            getSession().save(dept);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //查询所有部门
    public List findDeptList(String hql){
        return getSession().createQuery(hql).list();
    }
}
