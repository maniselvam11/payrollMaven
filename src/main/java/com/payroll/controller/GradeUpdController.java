package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.GradeDaoImpl;
import com.payroll.model.Grade;

/**
 * Servlet implementation class GradeUpdController
 */
@WebServlet("/gradeUpd")
public class GradeUpdController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String gradeName=request.getParameter("name");
		long basic=Long.parseLong(request.getParameter("basic"));
		long bonus=Long.parseLong(request.getParameter("bonus"));
		long pf=Long.parseLong(request.getParameter("pf"));
		long pt=Long.parseLong(request.getParameter("pt"));
		GradeDaoImpl gradeDao=new GradeDaoImpl();
		Grade grade=gradeDao.findGrade(gradeName);
		int gradeId=gradeDao.findGradeID(grade);
		gradeDao.updateGrade(basic, bonus, pf, pt,gradeName);
		response.sendRedirect("GradeShow.jsp");

	}}
