package myBean;

import java.io.Serializable;
import java.sql.Date;

public class AdministratorBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String aid;
	public String apassword;
	public String aname;
	public String asex;
	public Date abirth;
	public int aage;
	public String atel;
	public String aemail;
	public int getAage() {
		return aage;
	}
	public void setAage(int aage) {
		this.aage = aage;
	}

	public String getAsex() {
		return asex;
	}
	public void setAsex(String asex) {
		this.asex = asex;
	}
	public Date getAbirth() {
		return abirth;
	}
	public void setAbirth(Date abirth) {
		this.abirth = abirth;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getAemail() {
		return aemail;
	}
	public void setAemail(String aemail) {
		this.aemail = aemail;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
}
