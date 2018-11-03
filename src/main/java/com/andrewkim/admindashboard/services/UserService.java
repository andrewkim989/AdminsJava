package com.andrewkim.admindashboard.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.andrewkim.admindashboard.models.Role;
import com.andrewkim.admindashboard.models.User;
import com.andrewkim.admindashboard.repositories.RoleRepository;
import com.andrewkim.admindashboard.repositories.UserRepository;

@Service
public class UserService {
	private UserRepository userRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserService(UserRepository userRepository,
    		RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
    
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }
    
    public List <User> allUser() {
    	return userRepository.findAll();
    }
    
    public List <Role> allRoles() {
    	return roleRepository.findAll();
    }
    
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public User findUserById(Long id) {
    	Optional<User> u = userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	}
    	else {
    	    return null;
    	}
    }
    
    public void deleteAccount (Long id) {
    	userRepository.deleteById(id);
    }
    
    public void userToAdmin (User user) {
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }
}
