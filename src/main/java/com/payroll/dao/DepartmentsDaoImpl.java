package com.payroll.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.payroll.Interface.DepartmentDao;
import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;

public class DepartmentsDaoImpl implements DepartmentDao{
	public void insertDep(Departments dprt) 
	
	{	
		String insertQuery="insert into departments  values (?,?,?)";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();
		try {
			
			int gradID=gradeDaoImpl.findGradeID(dprt.getGrd());

			PreparedStatement pstmt=con.prepareStatement(insertQuery);
			pstmt.setInt(1, dprt.getDeptId());
			pstmt.setString(2, dprt.getDeptName());
			pstmt.setInt(3,gradID);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		}
	
	
	public int findDepartmentID(Departments dept)
	{
		GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();

		int grdID=gradeDaoImpl.findGradeID(dept.getGrd());
		String findId="select dept_id from departments where dept_name = '"+dept.getDeptName()+"' and grade_id ="+grdID;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Statement stmt;
		int id = 0;
		try {
			stmt = con.createStatement();
			
			ResultSet rs=stmt.executeQuery(findId);
			while(rs.next()) {
				id=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return id;
	}
	public void updateDept(Departments depart)
	{
		String insertQuery = "update departments set dept_name=? where dept_id=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		PreparedStatement pstmt = null;
		try {

			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1,depart.getDeptName());
			pstmt.setLong(2, depart.getDeptId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			//catch the exception and get that message
			e.printStackTrace();
		}
	}
	public boolean deleteDept(int  deptId)
	{
		String deleteQuery = "delete from departments where dept_id=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		boolean result=false;
		PreparedStatement pstmt = null;
		try {
			

			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, deptId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Departments> showDepartments()
	{
		List<Departments> departmentList=new ArrayList<Departments>();
		
		String showQuery="select * from Departments";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();

		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(showQuery);
			while(rs.next())
			{
			 Grade grde=gradeDaoImpl.findGrade(rs.getInt(3));
				Departments department=new Departments(rs.getInt(1),rs.getString(2),grde);
				departmentList.add(department);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return departmentList;
	}
	public  Departments	findDepartment(int id)
	{
		String query="select * from departments where dept_id="+id;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();		
		Departments depart=null;
		GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()) {
				Grade grade=gradeDaoImpl.findGrade(rs.getInt(3));
				
				depart=new Departments(rs.getInt(1),rs.getString(2),grade);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return depart;
		
	}
	public  Departments	findDepartment(String deptName)
	{
		String query="select * from departments where dept_name= '"+deptName+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Departments depart=null;
		GradeDaoImpl gradeDaoImpl=new GradeDaoImpl();

//		int grdId=GradeDaoImpl.findGradeID(grade);
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()) {
//				System.out.println(rs.getInt(3));
				Grade grade=gradeDaoImpl.findGrade(rs.getInt(3));
				
				depart=new Departments(rs.getInt(1),rs.getString(2),grade);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return depart;
		
	}
	public List<Departments> searchDepartment(String deptName)
	{
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		String query="select * from departments where upper(DEPT_NAME) like '"+deptName.toUpperCase()+"%'";
		ResultSet rs=null;
		List<Departments> departmentList=new ArrayList<Departments>();

		try {
			PreparedStatement pstmt=con.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				GradeDaoImpl gradeDao=new GradeDaoImpl();
				Grade grade=gradeDao.findGrade(rs.getInt(3));
				Departments department=new Departments(rs.getInt(1),rs.getString(2),grade);
				departmentList.add(department);
			}
			
			return departmentList;
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return departmentList;
		
		
		}
	
	
	

}
