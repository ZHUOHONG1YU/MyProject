package com.maven.service;

import com.maven.dao.PersonalDao;
import com.maven.entity.Personal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Service("personalService")
@Transactional(propagation = Propagation.REQUIRED)
public class PersonalService {

    @Resource(name = "personalDao")
    private PersonalDao personalDao;

    //添加用户信息
    public boolean addPersonal(Personal personal){
        return personalDao.addPersonal(personal);
    }

    public List findPersonal(){
        return personalDao.findPersonalList("from Personal");
    }
    public void setPersonalDao(PersonalDao personalDao) {
        this.personalDao = personalDao;
    }
}
