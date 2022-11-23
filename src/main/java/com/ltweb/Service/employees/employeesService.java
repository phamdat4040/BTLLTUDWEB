package com.ltweb.Service.employees;

import java.util.List;

import com.ltweb.entity.employees;

public interface employeesService {

	List<employees> list();

	employees getEmployee(String user, String pass);
}
