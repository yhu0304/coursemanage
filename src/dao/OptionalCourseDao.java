package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import database.DBConnection;

import myBean.OptionalCourseBean;

public class OptionalCourseDao {
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	public void init(){
		//获取数据库连接
		conn = DBConnection.getConn();
		stmt = DBConnection.getStatement(conn);

	}
	
	//获取可选课程
	public ArrayList<OptionalCourseBean> getOptionalCourseBySid(String sid){
		ArrayList<OptionalCourseBean> optionalCourse = new ArrayList<OptionalCourseBean>();
		try{
			this.init();
			String sql = "select * from optional_course";
			rs = DBConnection.getResultSet(stmt, sql);
			while(rs.next()){
				//给bean赋值
				OptionalCourseBean ocb = new OptionalCourseBean();
				//获取课程名称
				ocb.setCid(rs.getInt("cid"));
				stmt1 = DBConnection.getStatement(conn);
				sql = "select cname from course where cid='"
						+ rs.getString("cid") + "'";
				rs1 = DBConnection.getResultSet(stmt1, sql);
				if(rs1.next())
					ocb.setCname(rs1.getString("cname"));
				else ocb.setCname("未知");
				//获取教师名称
				stmt2 = DBConnection.getStatement(conn);
				sql = "select tname from teacher where tid='" 
						+ rs.getString("tid") + "'";
				rs2 = DBConnection.getResultSet(stmt2, sql);
				if(rs2.next())
					ocb.setTname(rs2.getString("tname"));
				else ocb.setTname("未知");
				ocb.setWeek(rs.getInt("week"));
				ocb.setStartlesson(rs.getInt("startlesson"));
				ocb.setEndlesson(rs.getInt("endlesson"));
				ocb.setLocation(rs.getString("location"));
				//确认该门课程是否已选
				stmt3 = DBConnection.getStatement(conn);
				sql = "select * from c_s_t where sid='"
						+sid+"' and cid='"+rs.getString("cid")+"'";
				rs3 = stmt3.executeQuery(sql);
				ocb.setChoosed(rs3.next());
				ocb.setTotal(rs.getInt("total"));
				ocb.setRest(rs.getInt("rest"));
				//将结果放到optionalCourse
				optionalCourse.add(ocb);
		}
		} catch (Exception e) {
			e.printStackTrace();
	} finally {
		//关闭数据库连接
		this.close();
	}
		return optionalCourse;
	}
	
	//选课处理
	public boolean chooseCourseByCid(String cid, String sid)
	{
		boolean isFinish = false;
		int rest = 0;
		try{
		this.init();
		
		//判断是否已选了该课，防止恶意更改获得的cid
		String sql = "select * from c_s_t where sid='"
				+sid+"' and cid='"+cid+"' and property='选修'";
		rs = stmt.executeQuery(sql);
		//添加课程信息到c_s_t表
		if(rs.next()){
			isFinish = false;
			return isFinish;
		} else {
			stmt1 = DBConnection.getStatement(conn);
			sql = "select * from optional_course where cid='" + cid + "'";
			rs1 = stmt1.executeQuery(sql);
			if(rs1.next()){
				sql = "insert into c_s_t (cid,sid,tid,property,week,startlesson,endlesson,location) values(?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,rs1.getInt("cid"));
				pstmt.setInt(2,Integer.parseInt(sid));
				pstmt.setInt(3,rs1.getInt("tid"));
				pstmt.setString(4, "选修");
				pstmt.setInt(5,rs1.getInt("week"));
				pstmt.setInt(6,rs1.getInt("startlesson"));
				pstmt.setInt(7,rs1.getInt("endlesson"));
				pstmt.setString(8,rs1.getString("location"));
				
				rest = rs1.getInt("rest")-1;
			
				if(1 == pstmt.executeUpdate())
				{
					isFinish = true;
				} else {
					isFinish = false;
					return isFinish;
				}
				
			} else {
				return isFinish;
			}
		}
		//更新optional_course课程中对应课程剩余人数
		sql = "update optional_course set rest="+Integer.toString(rest)+" where cid='"+cid+"'";
		if(1 == stmt.executeUpdate(sql)){
			isFinish = true;
		} else {
			isFinish = false;
			return isFinish;
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return isFinish;
	}
	
	//根据学号查找已选课程
	public ArrayList<OptionalCourseBean> getMyChoosedCourseBySid(String sid)
	{
		ArrayList<OptionalCourseBean> myCourse = new ArrayList<OptionalCourseBean>();
		try{
			this.init();
			//从c_s_t表中获取该生选课信息
			String sql = "select * from c_s_t where sid='"+sid+"' and property='选修'";
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				//给bean赋值
				OptionalCourseBean ocb = new OptionalCourseBean();
				//获取课程名称
				ocb.setCid(rs.getInt("cid"));
				stmt1 = DBConnection.getStatement(conn);
				sql = "select cname from course where cid='"
						+ rs.getString("cid") + "'";
				rs1 = DBConnection.getResultSet(stmt1, sql);
				if(rs1.next())
					ocb.setCname(rs1.getString("cname"));
				else ocb.setCname("未知");
				//获取教师名称
				stmt2 = DBConnection.getStatement(conn);
				sql = "select tname from teacher where tid='" 
						+ rs.getString("tid") + "'";
				rs2 = DBConnection.getResultSet(stmt2, sql);
				if(rs2.next())
					ocb.setTname(rs2.getString("tname"));
				else ocb.setTname("未知");
				ocb.setWeek(rs.getInt("week"));
				ocb.setStartlesson(rs.getInt("startlesson"));
				ocb.setEndlesson(rs.getInt("endlesson"));
				ocb.setLocation(rs.getString("location"));
				//将结果放到myCourse
				myCourse.add(ocb);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return myCourse;
	}
	
	//退选课程
	public boolean dropChoosedCourseByCSid(String cid, String sid)
	{
		boolean isFinish = false;
		
		try{
			this.init();
			String sql = "delete from c_s_t where cid='"+cid+"' and sid='"+sid+"'";
			if(1 == stmt.executeUpdate(sql)){
				isFinish = true;
			} else {
				isFinish = false;
				return isFinish;
			}
		
			//更新可选人数
			stmt1 = DBConnection.getStatement(conn);
			sql = "update optional_course set rest=rest+1 where cid='"+cid+"'";
			if(1 == stmt1.executeUpdate(sql)){
				isFinish = true;
			} else {
				isFinish = false;
				return isFinish;
			}
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				this.close();
			}
			return isFinish;
	}
	
	//关闭数据库
	public void close(){
		DBConnection.close(rs3);
		DBConnection.close(rs2);
		DBConnection.close(rs1);
		DBConnection.close(rs);
		DBConnection.close(stmt3);
		DBConnection.close(stmt1);
		DBConnection.close(stmt2);
		DBConnection.close(stmt);
		DBConnection.close(conn);
	}
}
