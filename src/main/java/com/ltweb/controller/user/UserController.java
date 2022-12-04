package com.ltweb.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ltweb.DTO.Monhang;
import com.ltweb.DTO.monhang2;
import com.ltweb.Service.categories.categoriesService;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.entity.categories;
import com.ltweb.entity.product_Color;
import com.ltweb.entity.products;

@Controller
@SessionAttributes({"user", "cart", "total"})
public class UserController {

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

	@GetMapping({ "/", "/shop", "/home" })
	public ModelAndView shop(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("user/shop");
		List<categories> listC = categoriesService.list();
		modelAndView.addObject("listC", listC);
		List<monhang2> listMonhang2 = new ArrayList<monhang2>();
		modelAndView.addObject("cart", listMonhang2);
		double sum = 0;
		modelAndView.addObject("total", sum);
		products products = productsService.getLastProducts();
		modelAndView.addObject("p", products);
		List<products> listP = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listP);
		return modelAndView;
	}


	@GetMapping({ "/product" })
	public ModelAndView product(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("user/product");
		List<products> listFourProducts = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listFourProducts);
		return modelAndView;
	}

	@GetMapping({ "/about" })
	public ModelAndView about() {
		ModelAndView modelAndView = new ModelAndView("user/about");
		return modelAndView;
	}

	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("pid")int pid) {
		ModelAndView modelAndView = new ModelAndView("user/Detail");
		products products = productsService.getProductById(pid);
		modelAndView.addObject("p", products);
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart")
	public ModelAndView shopingcart(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("/user/ShoppingCart");
		List<monhang2> list = (List<monhang2>)session.getAttribute("cart");
		modelAndView.addObject("cart", list);
		return modelAndView;
	}
}
