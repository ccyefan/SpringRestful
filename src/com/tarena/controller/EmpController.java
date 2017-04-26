package com.tarena.controller;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.dao.EmpDao;
import com.tarena.entity.Emp;
@Controller
@RequestMapping("/emp")
public class EmpController {
    @Resource
    private EmpDao empDao;
    
//    @RequestMapping("/findEmp.do")
    @RequestMapping(value="/find",method=RequestMethod.GET)
    public String find(Model model) {
        List<Emp> list = empDao.findAll();
        model.addAttribute("emps", list);
        return "/emp_list";
    }
    /**
     * 打开新增页面
     */
//    @RequestMapping("/toAddEmp.do")
    @RequestMapping(value="/toAdd",method=RequestMethod.GET)
    public String toAdd() {
        return "/add_emp";
    }
    
    /**
     * 新增保存
     */
//    @RequestMapping("/addEmp.do")
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String add(Emp emp) {
        empDao.save(emp);
//        return "redirect:findEmp.do";
        return "redirect:find";
    }
    @RequestMapping(value="/capt",method=RequestMethod.POST)
    public String capt(@PathVariable("jcaptcha") String jcaptcha) {
    	System.out.println("jcaptcha:"+jcaptcha);
//        empDao.save(emp);
//        return "redirect:findEmp.do";
        return "";
    }
    
    /**
     * 打开修改页面
     */
//    @RequestMapping("/toUpdateEmp.do")
    @RequestMapping(value="/toUpdate/{id}",method=RequestMethod.GET)
    public String toUpdate(
//            @RequestParam("id") int id,
    		@PathVariable("id") int id,
            Model model) {
        Emp e = empDao.findById(id);
        model.addAttribute("emp", e);
        return "/update_emp";
    }
    
    /**
     * 修改保存
     */
//    @RequestMapping("/updateEmp.do")
    @RequestMapping(value="/update",method=RequestMethod.PUT)
    @ResponseBody
    public boolean update(@RequestBody Emp emp) {
        empDao.update(emp);
//        return "redirect:findEmp.do";
        return true;
    }
    
    /**
     * 删除
     */
//    @RequestMapping("/deleteEmp.do")
    @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public boolean delete(@PathVariable("id") int id) {
        empDao.delete(id);
//        return "redirect:findEmp.do";
        return true;
    }
}