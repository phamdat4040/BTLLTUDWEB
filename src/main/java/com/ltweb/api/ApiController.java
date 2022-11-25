package com.ltweb.api;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ltweb.DTO.Monhang;
import com.ltweb.DTO.ShoppingCart;
import com.ltweb.DTO.dondathang_fAdmin;
import com.ltweb.DTO.monhang2;
import com.ltweb.DTO.Action.ShoppingCartDto;
import com.ltweb.Service.dondathang.dondathangService;
import com.ltweb.Service.products.productsService;
import com.ltweb.entity.customers;
import com.ltweb.entity.dondathang;
import com.ltweb.entity.products;

@RestController
public class ApiController {

	@Autowired
	private productsService productsService;
	@Autowired
	private ShoppingCartDto shoppingCartDto;
	
	@Autowired
	private ShoppingCart shoppingCart;
	@Autowired
	private dondathangService dondathangService;

	@PostMapping(path = "/loadFourProducts", produces = "text/plain; charset=UTF-8")
	public String getThreeProducts(HttpServletRequest request) {
		String string = "";
		int soluong = Integer.parseInt(request.getParameter("soluong"));
		List<products> list = productsService.getThreeProducts(soluong);
		for (products products : list) {
			string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
					+ products.getDescription() + "," + products.getPrice() + "," + products.getGender() + "+";
		}
		return string;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(path = "/delItemCart", produces = "text/plain; charset=UTF-8")
	public String delItemsCart(HttpServletRequest request, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("productid"));
		String s = "";
		double sum = 0;
		List<monhang2> list = (List<monhang2>) session.getAttribute("cart");
		for (monhang2 monhang : list) {
			if (monhang.getId() == id) {
				int vitri = list.indexOf(monhang);
				list.remove(vitri);
				shoppingCart.getList().remove(vitri);
				break;
			}
		}
		if (list.size() > 0) {
			for (monhang2 monhang : list) {

				s += monhang.getProducts().getImage() + "," + monhang.getProducts().getName() + ","
						+ monhang.getProducts().getPrice() + "," + monhang.getSoluong() + "," + monhang.getProducts().getId() + ","
						+ monhang.getProduct_Size().getSizeName() + "," + monhang.getProduct_Color().getColorName()
						+ ":";
				sum += monhang.getProducts().getPrice() * monhang.getSoluong();

			}

		} else {
			sum = 0;
		}
		s += String.valueOf(sum);
		return s;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/cong")
	public String congSoluong(HttpSession session, @RequestParam("pid") int id, HttpServletRequest request,
			HttpServletResponse response) {
		List<monhang2> list = (List<monhang2>) session.getAttribute("cart");
		customers customers = (customers) session.getAttribute("user");
		String soluongString = "";
		double sum = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId() == id) {
				list.get(i).setSoluong(list.get(i).getSoluong() + 1);
				soluongString = String.valueOf(list.get(i).getSoluong());
			}
			sum += (Float) (list.get(i).getSoluong() * list.get(i).getProducts().getPrice());
		}
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(String.valueOf(customers.getId()))) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		String txt = "";
		for (monhang2 monhang2 : list) {
			txt += String.valueOf(monhang2.getId()) + ":" + String.valueOf(monhang2.getSoluong()) + "a";
		}
		Cookie cookie = new Cookie(String.valueOf(customers.getId()), txt);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		soluongString += "," + String.valueOf(sum);
		return soluongString;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/tru")
	public String truSoluong(HttpSession session, @RequestParam("pid") int id, HttpServletRequest request,
			HttpServletResponse response) {
		List<monhang2> list = (List<monhang2>) session.getAttribute("cart");
		customers customers = (customers) session.getAttribute("user");
		String soluongString = "";
		double sum = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId() == id) {
				list.get(i).setSoluong(list.get(i).getSoluong() - 1);
				soluongString = String.valueOf(list.get(i).getSoluong());
			}
			sum += (Float) (list.get(i).getSoluong() * list.get(i).getProducts().getPrice());
		}
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(String.valueOf(customers.getId()))) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		String txt = "";
		for (monhang2 monhang2 : list) {
			txt += String.valueOf(monhang2.getId()) + ":" + String.valueOf(monhang2.getSoluong()) + "a";
		}
		Cookie cookie = new Cookie(String.valueOf(customers.getId()), txt);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		soluongString += "," + String.valueOf(sum);
		return soluongString;
	}

	@PostMapping(path = "/search", produces = "text/plain; charset=UTF-8")
	public String searchProduct(HttpServletRequest request) {
		String query = request.getParameter("query");
		System.out.println(query);
		List<products> list = productsService.searchProducts(query);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return string;
	}

	@GetMapping(path = "/firstThreeProducts", produces = "text/plain; charset=UTF-8")
	public String firstThreeProducts() {
		List<products> list = productsService.getThreeProducts(0);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
		}
		return string;
	}

	@PostMapping(path = "/loadProductById", produces = "text/plain; charset=UTF-8")
	public String loadProductById(HttpServletRequest request) {
		int cid = Integer.parseInt(request.getParameter("cid"));
		List<products> list = productsService.getListProductsByCateId(cid);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
		}
		return string;
	}

	@PostMapping(path = "/add", produces = "text/plain; charset=UTF-8")
	public String add(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		customers customers = (customers) session.getAttribute("user");
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		Integer sizeId = Integer.parseInt(request.getParameter("co"));
		Integer colorId = Integer.parseInt(request.getParameter("mau"));
		Integer quanlity = Integer.parseInt(request.getParameter("quantity"));

		shoppingCartDto.addItems(pid, sizeId, colorId, shoppingCart, customers, quanlity);
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(String.valueOf(customers.getId()))) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		String txt = "";
		for (Monhang monhang2 : shoppingCart.getList()) {
			txt += String.valueOf(monhang2.getTg_product_size_color().getId()) + ":" + String.valueOf(monhang2.getSoluong()) + "a";
		}
		Cookie cookie = new Cookie(String.valueOf(customers.getId()), txt);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		session.setAttribute("cart", shoppingCart.getList());
		return txt;
	}
	
	
	
	@PostMapping(path = "/chitiet", produces = "text/plain; charset=UTF-8")
	public String chitiet(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("query"));
		System.out.println(id);
		String s = "";
		List<dondathang> list = dondathangService.getListDonDatHangByCustomerName(id);
		s+="<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n"
				+ "	    <div class=\"modal-content\" style=\"color: black; width: 500px; text-align: center;\">\r\n"
				+ "	      <div class=\"modal-header\">\r\n"
				+ "	        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Chi tiáº¿t Ä‘Æ¡n hÃ ng</h5>\r\n"
				+ "	        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n"
				+ "	          <span aria-hidden=\"true\">&times;</span>\r\n"
				+ "	        </button>\r\n"
				+ "	      </div>\r\n"
				+ "	      <div class=\"modal-body\">\r\n"
				+ "	        <table style=\"border: 1px ; width: 100%\">\r\n"
				+ "	        	<tr style=\"margin-left: 20px\">\r\n"
				+ "	        		<th style=\\\"margin-left: 60px\\\">Product Name</th>\r\n"
				+ "	        		<th>Size-MÃ u sáº¯c</th>\r\n"
				+ "	        		<th>Sá»‘ lÆ°á»£ng</th>\r\n"
				+ "	        		<th>Ä�Æ¡n giÃ¡</th>\r\n"
				+ "	        	</tr>";
		for (dondathang dondathang : list) {
			s+="<tr>\r\n"
					+ "        			<td>"+dondathang.getProductName()+"</td>\r\n"
					+ "        			<td>"+dondathang.getSizeName()+" - "+dondathang.getColorName()+"</td>\r\n"
					+ "        			<td>"+dondathang.getSoluong()+"</td>\r\n"
					+ "        			<td>"+dondathang.getDongia()+"</td>\r\n"
					+ "        		</tr>";
		}
		s+="</table>\r\n"
				+ "	      </div>\r\n"
				+ "	      <div class=\"modal-footer\">\r\n"
				+ "	        <button type=\"button\" onclick=\"testt("+id+")\" class=\"btn btn-success text-red\" data-dismiss=\"modal\">Duyá»‡t Ä‘Æ¡n</button>\r\n"
				+ "	      </div>\r\n"
				+ "	    </div>\r\n"
				+ "	  </div>";
		return s;
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(path="/duyetdon", produces = "text/plain; charset=UTF-8")
	public String duyetdon(HttpServletRequest request, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("status"));
		System.out.println(id);
		HashMap<Integer, dondathang_fAdmin> hashMap = (HashMap<Integer, dondathang_fAdmin>)session.getAttribute("listOrders");
		for (dondathang dondathang : hashMap.get(id).getList()) {
			dondathang.setStatus(1);
			
		}
		dondathangService.add(hashMap.get(id).getList());
		String string = "<td id=\""+String.valueOf(id+1000)+"\">\r\n"
				+ "										<div style=\"margin-right: 10px;\"><i class=\"fas fa-check-square\" style=\"font-size: 20px; color: #33FF4F; margin-right: 10px;\"></i>  Ä�Ã£ duyá»‡t Ä‘Æ¡n</div>\r\n"
				+ "									</td>";
		return string; 
	}
}
