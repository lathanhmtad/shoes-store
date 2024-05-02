package com.entity;

import java.sql.ResultSet;

import com.utils.AppUtils;

public class Product {
	private int id;
	private String name;
	private String brand;
	private String image;
	private int price;
	private String description;
	private boolean stock;
	private Category category;
	private boolean isNew;
	
	public Product(ResultSet rs) {
		try {
			id = rs.getInt("id");
			name = rs.getString("name");
			brand = rs.getString("brand");
			image = rs.getString("image");
			price = rs.getInt("price");
			description = rs.getString("description");
			stock = rs.getBoolean("stock");
			isNew = rs.getBoolean("is_new");
		
			int categoryId = rs.getInt("category_id");
			String cateName = rs.getString("category_name");
			
			category = new Category(categoryId, cateName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Product() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPrice() {
		return AppUtils.formatPrice(price);
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isStock() {
		return stock;
	}
	public void setStock(boolean stock) {
		this.stock = stock;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public boolean isNew() {
		return isNew;
	}
	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}
	
	public int getPrimitivePrice() {
		return this.price;
	}
}
