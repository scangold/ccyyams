package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.fh.filter.startFilter;
import com.fh.util.UuidUtil;

import net.sf.json.JSONObject;

public class ImpotData {

	static  Connection getconn1(){
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		  String dbURL="jdbc:sqlserver://218.89.185.162:25410;databaseName=ccyyamsdatabase";
		  String userName="amsuser";
		  String userPwd="12345678";
		  try
		  {
		   Class.forName(driverName);
		   Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);	
		   System.out.println("连接数据库getconn1");
		    return dbConn;
		  }catch (Exception e) {
			// TODO: handle exception			  
			  System.out.println("连接数据库失败");
			  return null;
		}	
		
	}

	
	static  Connection getconn2(){
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		  String dbURL="jdbc:sqlserver://218.89.185.162:25410;databaseName=a";
		  String userName="amsuser";
		  String userPwd="12345678";
		  try
		  {
		   Class.forName(driverName);
		   Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		   System.out.println("连接数据库getconn2");
		  
		    return dbConn;
		  }catch (Exception e) {
			// TODO: handle exception			  
			  System.out.println("连接数据库失败");
			  return null;
		}
		
		  
		
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
	
	Date d=	new Date();
		
		ImpFmsDocMain i;
		int num=1;
		
		String SQL = "SELECT * FROM DocMain"; 
		Statement	stmt = getconn2().createStatement(); 
		ResultSet rs = stmt.executeQuery(SQL); 
		// Iterate through the data in the result set and display it.
		Statement statement	=getconn1().createStatement();
		while (rs.next()) { 
		rs.getString("ID");
		i=new ImpFmsDocMain();
		i.setId(UuidUtil.get32UUID());
		i.setUserId("1");
		i.setFmsId("old");
		i.setTitle(rs.getString("题名"));
		i.setKeyword(rs.getString("主题词"));
		i.setPrecise(rs.getString("提要"));
		i.setPs(rs.getString("附注"));	
		i.setMedianclass(rs.getString("中位类"));
		i.setDoclevel(rs.getString("文本类型"));
		i.setSubordinateclass(rs.getString("下位类"));
		i.setSuperordinateclass(rs.getString("上位类"));
		i.setCarrier(rs.getString("载体类型"));
		i.setSpec(rs.getString("规格"));
		i.setCreatetime(rs.getDate("录入日期"));
		i.setSftiime(rs.getDate("收发时间"));
		i.setDocid(rs.getString("文号"));
		i.setIsvalid((short)1);
		i.setPages(rs.getInt("份数"));
		i.setPagination(rs.getInt("页数"));
		i.setSumnumber(rs.getString("文件来源"));
		i.setFileyear(rs.getString("文件年代"));
		i.setSecretlevel(rs.getString("密级"));
		i.setSubcopies(rs.getInt("附件份数"));
		i.setValidperiod(rs.getInt("保存期限"));
		i.setSfnumber(rs.getString("收发编号"));
		i.setDoclevel(rs.getString("文本类型"));
		i.setSequencenum(rs.getString("盒内序号"));
		i.setDocnum(rs.getString("档号"));
		i.setOwner(rs.getString("责任者"));
		i.setSubowner(rs.getString("承办部门"));
		Date dd=new Date();
		long l=dd.getTime()-d.getTime();
		System.out.println(i.toString());
	    System.err.println(num+++"-----"+statement.executeUpdate(i.toString())+"-----"+l/1000);	
		
		} 
	}

}
