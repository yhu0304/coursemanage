package myBean;

import java.io.Serializable;

public class CourseBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String cid;
	public String sid;
	public String property;
	public String cname;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	
}
