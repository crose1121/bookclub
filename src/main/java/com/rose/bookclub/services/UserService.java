package com.rose.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.rose.bookclub.models.Book;
import com.rose.bookclub.models.LoginUser;
import com.rose.bookclub.models.User;
import com.rose.bookclub.repositories.BookRepo;
import com.rose.bookclub.repositories.UserRepo;



@Service
public class UserService {
	@Autowired
	UserRepo userRepo;
	@Autowired
	BookRepo bookRepo;
	
	//first two Service methods are always REGISTER AND LOGIN!!!!
	
	//these will take 2 arguments, user object and errors
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "EmailTaken", "This email is already in use. Login?");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "NoMatchy", "Passwords don't match");
		}
		if(result.hasErrors()) {
			return null;
		}
		else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
		}
	}
	
	public User login(LoginUser loginObj, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(loginObj.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "EmailNotFound", "This email does not exist yet. Register?");
		}
		else {
			if(!BCrypt.checkpw(loginObj.getPassword(), potentialUser.get().getPassword())) {
				result.rejectValue("password", "NoMatchy","Invalid Password");
			}
		}
		if(result.hasErrors()) {
			return null;
		}
		else {
			return potentialUser.get();
		}
	}
	
	public User findOneUser(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
	public List<Book> findAllBooks() {
		return bookRepo.findAll();
	}
	
	public Book findOneBook(Long id) {
		return bookRepo.findById(id).orElse(null);
	}
	
	public Book updateBook(Book book) {
		return bookRepo.save(book);
	}
}