package com.maven.web;

import com.maven.entity.Dept;
import com.maven.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Controller
@RequestMapping("/deptAction")
public class DeptAction {

    @Resource(name = "deptService")
    private DeptService deptService;

    @RequestMapping("/addDept")
    public String addDept(Dept dept, RedirectAttributes attr){
        if(deptService.addDept(dept)){
            attr.addAttribute("rtype","1");
        }else {
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/addDept.jsp";
    }

    @RequestMapping("/findDeptList")
    @ResponseBody
    public List findDeptList(){
        return deptService.findDeptList();
    }


    public void setDeptService(DeptService deptService) {
        this.deptService = deptService;
    }
}
