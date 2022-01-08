package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.dao.DepartmentsDaoImpl;
import com.payroll.model.Departments;

/**
 * Servlet implementation class DepartmentUpdController
 */
@WebServlet("/deptUpd")
public class DepartmentUpdController extends HttpServlet {
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		DepartmentsDaoImpl department=new DepartmentsDaoImpl();
		String departName=request.getParameter("name");
		HttpSession session=request.getSession();
		int deptID=Integer.parseInt(session.getAttribute("editDeptId").toString());
		Departments deprt=department.findDepartment(deptID);
		deprt.setDeptName(departName);
		department.updateDept(deprt);
		response.sendRedirect("DepartShow.jsp");
		
		
	}

}
