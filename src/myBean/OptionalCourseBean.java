package myBean;

import java.io.Serializable;

public class OptionalCourseBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int cid;
	public String cname;
	public int tid;
	public String tname;
	public int week;
	public int startlesson;
	public int endlesson;
	public String location;
	public int total;
	public int rest;
	public boolean isChoosed;
	public boolean isChoosed() {
		return isChoosed;
	}
	public void setChoosed(boolean isChoosed) {
		this.isChoosed = isChoosed;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
	}
}
