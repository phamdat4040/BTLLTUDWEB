package com.ltweb.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ltweb.DTO.Monhang;
import com.ltweb.Service.customers.customersService;
import com.ltweb.Service.employees.employeesService;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.Service.tg_product_size_color.tg_product_size_colorService;
import com.ltweb.entity.customers;
import com.ltweb.entity.employees;
import com.ltweb.entity.products;
import com.ltweb.entity.tg_product_size_color;

@Controller
@RequestMapping(value = "/login", method = RequestMethod.GET)
@SessionAttributes("user")
public class LoginController {

	@Autowired
	private customersService customersService;
	
	@Autowired
	private tg_product_size_colorService tg_product_size_colorService;

	@Autowired
	private employeesService employService;

	@Autowired
	private productsService productsService;

	@Autowired
	private product_SizeService product_SizeService;

	@Autowired
	private product_ColorService product_ColorService;

	@Autowired
	private com.ltweb.DTO.ShoppingCart shoppingCart;

	@GetMapping("/dangnhap")
	public String login() {
		return "user/Login";
	}

	@GetMapping("/registry")
	public String dangky(Model model) {
		model.addAttribute("c", new customers());
		return "user/Registry";
	}

	@PostMapping("/checkRegistry")
	public String checkRegistry(@ModelAttribute("c") customers customers, Model model, HttpSession session) {
		if (customersService.getCustomersByUsername(customers.getUsername()) == null) {
			customersService.save(customers);
			model.addAttribute("user", customers);
			return "redirect:/home";
		} else {
			session.setAttribute("exit", "Tài khoản đã tồn tại");
			return "redirect:/login/registry";
		}

	}

	@PostMapping("/checkLogin")
	public String checkLogin(@RequestParam("uname") String uname, @RequestParam("pass") String pass, Model model,
			HttpServletRequest request, HttpSession ses) {
		customers customer = customersService.getCustomersByUsername(uname, pass);
		employees employee = employService.getEmployee(uname, pass);
		if (customer != null) {
			String string = "";
			model.addAttribute("user", customer);
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(String.valueOf(customer.getId()))) {
						string += cookie.getValue();
					}
				}
				if (string != "") {
					String[] arr = string.split("a");
					for (String string2 : arr) {
						String[] arr2 = string2.split(":");
						tg_product_size_color tg_product_size_color = tg_product_size_colorService.geTg_product_size_colorById(Integer.parseInt(arr2[0]));
						products products = productsService.getProductById(tg_product_size_color.getProduct_id());
						Monhang monhang = new Monhang(tg_product_size_color, Integer.parseInt(arr2[1]),
								products.getPrice());
						shoppingCart.setCustomers(customer);
						shoppingCart.getList().add(monhang);
					}
					ses.setAttribute("cart", shoppingCart.getList());
					Double total = total(shoppingCart.getList());
					ses.setAttribute("total", String.valueOf(total));
				}
			}
			return "redirect:/home";
		} else if (employee != null) {
			model.addAttribute("user", employee);
			return "redirect:/adminhome";
		} else {
			model.addAttribute("c", new customers());
			return "user/Login";
		}
	}

	public Double total(List<Monhang> list) {
		double sum = 0;
		for (Monhang monhang : list) {
			sum += monhang.getDongia() * monhang.getSoluong();
		}
		return sum;
	}
}
