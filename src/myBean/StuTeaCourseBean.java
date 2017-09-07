package myBean;

import java.io.Serializable;

public class StuTeaCourseBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int cid;
	public String cname;
	public String property;
	public int sid;
	public String sname;
	public int tid;
	public String tname;
	public int week;
	public int startlesson;
	public int endlesson;
	public String location;
	public String getProperty(){
		return property;
	}
	public void setProperty(String property){
		this.property = property;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public int getStartlesson() {
		return startlesson;
	}
	public void setStartlesson(int startlesson) {
		this.startlesson = startlesson;
	}
	public int getEndlesson() {
		return endlesson;
	}
	public void setEndlesson(int endlesson) {
		this.endlesson = endlesson;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
