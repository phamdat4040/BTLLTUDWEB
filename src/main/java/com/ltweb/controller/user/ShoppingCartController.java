package com.ltweb.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ltweb.DTO.Monhang;
import com.ltweb.DTO.ShoppingCart;
import com.ltweb.DTO.monhang2;
import com.ltweb.DTO.Action.ShoppingCartDto;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.entity.product_Color;
import com.ltweb.entity.product_Size;
import com.ltweb.entity.products;

@Controller
public class ShoppingCartController {

	@Autowired
	private ShoppingCartDto shoppingCartDto;
	@Autowired
	private productsService productsService;
	@Autowired
	private product_SizeService product_SizeService;
	@Autowired
	private product_ColorService product_ColorService;

	@Autowired
	private ShoppingCart shoppingCart;

	@GetMapping("/showCart")
	public String showCart(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "user/Login";
		} else {
			if (shoppingCart.getList().size() != 0) {
				List<monhang2> listMonhang2 = new ArrayList<monhang2>();
				for (Monhang monhang : shoppingCart.getList()) {
					products products = productsService
							.getProductById(monhang.getTg_product_size_color().getProduct_id());
					product_Size product_Size = product_SizeService
							.getProduct_SizeById(monhang.getTg_product_size_color().getSize_id());
					product_Color product_Color = product_ColorService
							.getProduct_ColorById(monhang.getTg_product_size_color().getIdcolor_id());
					monhang2 monhang2 = new monhang2(products, product_Size, product_Color, monhang.getSoluong());
					listMonhang2.add(monhang2);
				}
				session.setAttribute("cart", listMonhang2);
				double sum = 0;
				for (monhang2 monhang : listMonhang2) {
					sum += monhang.getProducts().getPrice() * monhang.getSoluong();
				}
				session.setAttribute("total", String.valueOf(sum));
				session.setAttribute("total1", String.valueOf(sum + 10.0));
			} else {
				session.setAttribute("total", String.valueOf(0));
				session.setAttribute("total1", String.valueOf(0));
			}
			return "user/ShoppingCart";
		}

	}

	@SuppressWarnings("unchecked")
	@GetMapping("/buy")
	public ModelAndView Payment(HttpSession session, HttpServletRequest request) {
		double sum = 0;
		List<monhang2> list = (List<monhang2>) session.getAttribute("cart");
		for (monhang2 monhang : list) {
			sum += monhang.getProducts().getPrice() * monhang.getSoluong();
		}
		ModelAndView modelAndView = new ModelAndView("user/Payment");
		modelAndView.addObject("payment", list);
		modelAndView.addObject("tongcong", sum + 10);
		return modelAndView;
	}

}
