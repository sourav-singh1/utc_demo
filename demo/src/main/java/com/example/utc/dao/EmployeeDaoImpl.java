package com.example.utc.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.example.utc.model.Employee;


@Repository
public class EmployeeDaoImpl{
	static int empCode =10000;
		
		static List<Employee> empList = new ArrayList() {{
			add(new Employee("Sourav", 123456, "PUNE", "IT", 50000, "Senior Engineer"));
			add(new Employee("Aman", 123457, "PUNE", "IT", 60000, "Senior Engineer"));
			add(new Employee("Rajesh", 123456, "Delhi", "IT", 20000, " Engineer"));
			add(new Employee("Mukesh", 124562, "Hyderabad", "IT", 40000, "Senior Engineer"));
			add(new Employee("Suhana", 113456, "Chennai", "IT", 150000, "Module Lead"));
			add(new Employee("Rajam", 153456, "Mumbai", "IT", 75000, "Senior Engineer"));
			add(new Employee("Dharamveer", 133456, "Washington DC", "IT", 80000, "Project Engineer"));
			add(new Employee("Karan", 113456, "Ontario", "IT", 90000, "Architect Lead"));
			add(new Employee("Arjun", 193456, "Dalhousie", "IT", 59000, "Software Engineer"));
			add(new Employee("Amrish", 423456, "PUNE", "IT", 15000, "QA Engineer"));
		}};


	// created static predefined data of employee
		

	public Employee getEmployee(Integer empId) {

	//	return empList.stream().filter(emp -> emp.getEmpCode().equals(empId)).findFirst().orElse(null);
return new Employee("TEST", null, null, null, 0f, null);
	}

	public List<Employee> getEmployees() {
		return empList;
	}

	public void updateEmployee(Integer empId, Employee employee) {
		Employee e = empList.stream().filter(emp -> emp.getEmpCode().equals(empId)).findFirst().orElse(null);
		e.setEmpName(employee.getEmpName());
		e.setAddress(employee.getAddress());
		e.setDept(employee.getDept());
		e.setDesig(employee.getDesig());
		e.setSalary(employee.getSalary());
		e.setEmpCode(empId);
	}

	public Employee addEmployee(Employee employee) {
		employee.setEmpCode(empCode);
		empList.add(employee);
		empCode++;
		return employee;
	}

	public String deleteEmployee(Integer empID) {
		Employee e = empList.stream().filter(emp->emp.getEmpCode().equals(empID)).findFirst().orElse(null);
		empList.remove(e);
		return "Success";
	}
}
