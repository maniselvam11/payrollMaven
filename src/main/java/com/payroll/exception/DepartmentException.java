package com.payroll.exception;

public class DepartmentException extends Exception{

	@Override
	public String getMessage() {
		return "Department not inserted properly";
		
	}
	public String getDeptInvalid() {
		return "Department Grade already exist";
		
	}
}
