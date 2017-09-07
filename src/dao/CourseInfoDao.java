package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import myBean.CourseBean;
import myBean.StuTeaCourseBean;
import database.DBConnection;

public class CourseInfoDao {
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	public ArrayList<CourseBean> getMyCourseByTid(String tid) {
		ArrayList<CourseBean> mycourse = new ArrayList<CourseBean>();
		
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			stmt1 = DBConnection.getStatement(conn);
			stmt2 = DBConnection.getStatement(conn);
			String sql = "select distinct cid from c_s_t where tid='" + tid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			//将所有结果添加到myCourse
			while(rs.next()){
				//给bean赋值
				CourseBean cb = new CourseBean();
				//获取课程名称
				sql = "select cname from course where cid='"
						+ rs.getString("cid") + "'";
				rs1 = DBConnection.getResultSet(stmt1, sql);
				if(rs1.next())
					cb.setCname(rs1.getString("cname"));
				cb.setCid(rs.getString("cid"));
				//将结果放到myCourse
				mycourse.add(cb);
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			this.close();
		}
	
		
		return mycourse;
	}
	
	//查询学生信息
	public ArrayList<StuTeaCourseBean> getInfoBySid(String sid) {
		ArrayList<StuTeaCourseBean> myCourse = new ArrayList<StuTeaCourseBean>();
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			stmt1 = DBConnection.getStatement(conn);
			stmt2 = DBConnection.getStatement(conn);
			String sql = "select * from c_s_t where sid='" + sid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			//将所有结果添加到myCourse
			while(rs.next()){
				//给bean赋值
				StuTeaCourseBean stcb = new StuTeaCourseBean();
				//获取课程名称
				sql = "select cname from course where cid='"
						+ rs.getString("cid") + "'";
				rs1 = DBConnection.getResultSet(stmt1, sql);
				if(rs1.next())
					stcb.setCname(rs1.getString("cname"));
				//获取教师名称
				sql = "select tname from teacher where tid='" 
						+ rs.getString("tid") + "'";
				rs2 = DBConnection.getResultSet(stmt2, sql);
				if(rs2.next())
					stcb.setTname(rs2.getString("tname"));
				stcb.setWeek(rs.getInt("week"));
				stcb.setProperty(rs.getString("property"));
				stcb.setStartlesson(rs.getInt("startlesson"));
				stcb.setEndlesson(rs.getInt("endlesson"));
				stcb.setLocation(rs.getString("location"));
				//将结果放到myCourse
				myCourse.add(stcb);
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			this.close();
		}
	
		return myCourse;
	}

	public ArrayList<StuTeaCourseBean> getInfoByTid(String tid) {
		ArrayList<StuTeaCourseBean> myCourse = new ArrayList<StuTeaCourseBean>();
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			stmt1 = DBConnection.getStatement(conn);
			stmt2 = DBConnection.getStatement(conn);
			String sql = "select distinct cid,property,week,startlesson,endlesson,location from c_s_t where tid='" + tid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			//将所有结果添加到myCourse
			while(rs.next()){
				//给bean赋值
				StuTeaCourseBean stcb = new StuTeaCourseBean();
				//获取课程名称
				sql = "select cname from course where cid='"
						+ rs.getString("cid") + "'";
				rs1 = DBConnection.getResultSet(stmt1, sql);
				if(rs1.next())
					stcb.setCname(rs1.getString("cname"));
				stcb.setWeek(rs.getInt("week"));
				stcb.setStartlesson(rs.getInt("startlesson"));
				stcb.setEndlesson(rs.getInt("endlesson"));
				stcb.setLocation(rs.getString("location"));
				stcb.setProperty(rs.getString("property"));
				//将结果放到myCourse
				myCourse.add(stcb);
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			this.close();
		}
	
		return myCourse;
	}

	public ArrayList<StuTeaCourseBean> getInfoByTCid(String tid, String cid) {
		ArrayList<StuTeaCourseBean> mystudent= new ArrayList<StuTeaCourseBean>();
		
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			stmt1 = DBConnection.getStatement(conn);
			stmt2 = DBConnection.getStatement(conn);
			String sql = "select sid from c_s_t where tid='" + tid + "' and cid='" + cid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			//将所有结果添加到mystudent
			while(rs.next()){
				//给bean赋值
				StuTeaCourseBean stcb = new StuTeaCourseBean();
				sql = "select sid from grade where cid='" + cid + "' and sid='" + rs.getString("sid") + "'";
				rs1 = stmt1.executeQuery(sql);
				if(!rs1.next()){
					stcb.setSid(rs.getInt("sid"));
					sql = "select sname from student where sid='" + rs.getString("sid") + "'";
					rs2 = stmt2.executeQuery(sql);
					if(rs2.next()){
						stcb.setSname(rs2.getString("sname"));
					}
					//将结果放到mystudent
					mystudent.add(stcb);
				}
				
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			this.close();
		}
		
		return mystudent;
	}
	
	public void close(){
		//关闭数据库连接
		DBConnection.close(rs2);
		DBConnection.close(rs1);
		DBConnection.close(rs);
		DBConnection.close(stmt2);
		DBConnection.close(stmt1);
		DBConnection.close(stmt);
		DBConnection.close(conn);
	}

	public boolean insertinfo(String cid, String cname, String cproperty) {
		boolean res = false;	
		try {
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			PreparedStatement pstmt = null;
			String sql = "insert into course (cid,cname,property) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cid));
			pstmt.setString(2, cname);
			pstmt.setString(3, cproperty);
			if(1 == pstmt.executeUpdate()){
				res = true;
				pstmt.close();
			} else {
				res = false;
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
			
		return res;
	}

	public boolean deleteinfo(String cid) {
		boolean res = false;
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			stmt1 = DBConnection.getStatement(conn);
			String sql = "delete from c_s_t where cid='" + cid + "'";
			stmt.executeUpdate(sql);
			sql = "delete from course_detail where cid='" + cid + "'";
			stmt.executeUpdate(sql);
			sql = "delete from optional_course where cid='" + cid + "'";
			stmt.executeUpdate(sql);
			sql = "delete from course where cid='" + cid + "'";
			if(1 == stmt1.executeUpdate(sql)){
				res = true;
			} else {
				res = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return res;
	}

	public boolean updateinfo(String cid, String cname, String cproperty) {
boolean res = false;
		
		try {
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			if(null != cid && "" != cid){
				String sql = "update course set cid='" + cid + "'";
				if(null != cname && "" != cname)
					sql = sql + ",cname='" + cname + "'";
				if(null != cproperty && "" != cproperty)
					sql = sql + ",property='" + cproperty + "'";
				sql = sql + " where cid='" + cid + "'";
				if(1 == stmt.executeUpdate(sql)){
					res = true;
				} else {
					res = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return res;
	}

	public CourseBean queryinfo(String cid, String cname, String cproperty) {
		CourseBean cb = new CourseBean();
		try {
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select * from course where cid='" + cid + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				cb.setCid(rs.getString("cid"));
				cb.setCname(rs.getString("cname"));
				cb.setProperty(rs.getString("property"));
			} else cb = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
			
		return cb;
	}
}
