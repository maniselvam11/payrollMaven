package com.payroll.model;

import java.util.Objects;

public class Grade {
	private int gradeId;
	
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	private String gradeName;
	private long gradeBonus;
	private long gradeBasic;
	private long gradePf;
	private long gradePt;

	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public long getGradeBonus() {
		return gradeBonus;
	}
	public void setGradeBonus(long gradeBonus) {
		this.gradeBonus = gradeBonus;
	}
	public long getGradeBasic() {
		return gradeBasic;
	}
	public void setGradeBasic(long gradeBasic) {
		this.gradeBasic = gradeBasic;
	}
	public long getGradePf() {
		return gradePf;
	}
	public void setGradePf(long gradePf) {
		this.gradePf = gradePf;
	}
	public long getGradePt() {
		return gradePt;
	}
	public void setGradePt(long gradePt) {
		this.gradePt = gradePt;
	}
	public Grade( int gradeId,String gradeName, long gradeBonus, long gradeBasic, long gradePf, long gradePt) {
		super();
		this.gradeId=gradeId;
		this.gradeName = gradeName;
		this.gradeBonus = gradeBonus;
		this.gradeBasic = gradeBasic;
		this.gradePf = gradePf;
		this.gradePt = gradePt;
	}
	public Grade(String gradeName2, long basic, long bonus, long pf, long pt) {
		
		super();
		this.gradeName = gradeName2;
		this.gradeBonus = basic;
		this.gradeBasic = bonus;
		this.gradePf = pf;
		this.gradePt = pt;
	}

	@Override
	public int hashCode() {
		return Objects.hash(gradeBasic, gradeBonus, gradeName, gradePf, gradePt);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Grade other = (Grade) obj;
		return gradeBasic == other.gradeBasic && gradeBonus == other.gradeBonus 
				&& Objects.equals(gradeName, other.gradeName) && gradePf == other.gradePf
				&& gradePt == other.gradePt;
	}
	@Override
	public String toString() {
		return "GradeName = " + gradeName + "\n gradeBonus = " + gradeBonus
				+ "\n gradeBasic=" + gradeBasic + "\n gradePf=" + gradePf + "\n gradePt=" + gradePt + "\n";
	}
	
}
