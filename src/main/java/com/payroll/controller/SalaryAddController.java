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
import javax.servlet.http.HttpSession;

import com.payroll.dao.DepartmentsDaoImpl;
import com.payroll.dao.EmployeeDaoImpl;
import com.payroll.dao.GradeDaoImpl;
import com.payroll.dao.LeaveDaoImpl;
import com.payroll.dao.SalaryCalculateDaoImpl;
import com.payroll.exception.SalaryInvalidException;
import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;

@WebServlet("/salaryInsert")
public class SalaryAddController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		int empID = Integer.parseInt(request.getParameter("eId"));
		String gradeName = request.getParameter("gName");
		String deptName = request.getParameter("dName");
		String selectTax = request.getParameter("tax");
		String selectBonus = request.getParameter("bonus");
		Date salaryDate = null;
		try {
			salaryDate = sdf.parse(request.getParameter("salDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EmployeeDaoImpl empDao = new EmployeeDaoImpl();
		Employee emp = empDao.findEmployee(empID);

		GradeDaoImpl gradeDao = new GradeDaoImpl();
		Grade grade = gradeDao.findGrade(gradeName);

		DepartmentsDaoImpl departDao = new DepartmentsDaoImpl();
		Departments depart = departDao.findDepartment(deptName);

		LeaveDaoImpl leaveDao = new LeaveDaoImpl();
		int leaveDays = leaveDao.leaveDays(empID);
		Date salaryDt = null;
		try {
			salaryDt = sdf.parse(request.getParameter("salDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pfCheck = request.getParameter("tax");
		String monthBonus = request.getParameter("monthBonus");

		long grossSalary = gradeDao.grossSalary(gradeName);
		long perDaySalary = gradeDao.perDaySalary(gradeName);
		long basicSalary = gradeDao.basicSalary(gradeName);
		long bonus = gradeDao.bonus(gradeName);
		long pt = gradeDao.professionalTax(gradeName);
		long pf = gradeDao.providentFund(gradeName);
		SalaryCalculateDaoImpl salaryCal = new SalaryCalculateDaoImpl();

		if (selectTax.equals("yes")) {
			if (selectBonus.equals("yes")) {
				long salaryBonus = (((basicSalary + bonus + pt) - (leaveDays * perDaySalary)) - pf);
				boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, salaryDt, grossSalary,
						salaryBonus);
				try {
					if (result != false) {

						response.sendRedirect("Salary.jsp");
					} else {
						throw new SalaryInvalidException();
					}
				} catch (SalaryInvalidException e) {
					HttpSession session = request.getSession();
					session.setAttribute("salaryInvalid", e.getMessage());
					response.sendRedirect("SalaryAdd.jsp");
				}
			} else {
				long salary = (((basicSalary + pt) - (leaveDays * perDaySalary)) - pf);
				boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, salaryDt, grossSalary, salary);
				try {
					if (result != false) {
						response.sendRedirect("Salary.jsp");
					} else {
						throw new SalaryInvalidException();
					}
				} catch (SalaryInvalidException e) {
					HttpSession session = request.getSession();
					session.setAttribute("salaryInvalid", e.getMessage());
					response.sendRedirect("SalaryAdd.jsp");
				}
			}

		} else {
			if (selectBonus.equals("yes")) {
				long salaryBonus = (((basicSalary + bonus + pt) - (leaveDays * perDaySalary)));

				boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, salaryDt, grossSalary,
						salaryBonus);
				try {

					if (result != false) {
						response.sendRedirect("Salary.jsp");
					} else {
						throw new SalaryInvalidException();

					}
				} catch (SalaryInvalidException e) {
					HttpSession session = request.getSession();
					session.setAttribute("salaryInvalid", e.getMessage());
					response.sendRedirect("SalaryAdd.jsp");
				}
			} 
			else {
				long salary = (((basicSalary + pt) - (leaveDays * perDaySalary)));

				boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, salaryDt, grossSalary, salary);
				try {

					if (result == true) {
						response.sendRedirect("Salary.jsp");
					} else {
						throw new SalaryInvalidException();
					}
				} catch (SalaryInvalidException e) {
					HttpSession session = request.getSession();
					session.setAttribute("salaryInvalid", e.getMessage());
					response.sendRedirect("SalaryAdd.jsp");
				}

			}

		}

	}

}
