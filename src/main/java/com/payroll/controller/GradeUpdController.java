package com.payroll.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.dao.GradeDaoImpl;
import com.payroll.exception.EmployeeDelException;
import com.payroll.exception.InvalidAmount;
import com.payroll.model.Grade;

@WebServlet("/gradeUpd")
public class GradeUpdController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String gradeName=request.getParameter("name");
		long basic=Long.parseLong(request.getParameter("basic"));
		long bonus=Long.parseLong(request.getParameter("bonus"));
		long pf=Long.parseLong(request.getParameter("pf"));
		long pt=Long.parseLong(request.getParameter("pt"));
        HttpSession session=request.getSession();
		int gradeId=(Integer)session.getAttribute("gradeId");
		Grade grade=new Grade(gradeId,gradeName,basic,bonus,pf,pt);
		GradeDaoImpl gradeDao=new GradeDaoImpl();
		try {
		if((basic>0)&&(bonus>0)&&(pf>0)&&(pt>0)) {
			boolean flag=gradeDao.updateGrade(grade);

			if(flag!=false) {
				response.sendRedirect("GradeShow.jsp");
			}
			else {
				response.sendRedirect("Grade.jsp");
			}
			
		}
		else {
			throw new InvalidAmount();
		}
		}
		catch(InvalidAmount e) {
			session.setAttribute("negativeValue", e.getMessage());
			response.sendRedirect("GradeUpd.jsp");
			
			
		}
		

	}
	}
