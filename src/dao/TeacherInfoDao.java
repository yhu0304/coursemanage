package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

import myBean.TeacherBean;
import database.DBConnection;

public class TeacherInfoDao {
	Connection conn = null;
	Statement stmt = null;
	Statement stmt1 = null;
	ResultSet rs = null;
	public void init(){
		conn = DBConnection.getConn();
		stmt = DBConnection.getStatement(conn);
		stmt1 = DBConnection.getStatement(conn);
	}
	
	public TeacherBean getInfoById(String tid) {
		TeacherBean tb = new TeacherBean();
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select * from teacher where tid='" + tid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				tb = null;
			} else {
				//给bean赋值
				tb.setTpassword(rs.getString("tpassword"));
				tb.setTid(rs.getString("tid"));
				tb.setTname(rs.getString("tname"));
				
				//计算年龄，采用Calendar类，便于实现国际化（这里只是放置其报Date.getYear()的错）
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(System.currentTimeMillis());
				int currentYear = calendar.get(Calendar.YEAR);
				calendar.setTime(rs.getDate("tbirth"));
				int age = currentYear - calendar.get(Calendar.YEAR);;
				
				tb.setTage(age);
				tb.setTbirth(rs.getDate("tbirth"));
				tb.setTsex(rs.getString("tsex"));
				tb.setTtel(rs.getString("ttel"));
				tb.setTemail(rs.getString("temail"));
				tb.setTjob(rs.getString("tjob"));
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);		
		}
		return tb;
	}
	public boolean updateInfoById(String tid, String ttel, String temail) {
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "update teacher set ttel='" + ttel + "',temail='" + temail + 
					"'" + " where tid='" + tid + "'";
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
	
	public boolean changePassword(String tid, String oldpass, String newpass) {
		boolean isFinish = false;
		try {
			//获取数据库连接
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql = "select tpassword from teacher where tid='" + tid + "'";
			//执行查询
			rs = DBConnection.getResultSet(stmt, sql);
			if(!rs.next()) {
				isFinish = false;
				return isFinish;
			} else {
				if(oldpass.equals(rs.getString("tpassword"))){
					stmt1 = DBConnection.getStatement(conn);
					sql = "update teacher set tpassword='" + newpass + "' where tid='" + tid + "'";
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
	public boolean insertinfo(String tid, String tpassword, String tname,
			String tsex, Date tbirth, String tjob, String ttel,
			String temail) {
		boolean res = false;
		
		try {
			this.init();
			PreparedStatement pstmt = null;
			String sql = "insert into teacher (tid,tpassword,tname,tsex,tbirth,tjob,ttel,temail) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(tid));
			pstmt.setString(2, tpassword);
			pstmt.setString(3, tname);
			pstmt.setString(4, tsex);
			pstmt.setDate(5, tbirth);
			pstmt.setString(6, tjob);
			pstmt.setString(7, ttel);
			pstmt.setString(8, temail);
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

	public boolean deleteinfo(String tid) {
		boolean res = false;
		try {
			this.init();
			String sql = "delete from c_s_t where tid='" + tid + "'";
			stmt.executeUpdate(sql);
			sql = "delete from teacher where tid='" + tid + "'";
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

	public TeacherBean queryinfo(String tid, String tpassword, String tname,
			String tsex, Date tbirth, String tjob, String ttel, String temail) {
		TeacherBean tb = new TeacherBean();
		try {
			this.init();
			String sql = "select * from teacher where tid='" + tid + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				tb.setTid(rs.getString("tid"));
				tb.setTname(rs.getString("tname"));
				tb.setTpassword(rs.getString("tpassword"));
				tb.setTsex(rs.getString("tsex"));
				tb.setTbirth(rs.getDate("tbirth"));
				tb.setTjob(rs.getString("tjob"));
				tb.setTtel(rs.getString("ttel"));
				tb.setTemail(rs.getString("temail"));
			} else tb = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
			
		return tb;
	}

	public boolean updateinfo(String tid, String tpassword, String tname,
			String tsex, Date tbirth, String tjob, String ttel, String temail) {
		boolean res = false;
		
		try {
			this.init();
			if(null != tid && "" != tid){
				String sql = "update teacher set tid='" + tid + "'";
				if(null != tpassword && "" != tpassword)
					sql = sql + ",tpassword='" + tpassword + "'";
				if(null != tname && "" != tname)
					sql = sql + ",tname='" + tname + "'";
				if(null != tpassword && "" != tpassword)
					sql = sql + ",tpassword='" + tpassword + "'";
				if(null != tsex && "" != tsex)
					sql = sql + ",tsex='" + tsex + "'";
				if(null != tbirth)
					sql = sql + ",tbirth='" + tbirth + "'";
				if(null != tjob && "" != tjob)
					sql = sql + ",tjob='" + tjob + "'";
				if(null != ttel && "" != ttel)
					sql = sql + ",ttel='" + ttel + "'";
				if(null != temail && "" != temail)
					sql = sql + ",temail='" + temail + "'";
				sql = sql + " where tid='" + tid + "'";
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
}
