package com.maven.service;

import com.maven.dao.EmpDao;
import com.maven.entity.Emp;
import com.maven.util.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/22.
 */
@Service("empService")
@Transactional(propagation = Propagation.REQUIRED)
public class EmpService {

    @Resource(name = "empDao")
    private EmpDao empDao;

    //添加人员
    public boolean addEmp(Emp emp){
        return empDao.addEmp(emp);
    }

    public PageBean findEmpForPage(PageBean bean){
        String hql="from Emp e inner join e.dept d where 1=1 order by d.dname desc";//默认HQL
        //执行查询获取当前页要显示的数据
        bean.setResult(empDao.findEmpList(hql, bean));
        //获取总的数据条数
        bean.setAllNum(empDao.findEmpList(hql).size());
        return bean;
    }

    public List findEmpList(){
        return empDao.findEmpList("from Emp e inner join e.dept d where 1=1 order by d.dname desc");
    }

    //根据Id查询人员
    public Emp getByEmpId(Emp emp){
        return empDao.getByEmpId(emp);
    }

    //修改人员
    public boolean updateEmp(Emp emp){
        return empDao.updateEmp(emp);
    }
    //删除人员
    public boolean deleteEmp(Emp emp){
        return empDao.deleteEmp(emp);
    }
}
