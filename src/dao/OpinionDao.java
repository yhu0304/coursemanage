package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import myBean.OpinionBean;
import database.DBConnection;

public class OpinionDao {
	Connection conn = null;
	Statement stmt = null;
	public boolean setOpinion(String txt , String status){
		boolean isFinish = false;
		try{
			conn = DBConnection.getConn();
			stmt = DBConnection.getStatement(conn);
			String sql="insert into opinion (ocontent,status) values('"+txt+"','"+status+"')";
			if(1 == stmt.executeUpdate(sql)) {
				isFinish = true;
			} else {
				isFinish = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.close(conn);
		}
		return isFinish;
	}
	
	ResultSet rs;
	public ArrayList<OpinionBean> getInfo() {
		//获取可选课程
		
		ArrayList<OpinionBean> opinion = new ArrayList<OpinionBean>();
			try{
				conn = DBConnection.getConn();
				stmt = DBConnection.getStatement(conn);
				String sql = "select * from opinion";
				rs = DBConnection.getResultSet(stmt, sql);
				while(rs.next()){
					//给bean赋值
					OpinionBean ob = new OpinionBean();
					//获取课程名称
					ob.setFrom(rs.getString("status"));
					ob.setTxt(rs.getString("ocontent"));
					//将结果放到optionalCourse
					opinion.add(ob);
			}
			} catch (Exception e) {
				e.printStackTrace();
		} finally {
			//关闭数据库连接
			DBConnection.close(rs);
			DBConnection.close(stmt);
			DBConnection.close(conn);
		}
			return opinion;
		}
}
