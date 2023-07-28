package assignment.java5.Interface;

import org.springframework.data.jpa.repository.JpaRepository;

import assignment.java5.entity.Account;

public interface AccountDAO extends JpaRepository<Account,String> {

}
