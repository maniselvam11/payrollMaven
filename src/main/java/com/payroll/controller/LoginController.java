package com.payroll.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.dao.AdminDaoImpl;
import com.payroll.model.Admin;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);

		
		String mail=request.getParameter("email");
		String password=request.getParameter("pass");
		Admin admin=new Admin(mail,password);
		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
		boolean adminFlag=adminDaoImpl.validateAdmin(admin);
		try {
			if(adminFlag){
				response.sendRedirect("AdminControl.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
		}
		catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		
	
	}

}
