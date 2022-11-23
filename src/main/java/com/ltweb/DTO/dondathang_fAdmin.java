package com.ltweb.DTO;

import java.util.List;

import com.ltweb.entity.customers;
import com.ltweb.entity.customers_info;
import com.ltweb.entity.dondathang;

public class dondathang_fAdmin {
	private customers customers;
	private customers_info customers_info;
	private List<dondathang> list;
	public dondathang_fAdmin(com.ltweb.entity.customers customers, com.ltweb.entity.customers_info customers_info,
			List<dondathang> list) {
		super();
		this.customers = customers;
		this.customers_info = customers_info;
		this.list = list;
	}
	public customers getCustomers() {
		return customers;
	}
	public void setCustomers(customers customers) {
		this.customers = customers;
	}
	public customers_info getCustomers_info() {
		return customers_info;
	}
	public void setCustomers_info(customers_info customers_info) {
		this.customers_info = customers_info;
	}
	public List<dondathang> getList() {
		return list;
	}
	public void setList(List<dondathang> list) {
		this.list = list;
	}
}
