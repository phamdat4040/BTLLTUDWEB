package com.ltweb.DTO;

import com.ltweb.entity.product_Color;
import com.ltweb.entity.product_Size;
import com.ltweb.entity.products;

public class monhang2 {
	private int id;
	private products products;
	private product_Size product_Size;
	private product_Color product_Color;
	private int soluong;
	public monhang2(com.ltweb.entity.products products, com.ltweb.entity.product_Size product_Size,
			com.ltweb.entity.product_Color product_Color, int soluong) {
		super();

		this.products = products;
		this.product_Size = product_Size;
		this.product_Color = product_Color;
		this.soluong = soluong;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public products getProducts() {
		return products;
	}
	public void setProducts(products products) {
		this.products = products;
	}
	public product_Size getProduct_Size() {
		return product_Size;
	}
	public void setProduct_Size(product_Size product_Size) {
		this.product_Size = product_Size;
	}
	public product_Color getProduct_Color() {
		return product_Color;
	}
	public void setProduct_Color(product_Color product_Color) {
		this.product_Color = product_Color;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
}
