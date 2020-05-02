package com.example.utc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.utc.dao.EmployeeDao;
import com.example.utc.dao.EmployeeDaoImpl;
import com.example.utc.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDaoImpl employeeDao;
	@Autowired
	private EmployeeDao dao;

	@Override
	public Employee getEmployee(Integer empId) {
		Employee employee = dao.findById(empId).get();
		System.out.println("TEST" + employee);
		return employee;
	}

	@Override
	public List<Employee> getEmployees() {
		List<Employee> findAll = dao.findAll();
		System.out.println("list" + findAll);
		return findAll;
	}

	@Override
	public String updadateEmployee(Integer empId, Employee emp) {
		if (dao.findById(empId).isPresent()) {
			dao.save(emp);
			return "success";
		}
		return null;
	}

	@Override
	public Employee addEmployee(Employee employee) {
		return dao.save(employee);
	}

	@Override
	public void deleteEmployee(Integer empID) {
		dao.deleteById(empID);
	}

}
