package com.ltweb.Service.dondathang;

import java.util.List;

import com.ltweb.DTO.monhang2;
import com.ltweb.entity.customers;
import com.ltweb.entity.dondathang;

public interface dondathangService {
	public List<dondathang> getListDonDatHangByCustomerName(Integer name);

	public void add(customers customers, List<monhang2> list);

	public List<dondathang> getAll();

	public void add(List<dondathang> list);
}
