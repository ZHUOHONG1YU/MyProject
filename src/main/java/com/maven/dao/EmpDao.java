package com.maven.dao;

import com.maven.entity.Emp;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Repository("empDao")
public class EmpDao extends BaseDao{

    //添加人员
    public boolean addEmp(Emp emp){
        try {
            getSession().save(emp);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //根据HQL执行查询操作
    public List findEmpList(String hql){
        return getSession().createQuery(hql).list();
    }


    //根据Id查询人员
    public Emp getByEmpId(Emp emp){
        return getSession().get(Emp.class, emp.getEno());
    }

    //修改人员
    public boolean updateEmp(Emp emp){
        try {
            getSession().update(emp);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //删除人员
    public boolean deleteEmp(Emp emp){
        try {
            getSession().delete(emp);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

}
