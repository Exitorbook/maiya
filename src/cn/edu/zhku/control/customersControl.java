package cn.edu.zhku.control;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.edu.zhku.DB.*;
public class customersControl {

	public boolean add(String customerName, String customerPsw, String phone) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("����ɹ�");
		String CN = customerName;
		String CP = customerPsw;
		String P = phone;
		
		
		Connection conn = DB.DBConn();
		
		String sql = "INSERT INTO customer(name,psw,phone)" + "VALUES('" 
					+CN  +  "','"  +  CP  +"','"+P+"')";
		System.out.println("����ɹ�");
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
	
		DB.close(conn);
		
		return true;
		
	}
	//��ѯByID
	public ResultSet selectByID(int id) throws ClassNotFoundException, SQLException{
		Connection conn = DB.DBConn();
		
		String sql = "SELECT * FROM customer where id = '" + id+  "'";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		
		System.out.println("321");
		
		
		return rs;
		
		
	}
	
	//�޸�byID
	public boolean upDate(int id, String name, String psw, String phone, String address) throws ClassNotFoundException, SQLException{
		Connection conn = DB.DBConn();
		System.out.println("update�ѽ���");
		
		String sql = "UPDATE customer SET name ='"+name+"' , psw = '"+psw+"' , phone='"+phone+"' , deliveryaddresses='"+address+"' WHERE id = "+"'"+id+"'";
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		System.out.println("update���");
		DB.close(conn);
		return true;
	}

//public static void main(String[] args) throws ClassNotFoundException, SQLException {
//
//	customersControl control= new customersControl();
//	
//	//��ѯ���
////	ResultSet re = control.selectByID(1);
////	
////	while (re.next()) {
////		System.out.println(re.getString("name"));
////		
////	}
//	control.upDate(1, "name", "psw", "phone", "address");
//	
//	}




}