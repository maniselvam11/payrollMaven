package com.payroll.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.EmployeeDaoImpl;
import com.payroll.dao.LeaveDaoImpl;
import com.payroll.model.Employee;
import com.payroll.model.Leave;
@WebServlet("/LeaveAdd")
public class LeaveAddController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int empId=Integer.parseInt(request.getParameter("empId"));
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");

		EmployeeDaoImpl employeeDao=new EmployeeDaoImpl();
		Employee employ=employeeDao.findEmployee(empId);
		Date leaveDt=null;
		try {
			leaveDt= sdf.parse(request.getParameter("lDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String reason=request.getParameter("reason");
		Leave leave=new Leave(employ,leaveDt,reason);
		LeaveDaoImpl leaveDao=new LeaveDaoImpl();
		leaveDao.insertLeave(leave);
		response.sendRedirect("AdminControl.jsp");
			
		}
	
}
