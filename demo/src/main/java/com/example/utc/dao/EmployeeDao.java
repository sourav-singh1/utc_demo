package com.example.utc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.utc.model.Employee;

@Repository
public interface EmployeeDao extends JpaRepository<Employee, Integer>{

}
