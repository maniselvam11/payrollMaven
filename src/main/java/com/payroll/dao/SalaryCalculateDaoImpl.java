package com.payroll.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.payroll.model.Departments;
import com.payroll.model.EmpSalary;
import com.payroll.model.Employee;
import com.payroll.model.Grade;
import com.payroll.model.Leave;

public class SalaryCalculateDaoImpl {

		public  boolean insertSalary(Employee emp,Grade grade,Departments department,int noOfLeave,Date salaryDt,long grossSalary,long totalSalary) {
			boolean result=false;
			EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();
			DepartmentsDaoImpl departmentDao=new DepartmentsDaoImpl();
			int empID=employeeDaoImpl.findEmployeeID(emp);
			int deptID=departmentDao.findDepartmentID(department);
			GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();
			int gradeID=gradeDaoImpl.findGradeID(grade);
			LeaveDaoImpl leaveDaoImpl=new LeaveDaoImpl();
			
			String query="insert into salarys (EMP_ID,DEPT_ID,TOTAL_LEAVE,GRADE_ID,PAID_DATE,GROSS_SALARY,TOTAL_SALARY) values(?,?,?,?,?,?,?)";
			ConnectionUtilImpl connection=new ConnectionUtilImpl();
			Connection con=connection.dbConnect();
			try {
				PreparedStatement pstmt=con.prepareStatement(query);
				pstmt.setInt(1, empID);
				pstmt.setInt(2, deptID);
				pstmt.setInt(3, noOfLeave);
				pstmt.setInt(4, gradeID);
				pstmt.setDate(5, new java.sql.Date(salaryDt.getTime()));
				pstmt.setLong(6, grossSalary);
				pstmt.setLong(7, totalSalary);
				pstmt.executeQuery();
				result=true;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
			
		}
		public void updateSalary(int transId,long basic)
		{
		
			String insertQuery = "update employees set ="+basic+" where trans_id="+transId;
			ConnectionUtilImpl connection=new ConnectionUtilImpl();
			Connection con=connection.dbConnect();
			try {

				Statement stmt=con.createStatement();
				stmt.executeUpdate(insertQuery);
				System.out.println("Employee Updated Successfully");
			} catch (SQLException e) {
				//catch the exception and get that message
				e.printStackTrace();
				System.out.println("Employee not updated properly");
			}
			
		}
		public List<EmpSalary> showEmployee()
		{
			List<EmpSalary> salaryList=new ArrayList<EmpSalary>();
			
			String showQuery="select * from salarys ";
			ConnectionUtilImpl connection=new ConnectionUtilImpl();
			Connection con=connection.dbConnect();
			EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();

			try {
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(showQuery);
				while(rs.next())
				{
					
					Employee employ=employeeDaoImpl.findEmployee(rs.getInt(2));
					DepartmentsDaoImpl departmentDao=new DepartmentsDaoImpl();
					GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();
					LeaveDaoImpl leaveDaoImpl=new LeaveDaoImpl();
					Departments department=departmentDao.findDepartment(rs.getInt(3));
					Grade grade=gradeDaoImpl.findGrade(rs.getInt(5));
					
					EmpSalary empSalary=new EmpSalary(employ,department,rs.getInt(4),grade,new java.sql.Date(rs.getDate(6).getTime()),rs.getLong(7),rs.getLong(8));
					salaryList.add(empSalary);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return salaryList;
		}
		public EmpSalary salaryDetail(int empId) {
			String query="select * from salarys where EMP_ID=?";
			ConnectionUtilImpl connection=new ConnectionUtilImpl();
			Connection con=connection.dbConnect();
			EmpSalary salary=null;
			try {
				PreparedStatement pstmt=con.prepareStatement(query);
				pstmt.setInt(1, empId);
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				while(rs.next()) {
					EmployeeDaoImpl empDao=new EmployeeDaoImpl();
					
					Employee emp=empDao.findEmployee(rs.getInt(2));
					GradeDaoImpl gradeDao=new GradeDaoImpl();
					Grade grade=gradeDao.findGrade(rs.getInt(5));
					DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
					Departments department=departDao.findDepartment(rs.getInt(3));
					
					salary=new EmpSalary(emp,department,rs.getInt(4),grade,new java.sql.Date(rs.getDate(6).getTime()),rs.getLong(7),rs.getLong(8));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return salary;
			
			}
		
	
	}



