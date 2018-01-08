package com.maven.web;

import com.maven.entity.Dept;
import com.maven.entity.Emp;
import com.maven.service.DeptService;
import com.maven.service.EmpService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/22.
 */
@Controller
@RequestMapping("/empAction")
public class EmpAction {

    @Resource(name = "empService")
    private EmpService empService;

    @Resource(name = "deptService")
    private DeptService deptService;

    @ResponseBody
    @RequestMapping("/selectDept")
    public List selectDept(){
        //查询部门
        return deptService.findDeptList();
    }

    //添加人员
    @RequestMapping("/addEmp")
    public String addEmp(Emp emp, Dept dept, RedirectAttributes attr){
        emp.setDept(dept);
        if(empService.addEmp(emp)){
            attr.addAttribute("rtype","1");
        }else {
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/addEmp.jsp";
    }

    //查询所有人员
    @RequestMapping("/findEmpList")
    public String findEmpList(Model model){
        //pageBean=empService.findEmpForPage(pageBean);

        model.addAttribute("empList" ,empService.findEmpList());
        return "empList";
    }

    //根据ID查询人员信息
    @RequestMapping("/getByIdEmp")
    public String getByIDEmp(Emp emp , Dept dept, HttpSession session){
        session.setAttribute("deptList",deptService.findDeptList());
        session.setAttribute("empList" , empService.getByEmpId(emp));

        return "updateEmp";
    }
    //修改人员
    @RequestMapping("/updateEmp")
    public String updateEmp(Emp emp, Dept dept, RedirectAttributes attr, HttpSession session){
        emp.setDept(dept);
        if(empService.updateEmp(emp)){
            session.setAttribute("rtype","1");
        }else {
            session.setAttribute("rtype","-1");
        }
        session.setAttribute("deptList",deptService.findDeptList());
        session.setAttribute("empList" , empService.getByEmpId(emp));
        return "updateEmp";
    }
    //删除人员
    @RequestMapping("/deteleEmp")
    public String deteleEmp(Emp emp, RedirectAttributes attr, Model model, HttpSession session){
        if(empService.deleteEmp(emp)){
            attr.addAttribute("rtype","1");
        }else {
            attr.addAttribute("rtype","-1");
        }


        session.setAttribute("empList" , empService.findEmpList());
        return "redirect:/empList.jsp";
    }


    public void setEmpService(EmpService empService) {
        this.empService = empService;
    }

    public void setDeptService(DeptService deptService) {
        this.deptService = deptService;
    }
}
