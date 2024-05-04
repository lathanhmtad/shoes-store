package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnect;
import com.entity.User;

public class UserDAO {
	public User login(String email, String password) {
		User us = null;
		
		try {
			String sql = "select * from [user] where email = ? and password = ?";
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt("id"));
				us.setFullName(rs.getString("fullName"));
				us.setEmail(rs.getString("email"));
				us.setPhone(rs.getString("phone"));
				us.setPassword(rs.getString("password"));
				us.setPhoto(rs.getString("photo"));
				us.setAddress(rs.getString("address"));
				
				return us;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean register(String fullName, String email, String password) {
		try {
			String sql = "INSERT INTO [dbo].[user] ([fullName], [email], [password])\r\n"
					+ "VALUES (?,?,?)";
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ps.setString(1, fullName);
			ps.setString(2, email);
			ps.setString(3, password);
			
			int i = ps.executeUpdate();
			
			if(i == 1) 
				return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
