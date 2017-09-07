package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import myBean.GradeBean;

import database.DBConnection;

public class GradeDao {
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
	
	public ArrayList<GradeBean> getGradeBySid(String sid){
		ArrayList<GradeBean> grade = new ArrayList<GradeBean>();
		
		try{
			this.init();
			String sql = "select * from grade where sid='"+sid+"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				//给bean赋值
				GradeBean gb = new GradeBean();
				gb.setCid(rs.getInt("cid"));
				sql = "select * from course where cid='"+rs.getInt("cid")+"'";
				stmt1 = DBConnection.getStatement(conn);
				rs1 = stmt1.executeQuery(sql);
				if(rs1.next()){
					gb.setCname(rs1.getString("cname"));
					gb.setProperty(rs1.getString("property"));
				}
				else{
					gb.setCname("");
					gb.setProperty("");
				}
				stmt2 = DBConnection.getStatement(conn);
				sql = "select tname from teacher where tid='"+rs.getInt("tid")+"'";
				rs2 = stmt2.executeQuery(sql);
				if(rs2.next()) gb.setTname(rs2.getString("tname"));
				else gb.setTname("");
				gb.setGrade(rs.getInt("grade"));
				
				grade.add(gb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return grade;
	}
	

	public boolean enterGrade(int sid, String cid, String tid, String score) {
		boolean isFinish = false;
		try {
			this.init();
			PreparedStatement pstmt = null;
			String sql = "insert into grade (sid,cid,tid,grade) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, Integer.parseInt(cid));
			pstmt.setInt(3, Integer.parseInt(tid));
			pstmt.setInt(4, Integer.parseInt(score));
			if(1 == pstmt.executeUpdate())
			{
				isFinish = true;
				pstmt.close();
			} else {
				isFinish = false;
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//关闭数据库连接
			this.close();
		}
		
		return isFinish;
	}

	public boolean changePassword(String tid, String cid, String sid,
			String score) {
		boolean isFinish = false;
		
		try {
			this.init();
			String sql = "update grade set grade='" + score + "' where cid='"
					+ cid + "' and sid='" + sid + "'";
			if(1 == stmt.executeUpdate(sql)){
				isFinish = true;
			} else {
				isFinish = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);
		}
		
		return isFinish;
	}
	
	public void close(){
		//关闭数据库连接
		DBConnection.close(rs3);
		DBConnection.close(rs2);
		DBConnection.close(rs1);
		DBConnection.close(rs);
		DBConnection.close(pstmt);
		DBConnection.close(stmt3);
		DBConnection.close(stmt2);
		DBConnection.close(stmt1);
		DBConnection.close(stmt);
		DBConnection.close(conn);
	}
}
