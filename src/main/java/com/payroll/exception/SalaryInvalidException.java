package com.payroll.exception;

public class SalaryInvalidException extends Exception {
	@Override
 public String getMessage() {
	return "Salary not approved";
	 
 }
	public String getSalMessage() {
		return "Salary not Approved";
		
	}
}
