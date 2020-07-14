package com.crud.service;


import com.crud.bean.Employee;

import java.util.List;

public interface EmployeeService {

    public List<Employee> getAll();


    void saveEmp(Employee employee);

    boolean checkUser(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteEmp(Integer id);

    void deleteBatch(List<Integer> str_ids);
}
