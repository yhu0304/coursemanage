package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import myBean.StudentBean;
import database.DBConnection;

public class StudentInfoDao {
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 = null;
	ResultSet rs = null;
	
	public void init(){
		conn = DBConnection.getConn();
		stmt = DBConnection.getStatement(conn);
		stmt1 = DBConnection.getStatement(conn);
	}
	//查询学生信息
	public StudentBean getInfoById(String id) {
		StudentBean sb = new StudentBean();
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select * from student where sid='" + id + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				sb = null;
			} else {
				//给bean赋值
				sb.setSpassword(rs.getString("spassword"));
				sb.setSid(rs.getString("sid"));
				sb.setSname(rs.getString("sname"));
				
				//计算年龄，采用Calendar类，便于实现国际化（这里只是放置其报Date.getYear()的错）
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(System.currentTimeMillis());
				int currentYear = calendar.get(Calendar.YEAR);
				calendar.setTime(rs.getDate("sbirth"));
				int age = currentYear - calendar.get(Calendar.YEAR);;
				
				sb.setSage(age);
				sb.setSbirth(rs.getDate("sbirth"));
				sb.setSsex(rs.getString("ssex"));
				sb.setStel(rs.getString("stel"));
				sb.setSemail(rs.getString("semail"));
				sb.setSprofession(rs.getString("sprofession"));
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);		
		}
		return sb;
	}
	
	//更新学生信息
	public boolean updateInfoById(String id, String tel, String email) {
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "update student set stel='" + tel + "',semail='" + email + 
					"'" + " where sid='" + id + "'";
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
	
	//修改密码
	public boolean changePassword(String sid, String oldpass, String newpass){
		boolean isFinish = false;
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select spassword from student where sid='" + sid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				isFinish = false;
				return isFinish;
			} else {
				if(oldpass.equals(rs.getString("spassword"))){
					stmt1 = DBConnection.getStatement(conn);
					sql = "update student set spassword='" + newpass + "' where sid='" + sid + "'";
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
			DBConnection.close(conn);		
		}
		
		return isFinish;
	}

	public boolean insertinfo(String sid, String spassword, String sname,
			String ssex, Date sbirth, String sprofession,
			String stel, String semail) {
		boolean res = false;
		
		try {
			this.init();
			PreparedStatement pstmt = null;
			String sql = "insert into student (sid,spassword,sname,ssex,sbirth,sprofession,stel,semail) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(sid));
			pstmt.setString(2, spassword);
			pstmt.setString(3, sname);
			pstmt.setString(4, ssex);
			pstmt.setDate(5, sbirth);
			pstmt.setString(6, sprofession);
			pstmt.setString(7, stel);
			pstmt.setString(8, semail);
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
	
	public void close(){
		DBConnection.close(rs);
		DBConnection.close(stmt);
		DBConnection.close(stmt1);
		DBConnection.close(conn);
		
	}
	
	public boolean deleteinfo(String sid) {
		boolean res = false;
		try {
			this.init();
			String sql = "delete from c_s_t where sid=" + sid + "'";
			stmt.executeUpdate(sql);
			sql = "delete from student where sid='" + sid + "'";
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
	
	public boolean updateinfo(String sid, String spassword, String sname,
			String ssex, Date sbirth, String sprofession, String stel, String semail) {
		boolean res = false;
		
		try {
			this.init();
			if(null != sid && "" != sid){
				String sql = "update student set sid='" + sid + "'";
				if(null != spassword && "" != spassword)
					sql = sql + ",spassword='" + spassword + "'";
				if(null != sname && "" != sname)
					sql = sql + ",sname='" + sname + "'";
				if(null != spassword && "" != spassword)
					sql = sql + ",spassword='" + spassword + "'";
				if(null != ssex && "" != ssex)
					sql = sql + ",ssex='" + ssex + "'";
				if(null != sbirth)
					sql = sql + ",sbirth='" + sbirth + "'";
				if(null != sprofession && "" != sprofession)
					sql = sql + ",sprofession='" + sprofession + "'";
				if(null != stel && "" != stel)
					sql = sql + ",stel='" + stel + "'";
				if(null != semail && "" != semail)
					sql = sql + ",semail='" + semail + "'";
				sql = sql + " where sid='" + sid + "'";
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
	public StudentBean queryinfo(String sid, String spassword, String sname,
			String ssex, Date sbirth, String sprofession,
			String stel, String semail) {
		StudentBean sb = new StudentBean();
		try {
			this.init();
			String sql = "select * from student where sid='" + sid + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				sb.setSid(rs.getString("sid"));
				sb.setSname(rs.getString("sname"));
				sb.setSpassword(rs.getString("spassword"));
				sb.setSsex(rs.getString("ssex"));
				sb.setSbirth(rs.getDate("sbirth"));
				sb.setSprofession(rs.getString("sprofession"));
				sb.setStel(rs.getString("stel"));
				sb.setSemail(rs.getString("semail"));
			} else sb = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
			
		return sb;
	}
}
