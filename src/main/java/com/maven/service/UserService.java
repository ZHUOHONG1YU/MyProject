package com.maven.service;

import com.maven.dao.UserDao;
import com.maven.entity.Users;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {

    @Resource(name ="userDao" )
    private UserDao userDao;


    //添加用户的方法
    public Users doLogin(Users user){
        String hql="from Users u where u.uname='"+user.getUname()+"' and u.ustatus=1";
        //取出同名的所有用户
        List<Users> list= userDao.findUsersList(hql);
        if(list!=null&&list.size()>0){
            for(Users users : list){
                if(users.getUname().equals(user.getUname())&&users.getUpwd().equals(user.getUpwd())){
                    return users;
                }
            }
        }
        return null;
    }

    public boolean addUser(Users user){
        //调用dao层方法执行添加用户操作
        //1，先查询该用户是否已经存在  user.getUname
        /**
         * if(!xxx.find(user.getName)){
         *      return userDao.addUser(user);
         * }
         * reuturn fales;
         */
        List list = userDao.findUsersList(user.getUname());
        if(list != null && list.size() > 0){
            return  false;
        }
        return userDao.addUser(user);
    }
    //查询所有用户
    public List findUserList(){
        return userDao.findUsersList("from Users");
    }

}
