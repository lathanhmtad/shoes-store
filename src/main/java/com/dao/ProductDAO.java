package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.Product;
import com.utils.AppConstants;

public class ProductDAO {
	public List<Product> getAllProducts(int page, int size) {
		List<Product> list = new ArrayList<Product>();
		
		try {
			String sql = "SELECT product.*, category.name as category_name\r\n"
					+ "FROM product\r\n"
					+ "JOIN category on product.category_id = category.id\r\n"
					+ "order by product.id desc\r\n"
					+ "OFFSET ? ROWS\r\n"
					+ "Fetch NEXT ? ROWS ONLY";
			
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
	
			ps.setInt(1, (page - 1) * size);
			ps.setInt(2, size);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs));
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<Product> getAllProductsIsNew(boolean all) {
		try {
			List<Product> list = new ArrayList<Product>();
			String sql = "";
			if(all) {
				sql = "select product.*, category.name as category_name\r\n"
						+ "from product\r\n"
						+ "join category on product.category_id = category.id\r\n"
						+ "where is_new = 'true'";
			}
			else {
				sql = "select product.*, category.name as category_name\r\n"
						+ "from product\r\n"
						+ "join category on product.category_id = category.id\r\n"
						+ "where is_new = 'true'\r\n"
						+ "order by id\r\n"
						+ "offset 1 row \r\n"
						+ "fetch next 4 row only";
			}
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs));
			}
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getTotalItem() {
		try {
			String sql = "SELECT COUNT(*) AS total_items FROM product;";
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("total_items");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getTotalItem(int cateId) {
		try {
			String sql = "SELECT COUNT(*) AS total_items FROM product WHERE category_id = ?";
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setInt(1, cateId);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("total_items");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean addProduct(Product p) {
		try {
			String sql = "INSERT INTO product (name, brand, image, price, description, stock, category_id, is_new)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getBrand());
			ps.setString(3, p.getImage());
			ps.setInt(4, p.getPrimitivePrice());
			ps.setString(5, p.getDescription());
			ps.setBoolean(6, p.isStock());
			ps.setInt(7, p.getCategory().getId());
			ps.setBoolean(8, p.isNew());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	public Product findById(int id) {
		try {
			String sql = "select product.*, category.name as category_name\r\n"
					+ "from product\r\n"
					+ "join category on product.category_id = category.id\r\n"
					+ "where product.id = ?";
			
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setInt(1, id);
			
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				Product p = new Product(rs);
				return p;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public boolean updateProduct(Product newP) {
		try {
			String sql = "UPDATE product\n"
					+ "SET name = ?, brand = ?, image = ?, price = ?, description = ?, stock = ?, is_new = ?, category_id = ?\n"
					+ "where product.id = ?";
			
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setString(1, newP.getName());
			ps.setString(2, newP.getBrand());
			ps.setString(3, newP.getImage());
			ps.setInt(4, newP.getPrimitivePrice());
			ps.setString(5, newP.getDescription());
			ps.setBoolean(6, newP.isStock());
			ps.setBoolean(7, newP.isNew());
			ps.setInt(8, newP.getCategory().getId());
			ps.setInt(9, newP.getId());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteProductById(int id) {
		try {
			
			String sql = "DELETE FROM product where id = ?";
			
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int i =  ps.executeUpdate();
			
			if(i == 1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
 	}

	public List<Product> findByCategoryId(int cateId, int page) {
		try {
			List<Product> products = new ArrayList<Product>();
			String sql = "";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = null;
			
			if(cateId == 0) {
				sql = "SELECT product.*, category.name AS category_name\r\n"
						+ "FROM product\r\n"
						+ "JOIN category ON product.category_id = category.id\r\n"
						+ "ORDER BY product.id\r\n"
						+ "OFFSET ? ROWS\r\n"
						+ "FETCH NEXT ? ROWS ONLY;";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, (page - 1) * AppConstants.defautRecordsWebPerPage);
				ps.setInt(2, AppConstants.defautRecordsWebPerPage);
			}
			else {
				sql = "SELECT product.*, category.name AS category_name\r\n"
						+ "FROM product\r\n"
						+ "JOIN category ON product.category_id = category.id\r\n"
						+ "WHERE product.category_id = ?\r\n"
						+ "ORDER BY product.id\r\n"
						+ "OFFSET ? ROWS\r\n"
						+ "FETCH NEXT ? ROWS ONLY;";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, cateId);
				ps.setInt(2, (page - 1) * AppConstants.defautRecordsWebPerPage);
				ps.setInt(3, AppConstants.defautRecordsWebPerPage);
			}
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				products.add(new Product(rs));
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Product> search(String keyword) {
		try {
		    List<Product> products = new ArrayList<Product>();
		    // Prepare the SQL statement without directly embedding the wildcards into the query
		    String sql = "SELECT p.*, c.name as category_name "
		               + "FROM product p "
		               + "JOIN category c ON c.id = p.category_id "
		               + "WHERE p.name LIKE ?";
		    PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
		    
		    ps.setString(1, "%" + keyword + "%");
		    ResultSet rs = ps.executeQuery();
		    
		    while(rs.next()) {
		        products.add(new Product(rs));
		    }
		    return products;
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return null;
	}
}
