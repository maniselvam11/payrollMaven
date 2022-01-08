package com.payroll.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;
import com.payroll.model.Leave;

public class LeaveDaoImpl {
	public boolean insertLeave(Leave leave) {
		String query="insert into leave_details (emp_id,leave_date,reason) values (?,?,?)";
//		System.out.println(query);
		boolean result=false;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();
		try {
			PreparedStatement pstmt=con.prepareStatement(query);
			int empId=employeeDaoImpl.findEmployeeID(leave.getEmploy());
			pstmt.setInt(1, empId);
			pstmt.setDate(2, new java.sql.Date(leave.getLeaveDt().getTime()));
			pstmt.setString(3, leave.getLeaveReason());
			pstmt.executeUpdate();
			result=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
		
	}
	
	public List<Leave> showLeaveDetail()
	{
		List<Leave> leaveList=new ArrayList<Leave>();
		
		String showQuery="select * from leave_details";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();

		Connection con=connection.dbConnect();
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(showQuery);
			while(rs.next())
			{
				System.out.println(rs.getInt(2));
				Employee employ=employeeDaoImpl.findEmployee(rs.getInt(2));
				System.out.println(employ);
				
				Leave leave=new Leave(employ,rs.getDate(3),rs.getString(4));
				leaveList.add(leave);
				System.out.println(leave.getEmploy().getEmpId());
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return leaveList;
	}
	public  int findLeaveID(Leave leave)
	
	{	
		
		EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();

		int empID=employeeDaoImpl.findEmployeeID(leave.getEmploy());
		
		String findId="select leave_id from leave_details where EMP_ID = ? and leave_date = ? ";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		//		Statement stmt;
		int id = 0;
		try {
//			stmt = con.createStatement();
			PreparedStatement pstmt=con.prepareStatement(findId);
			pstmt.setInt(1, empID);
			pstmt.setDate(2, new java.sql.Date(leave.getLeaveDt().getTime()));
			
			//pstmt.executeQuery();
			
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				id=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return id;
	}
	public  Leave findLeave(Date leaveDt,int empId) {
		
//		String qry="select * from leave_details where LEAVE_DATE = to_date('"+leaveDt+"','dd-MM-yyyy') and emp_id ="+empId;
		String qry="select * from leave_details where LEAVE_DATE = ? and emp_id =  ?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		
		Leave leave=null;
		try {
//			Statement stmt=con.createStatement();
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setDate(1, new java.sql.Date(leaveDt.getTime()));
			EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();

			pstmt.setInt(2, empId); 
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Employee emp=employeeDaoImpl.findEmployee(rs.getInt(2));
//				System.out.println(emp);
				 leave=new Leave(emp,rs.getDate(3),rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return leave;
		
	}
	public  int leaveDays(int empID) {
	String query="select count(leave_id) as leave_count from leave_details where emp_id="+empID +"group by emp_id";
	ConnectionUtilImpl connection=new ConnectionUtilImpl();
	Connection con=connection.dbConnect();
	int count=0;

	try {
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		if(rs.next()) {
			count=rs.getInt(1);
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return count;
		
	}
public  Leave findLeave(int leaveId) {
		
		String qry="select * from Leave_details where leave_id = "+leaveId;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();

		Leave leave=null;
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(qry);
			while(rs.next()) {
				Employee emp=employeeDaoImpl.findEmployee(rs.getInt(2));
				 leave=new Leave(emp,rs.getDate(3),rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return leave;
		
	}


	

}
