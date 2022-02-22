package com.rose.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.rose.bookclub.models.Book;
import com.rose.bookclub.models.LoginUser;
import com.rose.bookclub.models.User;
import com.rose.bookclub.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser",new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		
		User user = userService.register(newUser, result);
		
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}		
		session.setAttribute("loggedInUserID", user.getId());
		session.setAttribute("loggedInUserName", user.getUsername());
		session.setAttribute("isLoggedIn", true);
		return "redirect:/books";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,BindingResult result, Model model, HttpSession session) {
		User user = userService.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("loggedInUserID", user.getId());
		session.setAttribute("loggedInUserName", user.getUsername());
		session.setAttribute("isLoggedIn", true);
		return "redirect:/books";
	}
	
	@GetMapping("/books")
	public String home(HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("loggedInUserID");
		
		if(id==null) {
			return "redirect:/";
		}
		
		User loggedInUser = userService.findOneUser(id);
		model.addAttribute("loggedInUser", loggedInUser);
		model.addAttribute("allBooks", userService.findAllBooks());
		return "dashboard.jsp";
	}
	
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("loggedInUserID");
		
		User loggedInUser = userService.findOneUser(id);
		model.addAttribute("loggedInUser", loggedInUser);
		return "newbook.jsp";
	}
	
	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "newbook.jsp";
		}
		else {
			User currentUser = userService.findOneUser((Long) session.getAttribute("loggedInUserID"));
			book.setUser(currentUser);
			userService.createBook(book);
			return "redirect:/books";
		}
	}
	
	@GetMapping("/books/{id}")
	public String displayBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		
		if (session.getAttribute("loggedInUserID")==null) {
			return "redirect:/";
		}
		Book currentBook = userService.findOneBook(id);
		User loggedInUser = userService.findOneUser( (Long) session.getAttribute("loggedInUserID"));
		model.addAttribute("loggedInUser", loggedInUser);		
		model.addAttribute("book", currentBook);
		return "details.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("book", userService.findOneBook(id));
		return "edit.jsp";
	}
	
	@PutMapping("/books/{id}/update")
	public String updateBook(
			@PathVariable("id") Long id,
			@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		User currentUser = userService.findOneUser((Long) session.getAttribute("loggedInUserID"));
		book.setUser(currentUser);
		userService.updateBook(book);
		return "redirect:/books";
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}