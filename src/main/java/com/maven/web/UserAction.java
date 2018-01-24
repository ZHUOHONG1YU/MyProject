package com.maven.web;

import com.maven.entity.Users;
import com.maven.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Controller
@RequestMapping("/userAction")
public class UserAction {

    @Resource(name="userService")
    private UserService userService;

    @RequestMapping("/doLogin")
    public String doLogin(Users users, RedirectAttributes attr, HttpSession session){
        //调用服务层方法执行添加业务
        users=userService.doLogin(users);
        if(users==null){
            attr.addAttribute("rtype","1");
            return "redirect:/index.jsp";
        }else {
            session.setAttribute("LoginUser",users);
        }
        return "main";
    }

    @RequestMapping("/addUser")
    public String addUsers(Users users, RedirectAttributes attr, HttpSession session){
        if (userService.addUser(users)) {
            attr.addAttribute("rtype", "1");
            session.setAttribute("LoginUser",users);
        } else {
            attr.addAttribute("rtype", "2");
        }
        return "main";
    }

    @RequestMapping("/addUser2")
    public String addUser2(Users users, RedirectAttributes attr) {
        if (userService.addUser(users)) {
            attr.addAttribute("rtype", "1");
        } else {
            attr.addAttribute("rtype", "2");
        }
        return "redirect:/addAdminis.jsp";
    }

    @ResponseBody
    @RequestMapping("/addUser3")
    public boolean addUser3(Users users, RedirectAttributes attr) {
        Boolean res;
        if (userService.addUser(users)) {
            res = true;
        } else {
            res = false;
            //attr.addAttribute("rtype", "2");
        }
        return res;
    }

    @RequestMapping("/findUserList")
    @ResponseBody
    public List findUserList(){
        return userService.findUserList();
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
