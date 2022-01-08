package com.payroll.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.payroll.Interface.EmployeeDao;
import com.payroll.exception.EmployeeDelException;
import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;

public class EmployeeDaoImpl implements EmployeeDao{
	public  boolean insertEmp(Employee emp)
	{
		boolean result=false;
		String insertQuery="insert into employees (emp_name,emp_dob,emp_doj,emp_address,emp_city,emp_pincode,emp_mobile_no,"
				+ "emp_state,emp_email_id,emp_pan_no,dept_id) values (?,?,?,?,?,?,?,?,?,?,?)";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			PreparedStatement pstmt=con.prepareStatement(insertQuery);
			
			pstmt.setString(1, emp.getEmpName());
			pstmt.setDate(2,new java.sql.Date(emp.getDob().getTime()));
			pstmt.setDate(3, new java.sql.Date(emp.getDoj().getTime()));
			pstmt.setString(4, emp.getAddress());
			pstmt.setString(5, emp.getCity());
			pstmt.setLong(6,emp.getPincode());
			pstmt.setLong(7,emp.getMobileNo());
			pstmt.setString(8, emp.getState());
			pstmt.setString(9, emp.getMailId());
			pstmt.setString(10,emp.getPanNo());
			pstmt.setInt(11, emp.getDept().getDeptId());
			result=pstmt.executeUpdate()>0;
			System.out.println(result);
//			System.out.println(pstmt.executeUpdate()>0?"value inserted successfully":"value not inserted");
			//result=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			result=false;
		}
		return result ;
		
		
		}
	public  Employee findEmployee(int empId)
	{
		String findEmployeeQuery="select * from employees where emp_id=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Employee employee=null;
		DepartmentsDaoImpl deptDao=new DepartmentsDaoImpl();
	try {
		PreparedStatement pstmt=con.prepareStatement(findEmployeeQuery);
		pstmt.setInt(1, empId);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			Departments dept=deptDao.findDepartment(rs.getInt(12));
			employee=new Employee(rs.getString(2),rs.getDate(3),rs.getDate(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getLong(8),rs.getString(9),rs.getString(10),rs.getString(11),dept);
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
		return employee;
	}
	
	public void updateEmp(Employee employ)
	{
	
		String insertQuery = "update employees set EMP_NAME=?,EMP_DOB=?,EMP_DOJ=?,EMP_ADDRESS=?,EMP_CITY=?,EMP_PINCODE=?,EMP_MOBILE_NO=?,EMP_STATE=?,EMP_EMAIL_ID=?,,EMP_PAN_NO=? where emp_id= ?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {

			PreparedStatement pstmt=con.prepareStatement(insertQuery);
			pstmt.setString(1, employ.getEmpName());
			pstmt.setDate(2, new java.sql.Date(employ.getDob().getTime()));
			pstmt.setDate(3, new java.sql.Date(employ.getDoj().getTime()));
			pstmt.setString(4, employ.getAddress());
			pstmt.setString(5, employ.getCity());
			pstmt.setLong(6, employ.getPincode());
			pstmt.setLong(7, employ.getMobileNo());
			pstmt.setString(8, employ.getState());
			pstmt.setString(9, employ.getMailId());
			pstmt.setString(10, employ.getPanNo());
			pstmt.setInt(11, employ.getEmpId());
			int i=pstmt.executeUpdate();
			
			
//			System.out.println(stmt.executeUpdate(insertQuery)>0?"Employee Updated Successfully":"employee not updated");
		} catch (SQLException e) {
			//catch the exception and get that message
			e.printStackTrace();
//			System.out.println("Employee not updated properly");
		}
		
	}
	
	
	public int deleteEmp(int  empId)
	{
		String deleteQuery = "delete from employees where EMP_ID=?";
		
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		int i = 0;
		try {
			PreparedStatement pstmt=con.prepareStatement(deleteQuery);
			pstmt.setInt(1, empId);
			i=pstmt.executeUpdate();
			

		}
		 catch (Exception e) {
			//catch the exception and get that message
//			 e.printStackTrace();
			 System.out.println(e.getMessage());
		}
		return i;
		
	}
	
	
	public int findEmployeeID(Employee emp)
	{
		String findId="select emp_id from employees where emp_email_id= '"+emp.getMailId()+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Statement stmt;
		int id = 0;
		try {
			stmt = con.createStatement();
			
			ResultSet rs=stmt.executeQuery(findId);
			if(rs.next()) {
				id=rs.getInt(1);
				return id;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return id;
	}
	

	public List<Employee> showEmployee()
	{
		List<Employee> employeeList=new ArrayList<Employee>();
		
		String showQuery="select * from employees where status = 'active' ";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		DepartmentsDaoImpl deptDao=new DepartmentsDaoImpl();

		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(showQuery);
			while(rs.next())
			{
				Departments depart=deptDao.findDepartment(rs.getInt(12));
				Employee employee=new Employee(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getDate(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getLong(8),rs.getString(9),rs.getString(10),rs.getString(11),depart);
				employeeList.add(employee);
//				System.out.println(rs.getDate(3));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		System.out.println(employeeList);

		return employeeList;
	}
	public List<Employee> showInactiveEmployee()
	{
		List<Employee> employeeList=new ArrayList<Employee>();
		
		String showQuery="select * from employees where status= 'inactive' ";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		DepartmentsDaoImpl deptDao=new DepartmentsDaoImpl();

		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(showQuery);
			while(rs.next())
			{
				Departments depart=deptDao.findDepartment(rs.getInt(12));
				Employee employee=new Employee(rs.getString(2),rs.getDate(3),rs.getDate(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getLong(8),rs.getString(9),rs.getString(10),rs.getString(11),depart);
				employeeList.add(employee);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return employeeList;
	}
	public Employee findEmploy(String email)
	{
		String findEmployeeQuery="select * from employees where EMP_EMAIL_ID=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		DepartmentsDaoImpl deptDao=new DepartmentsDaoImpl();

		Employee employee=null;
	try {
		PreparedStatement pstmt=con.prepareStatement(findEmployeeQuery);
		pstmt.setString(1, email);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			Departments dept=deptDao.findDepartment(rs.getInt(12));
			employee=new Employee(rs.getString(2),rs.getDate(3),rs.getDate(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getLong(8),rs.getString(9),rs.getString(10),rs.getString(11),dept);
		}
		
	} catch (SQLException e) {
		
		e.getMessage();
	}
		return employee;
	}
	
	
	public void deleteEmp(String email)
	{
		String deleteQuery = "delete from employees where EMP_EMAIL_ID='"+email+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			Statement stmt=con.createStatement();
			stmt.executeUpdate(deleteQuery);
			
			
//			System.out.println("employee details are deleted successfully");

		} catch (Exception e) {
			//catch the exception and get that message
			e.getMessage();
//			System.out.println("employee details are not deleted ");
		}
	}
	
	
	
}
