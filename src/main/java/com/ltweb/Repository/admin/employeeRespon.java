package com.ltweb.Repository.admin;

import java.util.List;

import com.ltweb.entity.employees;

public interface employeeRespon {

	public List<employees> list();

	public employees getEmloyees(String user, String pass);

}
