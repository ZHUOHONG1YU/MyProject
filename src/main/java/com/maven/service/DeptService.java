package com.maven.service;

import com.maven.dao.DeptDao;
import com.maven.entity.Dept;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Service("deptService")
@Transactional(propagation = Propagation.REQUIRED)
public class DeptService {

    @Resource(name = "deptDao")
    private DeptDao deptDao;

    //添加部门
    public boolean addDept(Dept dept){

        String hql="from Dept d where d.dname='"+dept.getDname()+"'";
        List list = deptDao.findDeptList(hql);
        if(list != null && list.size() > 0){
            return  false;
        }
        return deptDao.addDept(dept);
    }
    //查询所有部门
    public List findDeptList(String hql){
        return deptDao.findDeptList("from Dept");
    }

    //查询所有部门并统计各部门人数
    public List findDeptList(){
        String hql="select d.dno,d.dname,count(e.ename) from Dept d left join Emp e on d.dno=e.dept.dno "
                + " group by d.dno,d.dname "
                + " order by d.dno";
        return deptDao.findDeptList(hql);
    }

    public void setDeptDao(DeptDao deptDao) {
        this.deptDao = deptDao;
    }
}
