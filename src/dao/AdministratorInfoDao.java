package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

import myBean.AdministratorBean;
import database.DBConnection;

public class AdministratorInfoDao {
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 =null;
	ResultSet rs = null;
	AdministratorBean ab = new AdministratorBean();
	
	public AdministratorBean getInfoById(String aid) {
		AdministratorBean ab = new AdministratorBean();
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select * from administrator where aid='" + aid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				ab = null;
			} else {
				//给bean赋值
				ab.setApassword(rs.getString("apassword"));
				ab.setAid(rs.getString("aid"));
				ab.setAname(rs.getString("aname"));
				
				//计算年龄，采用Calendar类，便于实现国际化（这里只是放置其报Date.getYear()的错）
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(System.currentTimeMillis());
				int currentYear = calendar.get(Calendar.YEAR);
				calendar.setTime(rs.getDate("abirth"));
				int age = currentYear - calendar.get(Calendar.YEAR);;
				
				ab.setAage(age);
				ab.setAbirth(rs.getDate("abirth"));
				ab.setAsex(rs.getString("asex"));
				ab.setAtel(rs.getString("atel"));
				ab.setAemail(rs.getString("aemail"));
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);		
		}
		return ab;
	}
	
	public boolean changePassword(String aid, String oldpass, String newpass) {
		boolean isFinish = false;
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select apassword from administrator where aid='" + aid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				isFinish = false;
				return isFinish;
			} else {
				if(oldpass.equals(rs.getString("apassword"))){
					stmt1 = DBConnection.getStatement(conn);
					sql = "update administrator set apassword='" + newpass + "' where aid='" + aid + "'";
					if(1 == stmt1.executeUpdate(sql)){
						isFinish = true;
					} else isFinish = false;
				} else {
					isFinish = false;
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(stmt1);
			DBConnection.close(conn);		
		}
		
		return isFinish;
	}

	public boolean updateInfoById(String aid, String atel, String aemail) {
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "update administrator set atel='" + atel + "',aemail='" + aemail + 
					"'" + " where aid='" + aid + "'";
			//执行更新
			if(1 == stmt.executeUpdate(sql))
				{
					return true;
				}
			
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);		
		}
		return false;
	}
}
