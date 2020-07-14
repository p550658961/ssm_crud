package com.crud.test;

import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Random;
import java.util.UUID;


/**
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试Department
     */
    @Test
    public void testCRUD(){
        // 1、创建Springioc容器
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        context.getBean(DepartmentMapper.class);
        System.out.println(departmentMapper);

//
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));


        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<1000;i++){
            Random r = new Random();
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,s,"M",s+"@qq.com",r.nextInt(2)+1));
        }
    }

    @Test
    public void Test(){
        Random r = new Random();
        for(int i=0 ; i<5 ;  i++){
            System.out.println(r.nextInt(2)+1);
        }
    }
}
