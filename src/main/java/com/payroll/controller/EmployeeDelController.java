package com.payroll.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.EmployeeDaoImpl;
import com.payroll.exception.EmployeeDelException;

/**
 * Servlet implementation class EmployeeDelController
 */
@WebServlet("/empDel")
public class EmployeeDelController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int empId=Integer.parseInt(request.getParameter("empId"));
		EmployeeDaoImpl employeeDao=new EmployeeDaoImpl();
		int i=employeeDao.deleteEmp(empId);
		try{
		if(i>0) {
			response.sendRedirect("EmpShow.jsp");

		}
		else {
			throw new EmployeeDelException();
		}}
		catch(SQLException s) {
			try {
				throw new EmployeeDelException();
			}
			catch(EmployeeDelException child) {
				response.sendRedirect("errorpage.jsp?message="+child.getMessage()+"&url=AdminControl.jsp");
			}
		}
	
		
	}

}
