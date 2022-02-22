package com.rose.bookclub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rose.bookclub.models.Book;
import com.rose.bookclub.models.User;


@Repository
public interface BookRepo extends CrudRepository<Book, Long> {
	List<Book> findAll();
	//there are many more methods we can use to query the database
	Optional<User> findByUser_id(String email);
	Optional<Book> findById(Long id);
}
