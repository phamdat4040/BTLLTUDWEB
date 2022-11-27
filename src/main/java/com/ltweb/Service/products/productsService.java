package com.ltweb.Service.products;

import java.util.List;

import com.ltweb.entity.products;
import com.ltweb.entity.tg_product_size_color;

public interface productsService {

	List<products> list();

	List<products> getListProductsByCateId(int cate_id);

	products getProductById(int id);

	public products getLastProducts();

	void addProducts(String name, int cate_id, String description, String image, float price);

	void updateProduct(int id, String name, int cate_id, String description, String image, float price);

	public List<products> getThreeProducts(int soluong);

	void deleteProduct(int id);

	tg_product_size_color getByid(int id);

	void createsizecolor(int id, int sold, int stock, int sizeid, int colorid);

	void updatesizecolor(int id, int sold, int stock, int sizeid, int colorid);

	public List<products> searchProducts(String txt);
	public List<products> listProductForMen(int soluong, String status);

}
