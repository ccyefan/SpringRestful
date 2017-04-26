package com.tarena.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.EmpDao;
import com.tarena.entity.Emp;

public class TestEmpDao {
	/**
     * 测试查询全部员工
     */
    @Test
    public void testFindAll() {
        ApplicationContext ctx = 
            new ClassPathXmlApplicationContext(
                    "applicationContext.xml");
        EmpDao dao = ctx.getBean(EmpDao.class);
        List<Emp> list = dao.findAll();
        for(Emp e : list) {
            System.out.println(
                e.getEmpno() + " " +
                e.getEname() + " " +
                e.getJob()
            );
        }
    }
}
