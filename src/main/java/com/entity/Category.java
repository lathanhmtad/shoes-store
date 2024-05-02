package com.entity;

public class Category {
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	
	public Category(int id) {
		super();
		this.id = id;
	}
	
	
	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
}
