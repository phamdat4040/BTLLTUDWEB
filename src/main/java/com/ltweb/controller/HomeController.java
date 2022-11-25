package com.ltweb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ltweb.DTO.Monhang;
import com.ltweb.Service.categories.categoriesService;
import com.ltweb.Service.products.productsService;
import com.ltweb.entity.categories;
import com.ltweb.entity.products;

@Controller
@SessionAttributes("user")
public class HomeController {

	@Autowired
	private productsService productsService;
	@Autowired
	private categoriesService categoriesService;

	@SuppressWarnings("unchecked")
	@GetMapping("/dangxuat")
	public String dangxuat(HttpSession session) {
		session.removeAttribute("user");
		List<Monhang> list = (List<Monhang>) session.getAttribute("cart");
		if (list != null) {
			list.clear();
		}
		session.setAttribute("cart", list);
		return "redirect:/";
	}

<<<<<<< HEAD
	@GetMapping({ "/", "/home" })
	public ModelAndView shopp() {
		ModelAndView modelAndView = new ModelAndView("shop");
=======
	@GetMapping({ "/", "/shop", "/home" })
	public ModelAndView shop() {
		ModelAndView modelAndView = new ModelAndView("user/shop");
>>>>>>> 67d9185d47f8d92d8c3e1505fd9a48b064fd7e58
		List<categories> listC = categoriesService.list();
		modelAndView.addObject("listC", listC);
		products products = productsService.getLastProducts();
		modelAndView.addObject("p", products);
		List<products> listP = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listP);
		return modelAndView;
	}
	
	@GetMapping("/shop")
	public ModelAndView shop() {
		ModelAndView modelAndView = new ModelAndView("user/product");
		List<products> listFourProducts = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listFourProducts);
		return modelAndView;
	}
	
	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("pid") int pid) {
		ModelAndView modelAndView = new ModelAndView("user/detail");
		products products = productsService.getProductById(pid);
		List<categories> listC = categoriesService.list();
		modelAndView.addObject("listC", listC);
		products productss = productsService.getLastProducts();
		modelAndView.addObject("last", productss);
		modelAndView.addObject("p", products);
		return modelAndView;
	}

}
