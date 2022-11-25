package com.ltweb.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ltweb.DTO.dondathang_fAdmin;
import com.ltweb.Service.categories.categoriesService;
import com.ltweb.Service.customers.customersService;
import com.ltweb.Service.customers_info.customers_infoService;
import com.ltweb.Service.dondathang.dondathangService;
import com.ltweb.Service.employees.employeesService;
import com.ltweb.Service.products.productsService;
import com.ltweb.entity.categories;
import com.ltweb.entity.customers;
import com.ltweb.entity.customers_info;
import com.ltweb.entity.dondathang;
import com.ltweb.entity.employees;
import com.ltweb.entity.products;
import com.ltweb.entity.tg_product_size_color;

@Controller
@SessionAttributes("user")
public class AdminHomeController {

	@Autowired
	private employeesService employeesService;

	@Autowired
	private customersService customersService;

	@Autowired
	private productsService productsService;

	@Autowired
	private categoriesService categoriesService;

	@Autowired
	private customers_infoService customers_infoService;

	@Autowired
	private dondathangService dondathangService;

	@GetMapping("/adminhome")
	public ModelAndView home(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("admin/index");
		employees employee = (employees) session.getAttribute("user");
		modelAndView.addObject("employee", employee);
		List<dondathang> getAll = dondathangService.getAll();
		HashMap<Integer, dondathang_fAdmin> hashMap = new HashMap<Integer, dondathang_fAdmin>();
		for (dondathang dondathang : getAll) {
			if(hashMap.isEmpty() || !hashMap.containsKey(dondathang.getOrdererId())) {
				customers customers = customersService.getCustomersById(dondathang.getOrdererId());
				customers_info customers_info = customers_infoService.getInfoByUserId(dondathang.getOrdererId());
				List<dondathang> list = dondathangService.getListDonDatHangByCustomerName(dondathang.getOrdererId());
				dondathang_fAdmin dondathang_fAdmin = new dondathang_fAdmin(customers, customers_info, list);
				hashMap.put(dondathang.getOrdererId(), dondathang_fAdmin);
			}
		}
		
		modelAndView.addObject("listOrders", hashMap);
		return modelAndView;
	}

	@GetMapping("/products")
	public ModelAndView product() {
		ModelAndView modelAndView = new ModelAndView("admin/products");
		List<products> listP = productsService.list();
		modelAndView.addObject("listP", listP);
		List<categories> listCate = categoriesService.list();
		modelAndView.addObject("listC", listCate);
		return modelAndView;
	}

	@GetMapping("/delCate")
	public String delCate(@RequestParam("cid") int cid) {
		categoriesService.delCategory(cid);
		return "redirect:/products";
	}

	@GetMapping("/delProduct")
	public String delProduct(@RequestParam("pid") int pid) {
		productsService.deleteProduct(pid);
		return "redirect:/products";
	}

	@GetMapping("/adminaccounts")
	public ModelAndView accouts() {
		ModelAndView modelAndView = new ModelAndView("admin/accouts");
		List<employees> listEmp = employeesService.list();
		modelAndView.addObject("listEmp", listEmp);
		List<customers> listCus = customersService.list();
		modelAndView.addObject("listCus", listCus);
		return modelAndView;
	}

	@GetMapping("/add_product")
	public ModelAndView addproduct() {
		ModelAndView modelAndView = new ModelAndView("admin/add_products");
		List<categories> listCate = categoriesService.list();
		modelAndView.addObject("listCate", listCate);
		return modelAndView;
	}

	@PostMapping(path = "/addP", produces = "text/plain; charset = UTF-8")
	public String addProduct(@RequestParam("name") String name, @RequestParam("category") String cateName,
			@RequestParam("description") String description, @RequestParam("price") float price,
			@RequestParam("image") String image) {
		categories category = (categories) categoriesService.getCateByName(cateName);
		productsService.addProducts(name, category.getId(), description, image, price);
		return "redirect:/products";
	}

	@GetMapping("/edit_product")
	public ModelAndView editproduct(@RequestParam("pid") int pid) {
		ModelAndView modelAndView = new ModelAndView("admin/edit_products");
		products product = (products) productsService.getProductById(pid);
		modelAndView.addObject("product", product);
		categories category = (categories) categoriesService.getCateById(product.getCategory_id());
		modelAndView.addObject("category", category);
		tg_product_size_color product_size_color = (tg_product_size_color) productsService.getByid(pid);
		modelAndView.addObject("psizecolor", product_size_color);
		List<categories> listCate = categoriesService.list();
		modelAndView.addObject("listCate", listCate);
		return modelAndView;
	}

	@PostMapping("/changeProduct")
	public String change(@RequestParam("pid") int pid, @RequestParam("name") String name,
			@RequestParam("description") String description, @RequestParam("category") String cateName,
			@RequestParam("price") float price, @RequestParam("sold") int sold, @RequestParam("stock") int stock,
			@RequestParam("image") String image, @RequestParam("size") int size, @RequestParam("color") int color) {
		categories category = (categories) categoriesService.getCateByName(cateName);
		productsService.updateProduct(pid, name, category.getId(), description, image, price);
		productsService.updatesizecolor(pid, sold, stock, size, color);
		return "redirect:/products";
	}

	@GetMapping("loadPbyC")
	public ModelAndView productByC(@RequestParam("cid") int cid) {
		ModelAndView modelAndView = new ModelAndView("admin/products");
		List<products> listP = productsService.getListProductsByCateId(cid);
		modelAndView.addObject("listP", listP);
		List<categories> listCate = categoriesService.list();
		modelAndView.addObject("listC", listCate);
		return modelAndView;
	}

	@GetMapping("/delCustomers")
	public void delCustomer(@RequestParam("aid") int aid) {
		customersService.delCustomer(aid);
	}

	@GetMapping("/edit_customer")
	public ModelAndView editcustomer(@RequestParam("aid") int adi) {
		ModelAndView modelAndView = new ModelAndView("admin/editcustomer");
		customers customer = (customers) customersService.getCustomersById(adi);
		modelAndView.addObject("customer", customer);
		customers_info cusinfo = (customers_info) customers_infoService.getInfoByUserId(adi);
		modelAndView.addObject("cusinfo", cusinfo);
		return modelAndView;
	}

	@PostMapping("/updateCus")
	public String updateCus(@RequestParam("cid") int id, @RequestParam("uname") String uname,
			@RequestParam("password") String password, @RequestParam("password2") String password2,
			@RequestParam("fname") String firstname, @RequestParam("lname") String lastname,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("city") String city, @RequestParam("country") String country) {
		if (password.equals(password2)) {
			customersService.updateCustomer(id, uname, password, firstname, lastname);
			customers_infoService.updateProfile(id, phone, email, address1, address2, city, country);
			return "redirect:/adminaccounts";
		}
		return "redirect/:edit_customer";
	}

}
