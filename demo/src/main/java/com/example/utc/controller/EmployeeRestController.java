package com.example.utc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.utc.exception.EmployeeNotFoundException;
import com.example.utc.model.Employee;
import com.example.utc.service.EmployeeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api(value = "/employee", description = "Employee CRUD Operation", produces = "application/json")
@RequestMapping("/api")
public class EmployeeRestController {

	@Autowired
	private EmployeeService employeeService;

	@ApiOperation(value = "get Employees Object", response = Employee.class)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Employee Details Retrieved", response = Employee.class),
			@ApiResponse(code = 500, message = "Internal Server Error"),
			@ApiResponse(code = 404, message = "Employee not found") })
	@GetMapping("/employees/{id}")
	public ResponseEntity<Employee> getEmployee(@PathVariable("id") String empId) {
		Employee employee = employeeService.getEmployee(Integer.parseInt(empId));
		return new ResponseEntity<Employee>(employee, HttpStatus.OK);
	}

	@ApiOperation(value = "get Employees List", response = Employee.class)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "List of Employee with Details Retrieved", response = Employee.class),
			@ApiResponse(code = 500, message = "Internal Server Error"),
			@ApiResponse(code = 404, message = "Employee not found") })
	@GetMapping("/employees")
	public List<Employee> getEmployees() {
		System.out.println("getEployees called");
		return employeeService.getEmployees();
	}

	@PostMapping("/employees")
	public Employee addEmployee(Employee employee) {
		return employeeService.addEmployee(employee);
	}

	@DeleteMapping("/employees/{id}")
	public String delEmployee(@PathVariable("id") String empId) {
		employeeService.deleteEmployee(Integer.parseInt(empId));
		return "Success";
	}

	@PutMapping("/employees/{id}")
	public ResponseEntity<String> updateEmployee(@PathVariable("id") String empId, Employee employee) {
		String status = employeeService.updadateEmployee(Integer.parseInt(empId), employee);
		if (status == "success") {
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} else {
			throw new EmployeeNotFoundException("No Such Employee With Employee ID: " + empId + " exist!");
		}

	}

}
