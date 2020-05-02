package com.example.utc.aop;

import java.util.NoSuchElementException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.example.utc.exception.EmployeeNotFoundException;
import com.example.utc.model.ErrorResponse;

@RestControllerAdvice
public class EmployeeRestControllerAdvice {

	@ExceptionHandler(value = { NoSuchElementException.class })
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ErrorResponse handleNotFoundException(NoSuchElementException e) {
		return new ErrorResponse(404, e.getMessage());

	}

	@ExceptionHandler(value = { EmptyResultDataAccessException.class })
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ErrorResponse handleEmptyDataSetException(EmptyResultDataAccessException e) {
		return new ErrorResponse(404, "No Such Employee found");

	}

	@ExceptionHandler(value = { EmployeeNotFoundException.class })
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ErrorResponse handleEmptyDataSetException(EmployeeNotFoundException e) {
		return new ErrorResponse(404, e.getMessage());

	}

}
