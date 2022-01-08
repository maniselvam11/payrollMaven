package com.payroll.exception;

import java.sql.SQLIntegrityConstraintViolationException;

public class EmployeeDelException extends SQLIntegrityConstraintViolationException{
@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "Employee details can't be delete Setted as in-active";
	
	}

}
