package com.payroll.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

		int empID = Integer.parseInt(request.getParameter("empId"));
		String gradeName = request.getParameter("gName");
		String deptName = request.getParameter("dName");
		String selectTax = request.getParameter("tax");
		String selectBonus = request.getParameter("bonus");
		

		EmployeeDaoImpl empDao = new EmployeeDaoImpl();
		Employee emp = empDao.findEmployee(empID);

		GradeDaoImpl gradeDao = new GradeDaoImpl();
		Grade grade = gradeDao.findGrade(gradeName);

		DepartmentsDaoImpl departDao = new DepartmentsDaoImpl();
		Departments depart = departDao.findDepartment(deptName);

		LeaveDaoImpl leaveDao = new LeaveDaoImpl();
		int leaveDays = leaveDao.leaveDays(empID);
		String pfCheck = request.getParameter("tax");
		String monthBonus = request.getParameter("monthBonus");

		long grossSalary = gradeDao.grossSalary(gradeName);
		long perDaySalary = gradeDao.perDaySalary(gradeName);
		long basicSalary = gradeDao.basicSalary(gradeName);
		long bonus = gradeDao.bonus(gradeName);
		long pt = gradeDao.professionalTax(gradeName);
		long pf = gradeDao.providentFund(gradeName);
		SalaryCalculateDaoImpl salaryCal = new SalaryCalculateDaoImpl();

		Date salaryDt = salaryCal.salaryNxtMonth(empID);
		String status = empDao.employStatus(empID);

		Date todayDate = empDao.todayDate();
		try {
			
		if(salaryDt==null) {
			salaryDt=todayDate;
		}
		if (todayDate.compareTo(salaryDt) == 0)  {
			if (status.equals("active")) {
				if (selectTax.equals("yes")) {
					if (selectBonus.equals("yes")) {
						long salaryBonus = (((grossSalary + bonus) - (leaveDays * perDaySalary)) - pt);
						boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, grossSalary,
								salaryBonus);
						try {
							if (result != false) {

								PrintWriter out = response.getWriter();
								out.println("<script type=\"text/javascript\">");
								out.println("alert('Salary Added Successfully');");
								out.println("location='AdminControl.jsp';");
								out.println("</script>");
							} else {
								throw new SalaryInvalidException();
							}
						} catch (SalaryInvalidException e) {
							HttpSession session = request.getSession();
							session.setAttribute("salaryInvalid", e.getMessage());
							response.sendRedirect("SalaryAdd.jsp");

						}
					} else {
						long salary = (((grossSalary) - (leaveDays * perDaySalary)) - pt);
						boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, grossSalary, salary);
						try {
							if (result != false) {
								PrintWriter out = response.getWriter();
								out.println("<script type=\"text/javascript\">");
								out.println("alert('Salary Added Successfully');");
								out.println("location='AdminControl.jsp';");
								out.println("</script>");
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
						long salaryBonus = (((grossSalary + bonus) - (leaveDays * perDaySalary)));

						boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, grossSalary,
								salaryBonus);
						try {

							if (result != false) {
								PrintWriter out = response.getWriter();
								out.println("<script type=\"text/javascript\">");
								out.println("alert('Salary Added Successfully');");
								out.println("location='AdminControl.jsp';");
								out.println("</script>");
							} else {
								throw new SalaryInvalidException();

							}
						} catch (SalaryInvalidException e) {
							HttpSession session = request.getSession();
							session.setAttribute("salaryInvalid", e.getMessage());
							response.sendRedirect("SalaryAdd.jsp");
						}
					} else {
						long salary = (((grossSalary) - (leaveDays * perDaySalary)));

						boolean result = salaryCal.insertSalary(emp, grade, depart, leaveDays, grossSalary, salary);
						try {

							if (result == true) {
								PrintWriter out = response.getWriter();
								out.println("<script type=\"text/javascript\">");
								out.println("alert('Salary Added Successfully');");
								out.println("location='AdminControl.jsp';");
								out.println("</script>");

							}

							else {
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
			else {
				throw new SalaryInvalidException();
			}

		} 
		else {
			throw new SalaryInvalidException();
		}}
		catch(SalaryInvalidException e) {
			HttpSession session=request.getSession();
			session.setAttribute("invalidSal", e.getSalMessage());
			response.sendRedirect("SalaryAdd.jsp");
		}

	}

}
