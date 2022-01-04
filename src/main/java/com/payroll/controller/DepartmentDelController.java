package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.DepartmentsDaoImpl;

/**
 * Servlet implementation class DepartmentDelController
 */
@WebServlet("/departDel")
public class DepartmentDelController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int departId=Integer.parseInt(request.getParameter("deptId"));
		DepartmentsDaoImpl departmentDao=new DepartmentsDaoImpl();
		departmentDao.deleteDept(departId);
		response.sendRedirect("DepartShow.jsp");
	}

}
