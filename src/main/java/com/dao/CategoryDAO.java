package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.Category;

public class CategoryDAO {
	public List<Category> getAllCategories() {
		try {
			List<Category> list = new ArrayList<Category>();
			Connection conn = DBConnect.getConn();
			
			String sql = "SELECT * FROM category";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Category c = new Category(rs.getInt("id"), rs.getString("name"));
				list.add(c);
			}
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Category findById(int id) {
		try {
			Connection conn = DBConnect.getConn();
			
			String sql = "SELECT * FROM category where id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Category c = new Category(rs.getInt("id"), rs.getString("name"));
				return c;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
