package com.payroll.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.payroll.model.Departments;
import com.payroll.model.Employee;
import com.payroll.model.Grade;

public class GradeDaoImpl {
	public boolean insertGrade(Grade grade) 
	{	boolean result=false;
		String insertQuery="insert into Grades (grade_name,grade_basic,grade_bonus,grade_pf,grade_pt) values (?,?,?,?,?)";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			PreparedStatement pstmt=con.prepareStatement(insertQuery);
			
			pstmt.setString(1, grade.getGradeName());
			pstmt.setLong(2, grade.getGradeBasic());
			pstmt.setLong(3, grade.getGradeBonus());
			pstmt.setLong(4, grade.getGradePf());
			pstmt.setLong(5, grade.getGradePt());
			
			pstmt.executeQuery();
			result=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
		
		}
	public  int findGradeID(Grade grade)
	{
		String findId="select grade_id from grades where grade_name= '"+grade.getGradeName()+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Statement stmt;
		int id = 0;
		try {
			stmt = con.createStatement();
			
			ResultSet rs=stmt.executeQuery(findId);
			if(rs.next()) {
				id=rs.getInt(1);
			}return id;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return id;
	}
	
	
	public boolean updateGrade(Grade grade)
	{
		String updateQuery = "update  grades set grade_basic=?,grade_bonus=?,grade_pf=?,grade_pt=?,grade_name=? where GRADE_ID=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		boolean result=false;
		PreparedStatement pstmt = null;
		try {

			pstmt = con.prepareStatement(updateQuery);
			pstmt.setLong(1,grade.getGradeBasic());
			pstmt.setLong(2, grade.getGradeBonus());
			pstmt.setLong(3, grade.getGradePf());
			pstmt.setLong(4, grade.getGradePt());
			pstmt.setString(5, grade.getGradeName());
			pstmt.setInt(6, grade.getGradeId());
			pstmt.executeUpdate();
			result=true;

		} catch (SQLException e) {
			//catch the exception and get that message
			e.printStackTrace();
		}
		return result;
	}
	public boolean deleteGrade(int  gradeId)
	{
		String deleteQuery = "delete from Grades where grade_id=?";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		boolean result=false;
		PreparedStatement pstmt = null;
		try {
			

			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, gradeId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			//catch the exception and get that message
			e.printStackTrace();
		}
		return result;
	}
	public List<Grade> showGrade()
	{
		List<Grade> gradeList=new ArrayList<Grade>();
		
		String showQuery="select * from grades";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(showQuery);
			while(rs.next())
			{
				Grade grade=new Grade( rs.getString(2), rs.getLong(3), rs.getLong(4),rs.getLong(5),rs.getLong(6));
				gradeList.add(grade);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gradeList;
	}
	public  Long grossSalary(String grdName) 
	{
		
		String qry="select (grade_basic + grade_pf) gross from grades where grade_name = '"+grdName+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Statement stmt;
		Long grossSalary=null;
		try {
			stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(qry);
			if(rs.next()) {
				grossSalary=rs.getLong(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return grossSalary;
		
	}
	
	public  Grade findGrade(int gradeId) 
	{
		String qry="select * from grades where grade_id="+gradeId;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Grade grd=null;
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(qry);
			while(rs.next()) {
				 grd=new Grade(rs.getString(2),rs.getLong(3),rs.getLong(4),rs.getLong(5),rs.getLong(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return grd;
		
	}
	public  Grade findGrade(String gradeName) 
	{
		
		String qry="select * from grades where grade_name = '"+gradeName+"'";
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		Grade grd=null;
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(qry);
			while(rs.next()) {
				 grd=new Grade(rs.getString(2),rs.getLong(3),rs.getLong(4),rs.getLong(5),rs.getLong(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return grd;
		
	}
	public  long perDaySalary(String gradeName) 
	{
		String query="select (grade_basic/30)perDaySalary from grades where grade_name = '"+gradeName+"'";
		long perDaySalary=0;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				perDaySalary=rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return perDaySalary ;
	}
	public  long basicSalary(String gradeName) 
	{
		String query="select grade_basic from grades where grade_name = '"+gradeName+"'";
		long basicSalary=0;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				basicSalary=rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return basicSalary ;
	}
	public  long bonus(String gradeName) {
		String query="select grade_bonus from grades where grade_name = '"+gradeName+"'";
		long gradeBonus=0;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				gradeBonus=rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gradeBonus ;
	}
	public  long providentFund(String gradeName) {
		String query="select grade_pf from grades where grade_name = '"+gradeName+"'";
		long providentFund=0;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				providentFund=rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return providentFund ;
	}
	public  long professionalTax(String gradeName) {
		String query="select grade_pt from grades where grade_name = '"+gradeName+"'";
		long professionalTax=0;
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		try {
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				professionalTax=rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return professionalTax ;
	}
	public List<Grade> searchGrade(String grdName)
	{
		ConnectionUtilImpl connection=new ConnectionUtilImpl();
		Connection con=connection.dbConnect();
		String query="select * from grades where upper(GRADE_NAME) like '"+grdName.toUpperCase()+"%'";
		ResultSet rs=null;
		List<Grade> gradeList=new ArrayList<Grade>();

		try {
			PreparedStatement pstmt=con.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Grade grade=new Grade(rs.getInt(1),rs.getString(2),rs.getLong(3),rs.getLong(4),rs.getLong(5),rs.getLong(6));
				gradeList.add(grade);
			}
			
			return gradeList;
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return gradeList;
		
		
		}
	
}
