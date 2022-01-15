package com.payroll.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.dao.DepartmentsDaoImpl;
import com.payroll.dao.EmployeeDaoImpl;
import com.payroll.exception.EmployeeDelException;
import com.payroll.model.Departments;
import com.payroll.model.Employee;

@WebServlet("/empAdd")
public class EmployeeAddController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String name=request.getParameter("EmployeeName");
		Date dob=null;
		Date doj=null;
		try {
			 dob=sdf.parse(request.getParameter("dob"));
			 doj=sdf.parse(request.getParameter("doj"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		long pincode=Long.parseLong(request.getParameter("pincode"));
		long mobileNumber=Long.parseLong(request.getParameter("mobileNumber"));
		String state=request.getParameter("state");
		String mailId=request.getParameter("mailId");
		String panNo=request.getParameter("panNo");
		String deptName=request.getParameter("deptName");
		DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
		Departments depart=departDao.findDepartment(deptName);
//		System.out.println(name+dob+doj+address+city+pincode+mobileNumber+state+mailId+panNo+deptName);
		Employee employ=new Employee(name,dob,doj,address,city,pincode,mobileNumber,state,mailId,panNo,depart);
		EmployeeDaoImpl employDao=new EmployeeDaoImpl();
		boolean empResult=employDao.insertEmp(employ);
		try {
			
		if(empResult!=false) {
			PrintWriter out =response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Employee Added Successfully');");
			out.println("location='AdminControl.jsp';");
			out.println("</script>");
		}
		else{
			throw new EmployeeDelException(); 
			
		}}
		catch(EmployeeDelException e) {
			HttpSession session=request.getSession();
			session.setAttribute("employInvalid", e.getEmployAdd());
			response.sendRedirect("EmployAdd.jsp");
			
		}
		
	}

}
