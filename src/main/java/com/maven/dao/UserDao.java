package com.maven.dao;

import com.maven.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Repository("userDao")
public class UserDao extends BaseDao {
    //添加用户
    public boolean addUser(Users user){
        try{
            getSession().save(user);
            return true;
        } catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询用户
    public List findUsersList(String hql){
        return getSession().createQuery(hql).list();
    }

    //根据用户ID查询信息
    public Users getUsersById(Users users){
        return getSession().get(Users.class,users.getUno());
    }

    //修改用户
    public boolean updateUsers(Users users){
        try {
            getSession().update(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
