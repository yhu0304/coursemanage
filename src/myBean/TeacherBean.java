package myBean;

import java.io.Serializable;
import java.sql.Date;

public class TeacherBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String tid;
	public String tpassword;
	public String tname;
	public String tsex;
	public Date tbirth;
	public int tage;
	public String ttel;
	public String temail;
	public String tjob;
	public Date getTbirth() {
		return tbirth;
	}
	public void setTbirth(Date tbirth) {
		this.tbirth = tbirth;
	}
	public int getTage() {
		return tage;
	}
	public void setTage(int tage) {
		this.tage = tage;
	}
	public String getTtel() {
		return ttel;
	}
	public void setTtel(String ttel) {
		this.ttel = ttel;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTpassword() {
		return tpassword;
	}
	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public String getTjob() {
		return tjob;
	}
	public void setTjob(String tjob) {
		this.tjob = tjob;
	}
	
}
