package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.DepartmentsDaoImpl;
import com.payroll.model.Departments;

/**
 * Servlet implementation class DepartmentUpdController
 */
@WebServlet("/departUpd")
public class DepartmentUpdController extends HttpServlet {
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		DepartmentsDaoImpl department=new DepartmentsDaoImpl();
		int departmentId=Integer.parseInt(request.getParameter("departId"));
		 Departments deprt=department.findDepartment(departmentId);
		department.updateDept(deprt);
		response.sendRedirect("DepartShow.jsp");
		
		
	}

}
