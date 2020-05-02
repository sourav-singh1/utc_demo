package com.example.utc.service;

import java.util.List;

import com.example.utc.model.Employee;

public interface EmployeeService {

	public Employee getEmployee(Integer empId);
	public List<Employee> getEmployees();
	public String updadateEmployee(Integer empId, Employee emp);
	public Employee addEmployee(Employee employee);
	public void deleteEmployee(Integer empID);

}
