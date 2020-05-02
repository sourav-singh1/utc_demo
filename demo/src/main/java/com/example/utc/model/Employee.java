package com.example.utc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer empCode;
	
	@Column
	private String empName;

	@Column
	private String Address;
	@Column
	private String dept;
	@Column
	private float salary;
	@Column
	private String desig;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getEmpCode() {
		return empCode;
	}

	public void setEmpCode(Integer empCode) {
		this.empCode = empCode;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public String getDesig() {
		return desig;
	}

	public void setDesig(String desig) {
		this.desig = desig;
	}

	public Employee() {
		super();
	}

	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empCode=" + empCode + ", Address=" + Address + ", dept=" + dept
				+ ", salary=" + salary + ", desig=" + desig + "]";
	}

	public Employee(String empName, Integer empCode, String address, String dept, float salary, String desig) {
		super();
		this.empName = empName;
		this.empCode = empCode;
		Address = address;
		this.dept = dept;
		this.salary = salary;
		this.desig = desig;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((empName == null) ? 0 : empName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (empName == null) {
			if (other.empName != null)
				return false;
		} else if (!empName.equals(other.empName))
			return false;
		return true;
	}

}
