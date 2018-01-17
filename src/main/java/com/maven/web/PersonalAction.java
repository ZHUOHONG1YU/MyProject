package com.maven.web;

import com.maven.entity.Personal;
import com.maven.entity.Users;
import com.maven.service.PersonalService;
import com.maven.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Controller
@RequestMapping("/PersonalAction")
public class PersonalAction {

    @Resource(name = "personalService")
    private PersonalService personalService;

    @Resource(name="userService")
    private UserService userService;

    @RequestMapping("/addPersonal")
    public String addPersonal(Users users, Personal personal, MultipartFile psimage, HttpSession session){

        //取出用户对象
        //users = userService.getUsersById(users);
        //执行上传文件
        if(!psimage.isEmpty()){
            //生成路径
            String basePath = session.getServletContext().getRealPath("/images");
            String realName = psimage.getOriginalFilename();
            String filePath = basePath+"/"+realName;
            try {
                //保存文件
                psimage.transferTo(new File(filePath));
                personal.setPimage("/images/"+realName);
            }catch (IOException e){
                e.printStackTrace();
                return "error";
            }
        }
        //绑定用户信息
       // users.setUno(personal); && userService.updateUsers(users)

        if (personalService.addPersonal(personal)){
            session.setAttribute("rtype",1);
        }else {
            session.setAttribute("rtype", -1);
        }

        return "redirect:/main.jsp";
    }
    @RequestMapping("/findPersonal")
    @ResponseBody
    public List findPersonal(){
        return personalService.findPersonal();
    }

    public void setPersonalService(PersonalService personalService) {
        this.personalService = personalService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
