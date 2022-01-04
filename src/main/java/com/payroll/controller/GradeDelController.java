package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.GradeDaoImpl;
@WebServlet("/GradeDelController")
public class GradeDelController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 GradeDaoImpl gradeDao=new GradeDaoImpl();
		int gradeId=Integer.parseInt(request.getParameter("gradeId"));
		gradeDao.deleteGrade(gradeId);
		response.sendRedirect("GradeShow.jsp");
		}

}
