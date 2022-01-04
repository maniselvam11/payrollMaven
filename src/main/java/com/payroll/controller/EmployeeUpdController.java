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
import com.payroll.model.Employee;
@WebServlet("/empUpdate")
public class EmployeeUpdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EmployeeUpdController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		Date dob=null;
		Date doj=null;
		try {
			dob=new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("doj"));
			doj=new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("doj"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		long pincode=Long.parseLong(request.getParameter("pincode"));
		long mobileNo=Long.parseLong(request.getParameter("mobile"));
		String state=request.getParameter("state");
		String email=request.getParameter("email");
		String panNo=request.getParameter("pan");
		EmployeeDaoImpl employ=new EmployeeDaoImpl();
		Employee emp=new Employee(name,dob,doj,address,city,pincode,mobileNo,state,email,panNo,null);
		employ.updateEmp(emp);
		response.sendRedirect("empShow.jsp");
		
		
		
		

	}

}
