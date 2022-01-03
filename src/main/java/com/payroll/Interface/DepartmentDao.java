package com.payroll.Interface;



import java.util.List;

import com.payroll.model.Departments;

public interface DepartmentDao {
	public void insertDep(Departments dprt) ;
	public  int findDepartmentID(Departments dept);
	public void updateDept(int deptId,String deptName);
	public boolean deleteDept(int  deptId);
	public List<Departments> showDepartments();
	public Departments	findDepartment(int id);
	public Departments	findDepartment(String deptName);


}
