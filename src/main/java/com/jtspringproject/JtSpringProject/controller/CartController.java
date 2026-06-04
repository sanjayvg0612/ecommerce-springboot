package com.jtspringproject.JtSpringProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jtspringproject.JtSpringProject.models.Cart;
import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.CartProductId;
import com.jtspringproject.JtSpringProject.models.Product;
import com.jtspringproject.JtSpringProject.models.User;
import com.jtspringproject.JtSpringProject.services.cartService;
import com.jtspringproject.JtSpringProject.services.productService;
import com.jtspringproject.JtSpringProject.services.userService;
import com.jtspringproject.JtSpringProject.dao.cartProductDao;

@Controller
public class CartController {

	private final cartService cartService;
	private final productService productService;
	private final userService userService;
	private final cartProductDao cartProductDao;

	@Autowired
	public CartController(cartService cartService, productService productService, userService userService, cartProductDao cartProductDao) {
		this.cartService = cartService;
		this.productService = productService;
		this.userService = userService;
		this.cartProductDao = cartProductDao;
	}

	@GetMapping("/cart")
	public ModelAndView viewCart() {
		ModelAndView mv = new ModelAndView("cartproduct");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.getUserByUsername(username);

		if (user == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}

		Cart cart = cartService.getCartByCustomer(user);
		if (cart == null) {
			cart = new Cart();
			cart.setCustomer(user);
			cartService.addCart(cart);
		}

		List<Product> products = cartProductDao.getProductByCartID(cart.getId());
		int totalPrice = 0;
		for (Product p : products) {
			totalPrice += p.getPrice();
		}

		mv.addObject("products", products);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("cart", cart);
		mv.addObject("username", username);
		return mv;
	}

	@GetMapping("/cart/add")
	public String addToCartGet(@RequestParam("id") int productId) {
		return addToCart(productId);
	}

	@PostMapping("/cart/add")
	public String addToCartPost(@RequestParam("id") int productId) {
		return addToCart(productId);
	}

	private String addToCart(int productId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.getUserByUsername(username);

		if (user == null) {
			return "redirect:/login";
		}

		Cart cart = cartService.getCartByCustomer(user);
		if (cart == null) {
			cart = new Cart();
			cart.setCustomer(user);
			cartService.addCart(cart);
		}

		Product product = productService.getProduct(productId);
		if (product == null) {
			return "redirect:/user/products";
		}

		CartProductId cartProductId = new CartProductId(cart.getId(), product.getId());
		CartProduct existing = cartProductDao.getCartProduct(cartProductId);

		if (existing == null) {
			CartProduct cartProduct = new CartProduct(cart, product);
			cartProductDao.addCartProduct(cartProduct);
		}

		return "redirect:/cart";
	}

	@GetMapping("/cart/delete")
	public String deleteFromCartGet(@RequestParam("id") int productId) {
		return deleteFromCart(productId);
	}

	@PostMapping("/cart/delete")
	public String deleteFromCartPost(@RequestParam("id") int productId) {
		return deleteFromCart(productId);
	}

	private String deleteFromCart(int productId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.getUserByUsername(username);

		if (user == null) {
			return "redirect:/login";
		}

		Cart cart = cartService.getCartByCustomer(user);
		if (cart != null) {
			CartProductId id = new CartProductId(cart.getId(), productId);
			CartProduct cartProduct = cartProductDao.getCartProduct(id);
			if (cartProduct != null) {
				cartProductDao.deleteCartProduct(cartProduct);
			}
		}

		return "redirect:/cart";
	}

	@GetMapping("/buy")
	public ModelAndView checkoutGet() {
		ModelAndView mv = new ModelAndView("buy");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.getUserByUsername(username);

		if (user == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}

		Cart cart = cartService.getCartByCustomer(user);
		if (cart == null) {
			mv.setViewName("redirect:/cart");
			return mv;
		}

		List<Product> products = cartProductDao.getProductByCartID(cart.getId());
		int totalPrice = 0;
		for (Product p : products) {
			totalPrice += p.getPrice();
		}

		mv.addObject("products", products);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("username", username);
		mv.addObject("email", user.getEmail());
		mv.addObject("address", user.getAddress());
		return mv;
	}

	@PostMapping("/buy")
	public ModelAndView checkoutPost() {
		ModelAndView mv = new ModelAndView("redirect:/");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userService.getUserByUsername(username);

		if (user != null) {
			Cart cart = cartService.getCartByCustomer(user);
			if (cart != null) {
				cartProductDao.deleteCartProductsByCartID(cart.getId());
			}
		}

		mv.addObject("msg", "Order placed successfully! Thank you for shopping with us.");
		return mv;
	}
}
