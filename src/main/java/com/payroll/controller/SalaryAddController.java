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

import com.payroll.dao.DepartmentsDaoImpl;
import com.payroll.dao.EmployeeDaoImpl;
import com.payroll.dao.GradeDaoImpl;
import com.payroll.dao.LeaveDaoImpl;
import com.payroll.dao.SalaryCalculateDaoImpl;
import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;
@WebServlet("\salaryInsert")
public class SalaryAddController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		
		int empID=Integer.parseInt(request.getParameter("eId"));
		String gradeName=request.getParameter("gName");
		String deptName=request.getParameter("dName");
		Date salaryDate=null;
		try {
			salaryDate=sdf.parse(request.getParameter("salDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EmployeeDaoImpl empDao=new EmployeeDaoImpl();
		Employee emp=empDao.findEmployee(empID);
		
		GradeDaoImpl gradeDao=new GradeDaoImpl();
		Grade grade=gradeDao.findGrade(gradeName);
		
		DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
		Departments depart=departDao.findDepartment(deptName);
		
		LeaveDaoImpl leaveDao=new LeaveDaoImpl();
		int leaveDays=leaveDao.leaveDays(empID);
		Date salaryDt=null;
		try {
			salaryDt=sdf.parse(request.getParameter("salDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pfCheck=request.getParameter("tax");
		String monthBonus=request.getParameter("monthBonus");
		System.out.println(pfCheck);
		System.out.println(monthBonus);
		long grossSalary = gradeDao.grossSalary(gradeName);
		long perDaySalary = gradeDao.perDaySalary(gradeName);
//		System.out.println("PerDay Salary " + perDaySalary);
		long basicSalary = gradeDao.basicSalary(gradeName);
//		System.out.println("Basic Salary " + basicSalary);
		long bonus = gradeDao.bonus(gradeName);
		long pt = gradeDao.professionalTax(gradeName);
		long pf = gradeDao.providentFund(gradeName);
		long salary = (((basicSalary + pt) - (leaveDays * perDaySalary)) - pf);
		SalaryCalculateDaoImpl salaryCal = new SalaryCalculateDaoImpl();
		boolean result=salaryCal.insertSalary(emp, grade, depart, leaveDays, salaryDt, grossSalary, salary);
		if(result) {
			
		}
	}

}
