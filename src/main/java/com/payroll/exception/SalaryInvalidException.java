package com.payroll.exception;

public class SalaryInvalidException extends Exception {
 public String getMessage() {
	return "Salary not approved";
	 
 }
}
