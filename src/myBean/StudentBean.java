package myBean;

import java.io.Serializable;
import java.sql.Date;

public class StudentBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String sid;
	public String spassword;
	public String sname;
	public String ssex;
	public Date sbirth;
	public int sage;
	public String sprofession;
	public String stel;
	public String semail;
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public Date getSbirth() {
		return sbirth;
	}
	public void setSbirth(Date sbirth) {
		this.sbirth = sbirth;
	}
	public int getSage() {
		return sage;
	}
	public void setSage(int sage) {
		this.sage = sage;
	}
	public String getSprofession() {
		return sprofession;
	}
	public void setSprofession(String sprofession) {
		this.sprofession = sprofession;
	}
	public String getStel() {
		return stel;
	}
	public void setStel(String stel) {
		this.stel = stel;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
}
